import 'package:flutter/material.dart';

class BusinessModal extends StatefulWidget {
  @override
  _BusinessModalState createState() => _BusinessModalState();
}

class _BusinessModalState extends State<BusinessModal> {
  int currentIndex = 0;
  final List<Map<String, dynamic>> slides = [
    {
      "title": 'What is AfflicartZ Cashback?',
      "description":
      "When you shop via AfflicartZ on sites like Amazon or Myntra, we earn a fee. We pass most of it to you as cashback. Earn up to ₹10,000 with just one extra click!",
      "icon": 'assets/images/Logo.png', // Replace with actual asset path
    },
    {
      "title": 'How to Earn Cashback?',
      "description":
      'Simply visit your favorite online store through AfflicartZ, make a purchase, and receive a portion of the commission as cashback in your account.',
      "icon": '💸',
    },
    {
      "title": 'Withdraw Your Earnings',
      "description":
      'Once you have accumulated enough cashback, you can easily withdraw it to your bank account or convert it into gift vouchers.',
      "icon": '🏦',
    },
    {
      "title": 'Special Offers and Deals',
      "description":
      'AfflicartZ also provides exclusive deals and offers that you can take advantage of to save even more.',
      "icon": '🎉',
    },
  ];

  void prevSlide() {
    setState(() {
      currentIndex = currentIndex == 0 ? slides.length - 1 : currentIndex - 1;
    });
  }

  void nextSlide() {
    setState(() {
      currentIndex = currentIndex == slides.length - 1 ? 0 : currentIndex + 1;
    });
  }

  void goToSlide(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width),
      margin: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'How AfflicartZ Works',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: prevSlide,
              ),
              Expanded(
                child: Column(
                  children: [
                    Container(
                      height:100, // Adjust height as needed
                      width: 100, // Adjust width as needed
                      child: Center(
                        child: currentIndex == 0
                            ? Image.asset(
                          slides[currentIndex]['icon'],
                          width: 100,
                          height: 100,
                        )
                            : Text(
                          slides[currentIndex]['icon'],
                          style: TextStyle(fontSize: 60),
                        ),
                      ),
                    ),
                    Text(
                      slides[currentIndex]['title'],
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 8),
                    Text(
                      slides[currentIndex]['description'],
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: Icon(Icons.arrow_forward_ios),
                onPressed: nextSlide,
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: slides.asMap().entries.map((entry) {
              int index = entry.key;
              return GestureDetector(
                onTap: () => goToSlide(index),
                child: Container(
                  width: 12,
                  height: 12,
                  margin: EdgeInsets.symmetric(horizontal: 6),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: currentIndex == index ? Colors.grey[800] : Colors.grey[300],
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
