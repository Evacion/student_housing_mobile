import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:student_housing_mobile/widgets/dorm_widget.dart';

class CustomListTile extends StatelessWidget {
  final Map<String, dynamic> document;

  const CustomListTile({super.key, required this.document});

  @override
  Widget build(BuildContext context) {
    dynamic housePhotos = document['housePhotoUrl'];
    if (housePhotos != null) {
      if (housePhotos is Map) {
        housePhotos = housePhotos.values.toList();
      }
      if (housePhotos is! List) {
        housePhotos = [housePhotos];
      }
    } else {
      // Handle the case where document['housePhotoUrl'] is null
      housePhotos = []; // or any other default value
    }

    return ListTile(
      title: Card(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
                child: housePhotos.isNotEmpty
                    ? Image.network(
                        housePhotos[0],
                        width: double.infinity,
                        height: 100,
                        fit: BoxFit.cover,
                      )
                    : const SizedBox(
                        height: 30,
                        child: Text("No House Photos Available")
                    ), // Handle null or empty list
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      "${document['name'] ?? ''}",
                      style: const TextStyle(
                        fontFamily: 'Outfit',
                        color: Color(0xFF14181B),
                        fontSize: 22,
                        letterSpacing: 0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      "${document['pricing'] ?? ''} PHP",
                      style: const TextStyle(
                        fontFamily: 'Readex Pro',
                        // color: ThemeData().primaryColor,
                        fontSize: 12,
                        letterSpacing: 0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Text(
                        "${document['description'] ?? ''}",
                        style: const TextStyle(
                          fontFamily: 'Readex Pro',
                          color: Color(0xFF57636C),
                          fontSize: 14,
                          letterSpacing: 0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 4),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (kDebugMode) {
                          print("Kuumongus: ${document['rooms']}");
                        }
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DormWidget(document: document),
                          ),
                        );
                      },
                      child: const Text("See More"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
