import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CustomListTile extends StatelessWidget {
  final Map<String, dynamic> document;

  const CustomListTile({super.key, required this.document});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: GestureDetector(
        onTap: () {
          if (kDebugMode) {
            print("Kuumongus: ${document}");
          }
        },
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Hero(
                tag: 'italyImage_${document['id']}',
                transitionOnUserGestures: true,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                  child: Image.network(
                    document['housePhotoUrl'][0],
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      document['name'],
                      style: const TextStyle(
                        fontFamily: 'Plus Jakarta Sans',
                        color: Color(0xFF14181B),
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        // RatingBarIndicator(
                        //   itemBuilder: (context, index) => const Icon(
                        //     Icons.radio_button_checked_rounded,
                        //     color: Color(0xFF14181B),
                        //   ),
                        //   direction: Axis.horizontal,
                        //   rating: document['rating'],
                        //   unratedColor: const Color(0xFF57636C),
                        //   itemCount: 5,
                        //   itemSize: 16,
                        // ),
                        // const SizedBox(width: 8),
                        Text(
                          '${document['description']}',
                          style: const TextStyle(
                            fontFamily: 'Plus Jakarta Sans',
                            color: Color(0xFF14181B),
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
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
