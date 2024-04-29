import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CustomCarousel extends StatelessWidget {
  final CarouselController? carouselController;
  final int initialPage;
  final List<String> imagePaths;
  final void Function(int, CarouselPageChangedReason)? onPageChanged;

  const CustomCarousel({
    super.key,
    this.carouselController,
    required this.initialPage,
    required this.imagePaths,
    this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 387,
      child: CarouselSlider(
        items: imagePaths.map((path) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              path,
              fit: BoxFit.cover,
            ),
          );
        }).toList(),
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
