// carousel.dart
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ImageCarousel extends StatelessWidget {
  final List<String> images;

  ImageCarousel({required this.images});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: images.map((imagePath) {
        return buildCarouselItem(context, imagePath); // Pass the context here
      }).toList(),
      options: CarouselOptions(
        height: 200,
        aspectRatio: 16 / 9,
        viewportFraction: 1.0, // Adjust this value to increase/decrease the width
        initialPage: 0,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        pauseAutoPlayOnTouch: true,
        enlargeCenterPage: true,
      ),
    );
  }

  Widget buildCarouselItem(BuildContext context, String imagePath) {
    return Container(
      width: MediaQuery.of(context).size.width, // Adjust width using the passed context
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
