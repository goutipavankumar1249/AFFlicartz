import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:project/LoginPage.dart';

class BeautyPage extends StatelessWidget {
  final List<Map<String, dynamic>> productData = [
    {
      "id": 4,
      "image": 'assets/images/Mamaearth_Face.png',
      "category": 'Face Products',
      "cashbackPercentage": 8,
      "storeName": "mamaearth",
    },
    {
      "id": 2,
      "image": 'assets/images/Nykaa_Skin.png',
      "category": 'Skin Products',
      "cashbackPercentage": 7,
      "storeName": "Nykaa",
    },
    {
      "id": 4,
      "image": 'assets/images/AJIO_Beauty.png',
      "category": 'Beauty Products',
      "cashbackPercentage": 4,
      "storeName": "AJIO",
    },
    {
      "id": 5,
      "image": 'assets/images/Myntra_Beauty.png',
      "category": 'Hair Products',
      "cashbackPercentage": 12,
      "storeName": "Myntra",
    },
  ];

  void handleShopNow(BuildContext context, Map<String, dynamic> item) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
      return;
    }

    try {
      DatabaseReference usersRef = FirebaseDatabase.instance.ref("users");
      DatabaseEvent event = await usersRef.orderByChild("uid").equalTo(user.uid).once();
      DataSnapshot snapshot = event.snapshot;

      if (snapshot.exists) {
        Map<dynamic, dynamic> userData = snapshot.value as Map<dynamic, dynamic>;
        String userKey = userData.keys.first;
        String subID = userData[userKey]['sub_id1'];

        // Construct the URL with the store's URL and append sub_id1
        String storeUrl = 'https://inr.deals/track?src=stores-api&campaign=cps&url=https%3A%2F%2Fwww.${item['storeName'].toLowerCase()}.in&id=esa574569153&subid=$subID';

        _launchURL(storeUrl);
      } else {
        print("User not found");
      }
    } catch (error) {
      print("Error fetching user data: $error");
    }
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'BEST IN BEAUTY',
            style: TextStyle(
              fontSize:20,
              fontWeight: FontWeight.bold,
              color: Colors.grey[800],
            ),
          ),
          SizedBox(height: 16),
          Container(
            height: 250, // Adjust the height as needed
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: productData.length,
              itemBuilder: (context, index) {
                final item = productData[index];
                return Container(
                  width: 250, // Adjust the width as needed
                  margin: EdgeInsets.only(right:10),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    elevation: 5,
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(5)),
                          child: Image.asset(
                            item['image'],
                            height: 120,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(11),
                          decoration: BoxDecoration(
                            color: Color(0xFFFDF9ED),
                            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'On ${item['category']}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'Get Cashback upto',
                                style: TextStyle(
                                  color: Colors.grey[600],
                                ),
                              ),
                              SizedBox(height: 4),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '${item['cashbackPercentage']}%',
                                    style: TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green,
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () => handleShopNow(context, item),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.orange, // Button color
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(32),
                                      ),
                                      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                                    ),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          'assets/images/cartIcon.png',
                                          width: 16,
                                          height: 16,
                                        ),
                                        SizedBox(width: 4),
                                        Text(
                                          'Grab now',
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      ],
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
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

