import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CustomCarousel extends StatelessWidget {
  final CarouselController? carouselController;
  final int initialPage;
  final List<String> imagePaths;
  final void Function(int, CarouselPageChangedReason)? onPageChanged;
  final double itemSpacing;

  const CustomCarousel({
    super.key,
    this.carouselController,
    required this.initialPage,
    required this.imagePaths,
    this.onPageChanged,
    this.itemSpacing = 10.0, // Default spacing value
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 387,
      child: CarouselSlider.builder(
        itemCount: imagePaths.length,
        itemBuilder: (context, index, _) {
          final imagePath = imagePaths[index];
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: itemSpacing / 2),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
          );
        },
        carouselController: carouselController,
        options: CarouselOptions(
          initialPage: initialPage,
          viewportFraction: 0.5,
          disableCenter: true,
          enlargeCenterPage: true,
          enlargeStrategy: CenterPageEnlargeStrategy.height,
          enableInfiniteScroll: true,
          scrollDirection: Axis.horizontal,
          autoPlay: false,
          onPageChanged: onPageChanged,
        ),
      ),
    );
  }
}
