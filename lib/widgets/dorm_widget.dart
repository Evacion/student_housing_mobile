import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:student_housing_mobile/widgets/carousel_widget.dart';

class DormWidget extends StatelessWidget {
  final Map<String, dynamic> document;

  const DormWidget({super.key, required this.document});

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print(document['rooms']?['0']);
    }

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

    List<dynamic>? roomsList = document['rooms']?.values.toList();
    List<dynamic>? vacantRooms = roomsList?.where((room) => room?['isVacant'] == true).toList();
    List<dynamic> roomPhotoUrls = [];
    if (roomsList != null) {
      for (var room in roomsList) {
        if (room is Map && room.containsKey('roomPhotoUrl')) {
          var roomPhotos = room['roomPhotoUrl'];
          if (roomPhotos is List) {
            roomPhotoUrls.addAll(roomPhotos);
          } else if (roomPhotos != null) {
            roomPhotoUrls.add(roomPhotos);
          }
        }
      }
    }

    var roomsVacant = vacantRooms?.length ?? 0;
    var roomsOccupied = roomsList?.length ?? 0 - (vacantRooms?.length ?? 0);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dorms'),
      ),
      body: SingleChildScrollView(
              child: Column(
                children: [
                  housePhotos.isNotEmpty ? SizedBox(
                    height: 400,
                    child: CustomCarousel(
                      initialPage: 1,
                      imagePaths: housePhotos.cast<String>(),
                    ),
                  )
                  : const SizedBox(
                      height: 40,
                      child: Text("No Photos Available")
                    ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Container(
                      width: double.infinity,
                      constraints: const BoxConstraints(maxWidth: 800),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        boxShadow:  [
                          BoxShadow(
                            blurRadius: 3,
                            color: Colors.black.withOpacity(0.2),
                            offset: const Offset(0, 1),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              document['name'] ?? '',
                              style: const TextStyle(
                                fontFamily: 'Outfit',
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      const TextSpan(
                                        text: 'Unavailable Rooms: ',
                                      ),
                                      TextSpan(
                                        text: "$roomsOccupied",
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      const TextSpan(
                                        text: 'Rooms Available: ',
                                      ),
                                      TextSpan(
                                        text: '$roomsVacant',
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            // const SizedBox(height: 8),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   children: [
                            //     RichText(
                            //       text: TextSpan(
                            //         children: [
                            //           const TextSpan(
                            //             text: 'Has Bathroom: ',
                            //           ),
                            //           TextSpan(
                            //             text: "$document['']",
                            //           ),
                            //         ],
                            //       ),
                            //     ),
                            //   ],
                            // ),
                            const Divider(height: 16, thickness: 1),
                            Row(
                              children: [
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(Icons.meeting_room),
                                      const SizedBox(width: 4),
                                      Text('${roomsList?.length ?? 0}'),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const Divider(height: 16, thickness: 1),
                            const Text('Rate'),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text("Php ${document['pricing'] ?? ''} per month"),
                                  ],
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    // Handle button press
                                  },
                                  child: const Text('Inquire'),
                                ),
                              ],
                            ),
                            const Divider(height: 16, thickness: 1),
                            const Text('Contact via'),
                            Container(
                              width: double.infinity,
                              height: 60,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: Theme.of(context).primaryColor,
                                  width: 2,
                                ),
                              ),
                              child: Row(
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Mobile: ${document['contactMobile'] ?? ''}',
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                      Text(
                                        'Email: ${document['contactEmail'] ?? ''}',
                                        style: const TextStyle(fontSize: 12),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const Divider(height: 16, thickness: 1),
                            const Text('Description'),
                            const SizedBox(height: 8),
                            Text(
                              '${document['description'] ?? ''}',
                              style: const TextStyle(fontSize: 14),
                            ),
                            const Divider(height: 16, thickness: 1),
                            const Text('Room Photos'),
                            roomPhotoUrls.isNotEmpty
                                ? SizedBox(
                                    height: 200,
                                    child: CustomCarousel(
                                      initialPage: 1,
                                      imagePaths: roomPhotoUrls.cast<String>(),
                                    ),
                                  )
                                : const Text("No Photos Available"),
                            const SizedBox(height: 8),
                            const Text('Address'),
                            const SizedBox(height: 4),
                            const Text('Davao'),
                            const SizedBox(height: 8),
                            Container(
                              width: double.infinity,
                              height: 140,
                              decoration: BoxDecoration(
                                color: Colors.blue.shade200,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: Colors.blueAccent,
                                ),
                              ),
                              child: const Center(
                                child: Text(
                                  'Map goes here...',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
