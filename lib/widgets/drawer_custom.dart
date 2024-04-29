import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:student_housing_mobile/backend/backend.dart';
import 'package:student_housing_mobile/backend/user_info.dart';
import 'package:student_housing_mobile/widgets/universal_signout_button.dart';
import 'package:student_housing_mobile/widgets/filtermenu_widget.dart';

class CustomDrawer extends StatefulWidget {
  final List<Map<String, dynamic>> documents;
  final bool visitorsAllowedSelected;
  final bool petsAllowedSelected;
  final double minPrice;
  final double maxPrice;
  final double minLimitPrice;
  final double maxLimitPrice;
  final String nameFilter;
  final VoidCallback onResetFilters;
  final void Function(Map<String, dynamic>) onUpdateFilters;

  const CustomDrawer({
    super.key,
    required this.documents,
    required this.visitorsAllowedSelected,
    required this.petsAllowedSelected,
    required this.minPrice,
    required this.maxPrice,
    required this.onResetFilters,
    required this.minLimitPrice, 
    required this.maxLimitPrice, 
    required this.onUpdateFilters, required this.nameFilter, 
  });

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  final BackEnd _backEnd = BackEnd();

  @override
  Widget build(BuildContext context) {
    double? highestPrice;
    double? lowestPrice;

    for (var document in widget.documents) {
      double? pricing = document['pricing']?.toDouble();
      if (pricing != null) {
        if (highestPrice == null || pricing > highestPrice) {
          highestPrice = pricing;
        }
        if (lowestPrice == null || pricing < lowestPrice) {
          lowestPrice = pricing;
        }
      }
    }

    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            FilterMenu(
              minPrice: widget.minPrice,
              maxPrice: widget.maxPrice,
              visitorsAllowedSelected: widget.visitorsAllowedSelected,
              petsAllowedSelected: widget.petsAllowedSelected,
              nameFilter: widget.nameFilter,
              minLimitPrice: widget.minLimitPrice, 
              maxLimitPrice: widget.maxLimitPrice,
              onUpdateFilters: widget.onUpdateFilters, 
              onResetFilters: widget.onResetFilters, 
            ),
            const Divider(),
            FutureBuilder<User?>(
              future: _backEnd.getCurrentUser(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Drawer Custom Error: ${snapshot.error}');
                } else {
                  return UserInfoWidget(user: snapshot.data);
                }
              },
            ),
            SignOutButton(),
          ],
        ),
      ),
    );
  }
}
