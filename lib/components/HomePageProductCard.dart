import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project/LoginPage.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePageProductCard extends StatelessWidget {
  final List<Map<String, String>> stores = [
    {
      "name": "Amazon",
      "url": "https://inr.deals/track?src=stores-api&campaign=cps&url=https%3A%2F%2Fwww.amazon.in&id=esa574569153&",
      "logo": "assets/images/Amazon_logo.png"
    },
    {
      "name": "Flipkart",
      "url": "https://inr.deals/track?src=stores-api&campaign=cps_healthplus&url=https%3A%2F%2Ffkhplus.app.link%2F&id=esa574569153&",
      "logo": "assets/images/Flipkart.png"
    },
    {
      "name": "Myntra",
      "url": "https://inr.deals/track?src=stores-api&campaign=cps&url=https%3A%2F%2Fwww.myntra.com&id=esa574569153&",
      "logo": "assets/images/Myntra.png"
    },
    {
      "name": "Nykaa",
      "url": "https://inr.deals/track?src=stores-api&campaign=cps&url=https%3A%2F%2Fwww.nykaa.com%2F&id=esa574569153&",
      "logo": "assets/images/Nykaa.png"
    },
    {
      "name": "AJIO",
      "url": "https://inr.deals/track?src=stores-api&campaign=cps&url=https%3A%2F%2Fwww.ajio.com%2F&id=esa574569153&",
      "logo": "assets/images/AJIO.png"
    },
    {
      "name": "Earth",
      "url": "https://inr.deals/track?src=stores-api&campaign=cps&url=https%3A%2F%2Fmamaearth.in&id=esa574569153&",
      "logo": "assets/images/Mamaearth_logo.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(
            'TOP RATED CASHBACK BRANDS',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              childAspectRatio: 1.1, // Adjust this to change the height of the cards
            ),
            itemCount: stores.length,
            itemBuilder: (context, index) {
              final store = stores[index];
              return GestureDetector(
                onTap: () => handleClick(context, store),
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          store['logo']!,
                          height: 90,
                          fit: BoxFit.contain,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            'Shop on ${store['name']}',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Future<void> handleClick(BuildContext context, Map<String, String> store) async {
    print('handle clicked');
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      //print('yes');
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

        Uri storeUrl = Uri.parse(store['url']!);
        Uri updatedUrl = storeUrl.replace(queryParameters: {
          ...storeUrl.queryParameters,
          'subid': subID,
        });

        // Use `launch` from the `url_launcher` package to open the URL
        if (await canLaunch(updatedUrl.toString())) {
          await launch(updatedUrl.toString());
        } else {
          throw 'Could not launch $updatedUrl';
        }
      } else {
        print("User not found");
      }
    } catch (error) {
      print("Error fetching user data: $error");
    }
  }
}
