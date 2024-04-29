import 'package:flutter/material.dart';

class RoomWidget extends StatelessWidget {
  final String imageUrl;
  final String title;
  final double pricing;

  const RoomWidget({
    required this.imageUrl,
    required this.title,
    required this.pricing,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4, // Adjust the elevation as needed
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1, // Square aspect ratio
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 8), // Adjust spacing as needed
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              'Pricing: $pricing',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
      ),
    );
  }
}
