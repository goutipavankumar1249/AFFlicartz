import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';

class FeaturedStores extends StatefulWidget {
  @override
  _FeaturedStoresState createState() => _FeaturedStoresState();
}

class _FeaturedStoresState extends State<FeaturedStores> {
  List<Map<String, dynamic>> stores = [];
  bool isLoading = true;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    fetchStores();
  }

  Future<void> fetchStores() async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('stores').get();
      setState(() {
        stores = querySnapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
        isLoading = false;
      });
    } catch (error) {
      print("Error fetching stores data: $error");
      setState(() {
        errorMessage = error.toString();
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.green.shade900),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text("All Stores"),
      ),
      body: Container(
        color: Color(0xFFCBF4C9), // Light green background color
        child: isLoading
            ? Center(child: CircularProgressIndicator())
            : errorMessage.isNotEmpty
            ? Center(child: Text("Error: $errorMessage"))
            : Padding(
          padding: const EdgeInsets.all(12.0),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Adjust the number of columns as needed
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: 1.1, // Adjust aspect ratio to your preference
            ),
            itemCount: stores.length,
            itemBuilder: (context, index) {
              final store = stores[index];
              return GestureDetector(
                onTap: () async {
                  final url = store['url'];
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    print("Could not launch $url");
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                        store['logo'],
                        height: 64,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(height: 10),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                        decoration: BoxDecoration(
                          color: Colors.green[500],
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text(
                          'Shop on ${store['merchant']}',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Payout: ${store['payout']}',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
