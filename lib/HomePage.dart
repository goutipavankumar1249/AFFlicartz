import 'package:flutter/material.dart';
import 'package:project/components/BeautyPage.dart';
import 'package:project/components/BusinessModal.dart';
import 'components/HomePageProductCard.dart';
import 'components/carousel.dart'; // Import the carousel component
import 'components/ElectronicsPage.dart'; // Import the ElectronicsPage component
import 'components/FashionPage.dart'; // Import the FashionPage component

class HomePage extends StatelessWidget {
  final List<String> carouselImages = [
    'assets/images/carousel_4.jpg',
    'assets/images/carousel_6.jpg',
    'assets/images/carousel_2.jpg',
    'assets/images/carousel_1.jpg',
    'assets/images/carousel_5.jpg',
    'assets/images/carousel_3.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 10),
              ImageCarousel(images: carouselImages),
              SizedBox(height: 10),
              HomePageProductCard(), // Use the new product data component
              ElectronicsPage(), // Add the ElectronicsPage component here
              FashionPage(), // Add the FashionPage component here
              BeautyPage(),
              BusinessModal(),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
