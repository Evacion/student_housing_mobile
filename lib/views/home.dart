import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:student_housing_mobile/widgets/drawer_custom.dart';
import 'package:student_housing_mobile/widgets/list_tile_custom.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Map<String, dynamic>> documents = [];
  late bool isLoading = false;
  late bool hasError = false;
  late bool visitorsAllowedSelected;
  late bool petsAllowedSelected;
  late double minPrice;
  late double maxPrice;
  late double minLimitPrice;
  late double maxLimitPrice;
  late String nameFilter;
  late String errorMessage = '';

  @override
  void initState() {
    super.initState();
    visitorsAllowedSelected = false;
    petsAllowedSelected = false;
    minPrice = double.infinity;
    maxPrice = 0;
    minLimitPrice = double.infinity;
    maxLimitPrice = 0;
    nameFilter = "Enter Name";
    fetchData();
  }

  Future<void> fetchData() async {
    if (isLoading) {
      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      final querySnapshot = await FirebaseFirestore.instance.collection('student housings').get();
      documents = querySnapshot.docs.map((doc) => doc.data()).toList();

      for (var document in documents) {
        double? pricing = document['pricing']?.toDouble();
        if (pricing != null) {
          if (pricing > maxLimitPrice) {
            maxLimitPrice = pricing;
            maxPrice = pricing;
          }
          if (pricing < minLimitPrice) {
            minLimitPrice = pricing;
            minPrice = pricing;
          }
        }
      }
    } catch (e) {
      setState(() {
        hasError = true;
        errorMessage = e.toString();
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  List<Map<String, dynamic>> filterDocuments({
    required bool visitorsAllowedSelected,
    required bool petsAllowedSelected,
    required double minPrice,
    required double maxPrice,
    required double minLimitPrice,
    required double maxLimitPrice,
    required String nameFilter,
  }) {
    var filteredDocs = documents.where((doc) {
      bool passesFilters = true;
      
      bool isVisible = doc['isVisible'];

      bool isVisit = doc['isVisitorsAllowed'];
      bool isPet = doc['isPetsAllowed'];
      double? pricing = doc['pricing']?.toDouble();
      String? name = doc['name']?.toString().toLowerCase() ?? "";

      if (isVisible){
        // If both visitorsAllowedSelected and petsAllowedSelected are selected,
        // check if the document allows both visitors and pets
        if (visitorsAllowedSelected && petsAllowedSelected) {
          passesFilters = isVisit && isPet;
        }

        // If only visitorsAllowedSelected is selected,
        // check if the document allows visitors but not pets
        if (visitorsAllowedSelected && !petsAllowedSelected) {
          passesFilters = isVisit && !isPet;
        }

        // If only petsAllowedSelected is selected,
        // check if the document allows pets but not visitors
        if (!visitorsAllowedSelected && petsAllowedSelected) {
          passesFilters = !isVisit && isPet;
        }

        // Check if the pricing falls outside the specified range
        if (minPrice != minLimitPrice && maxPrice != maxLimitPrice) {
          if (pricing != null && (pricing > minPrice && pricing < maxPrice)) {
            passesFilters = false;
          }
        }

        // Check if the document name contains the name filter string
        if (nameFilter.isNotEmpty && !name.contains(nameFilter.toLowerCase())) {
          passesFilters = false;
        }

        if (!visitorsAllowedSelected && !petsAllowedSelected && (nameFilter == "Enter Name" || nameFilter == "") && (minPrice == minLimitPrice && maxPrice == maxLimitPrice)) {
          passesFilters = true;
        }
        // Return true only if all conditions are met
        return passesFilters;
      } else {
        return false;
      }

    }).toList();
    setState(() {
      isLoading = false;
    });
    return filteredDocs;
  }

  void updateFilters(Map<String, dynamic> filterParams) {
    setState(() {
      fetchData();
      visitorsAllowedSelected = filterParams['visitorsAllowedSelected'] ?? visitorsAllowedSelected;
      petsAllowedSelected = filterParams['petsAllowedSelected'] ?? petsAllowedSelected;
      minPrice = filterParams['minPrice'] ?? minPrice;
      maxPrice = filterParams['maxPrice'] ?? maxPrice;
      nameFilter = filterParams['nameFilter'] ?? nameFilter;
      // Now call filterDocuments with the updated filter values
      documents = filterDocuments(
        visitorsAllowedSelected: visitorsAllowedSelected,
        petsAllowedSelected: petsAllowedSelected,
        minPrice: minPrice,
        maxPrice: maxPrice,
        minLimitPrice: minLimitPrice,
        maxLimitPrice: maxLimitPrice,
        nameFilter: nameFilter,
      );
    });

    if (kDebugMode) {
      print("<<<<<<<<<<<<<<<<<<<<UPDATED DATA HERE>>>>>>>>>>>>>>>>>>>");
      // print(filterParams);
    }
  }

  void resetFilters() {
    setState(() {
      documents = [];
      isLoading = true;
      hasError = false;
      errorMessage = "";
      visitorsAllowedSelected = false;
      petsAllowedSelected = false;
      minPrice = double.infinity;
      maxPrice = 0;
      nameFilter = "Enter Name";
    });
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (BuildContext context) => const HomePage()),
    );
  }


  @override
  Widget build(BuildContext context) {
    final screenOrient = MediaQuery.of(context).orientation;
    final screenSize = MediaQuery.of(context).size;
    final filteredDocuments = filterDocuments(
      visitorsAllowedSelected: visitorsAllowedSelected,
      petsAllowedSelected: petsAllowedSelected,
      minPrice: minPrice,
      maxPrice: maxPrice,
      minLimitPrice: minLimitPrice, 
      maxLimitPrice: maxLimitPrice,
      nameFilter: nameFilter, 
    );

    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Housing for Students')),
      ),
      endDrawer: isLoading
          ? Container()
          : CustomDrawer(
              documents: documents,
              visitorsAllowedSelected: visitorsAllowedSelected,
              petsAllowedSelected: petsAllowedSelected,
              minPrice: minPrice,
              maxPrice: maxPrice,
              minLimitPrice: minLimitPrice,
              maxLimitPrice: maxLimitPrice,
              onResetFilters: resetFilters,
              onUpdateFilters: updateFilters,
              nameFilter: nameFilter,
            ),
      body: Center(
        child: isLoading
            ? const CircularProgressIndicator()
            : hasError
                ? Text('Error: $errorMessage')
                : screenOrient == Orientation.portrait
                    ? buildListView(screenSize, filteredDocuments)
                    : buildGridView(screenSize, filteredDocuments),
      ),
    );
  }

  Widget buildListView(Size screenSize, List<Map<String, dynamic>> documents) {
    return ListView.builder(
      itemCount: documents.length,
      itemBuilder: (context, index) {
        final data = documents[index];
        return CustomListTile(document: data);
      },
    );
  }

  Widget buildGridView(Size screenSize, List<Map<String, dynamic>> documents) {
    return GridView.count(
      crossAxisCount: 4,
      childAspectRatio: screenSize.height / screenSize.width,
      children: documents
        .map((data) => CustomListTile(document: data))
        .toList(),
    );
  }
}
