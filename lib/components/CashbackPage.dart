//
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'CashbackDetailPage.dart';
//
// class CashbackPage extends StatelessWidget {
//   final List<Map<String, dynamic>> cashbackData = [
//     {
//       'store': 'Amazon',
//       'cashback': 150.00,
//       'cashbackPercentage': 10,
//       'orderId': '123456789',
//       'orderAmount': 1500.00,
//       'status': 'Success',
//       'transactionDate': '2023-01-01',
//       'imageUrl': 'assets/images/Amazon.png',
//       'statusColor': Color.fromRGBO(40, 167, 69, 1),
//     },
//     {
//       'store': 'Flipkart',
//       'cashback': 60.00,
//       'cashbackPercentage': 6,
//       'orderId': '987654321',
//       'orderAmount': 1000.00,
//       'status': 'Pending',
//       'transactionDate': '2023-02-01',
//       'imageUrl': 'assets/images/Flipkart.png',
//       'statusColor': Color.fromRGBO(255, 193, 7, 1),
//     },
//     {
//       'store': 'Nykaa',
//       'cashback': 150.00,
//       'cashbackPercentage': 10,
//       'orderId': '112233445',
//       'orderAmount': 1500.00,
//       'status': 'Cancelled',
//       'transactionDate': '2023-03-01',
//       'imageUrl': 'assets/images/Nykaa.png',
//       'statusColor': Color.fromRGBO(220, 53, 69, 1),
//     },
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         //backgroundColor: const Color.fromRGBO(170, 206, 144, 1),
//         automaticallyImplyLeading: false,
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             IconButton(
//               icon: Icon(
//                 Icons.arrow_back_ios,
//                 color: Colors.green.shade900,
//               ),
//               onPressed: () => Navigator.of(context).pop(),
//             ),
//             Text(
//               'Order Details',
//               style: GoogleFonts.poppins(
//                 color: Colors.green,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 20,
//               ),
//             ),
//           ],
//         ),
//       ),
//       backgroundColor: Colors.white, // Remove the light green background color
//       body: ListView.builder(
//         itemCount: cashbackData.length,
//         itemBuilder: (context, index) {
//           final item = cashbackData[index];
//           return CashbackCard(item: item);
//         },
//       ),
//     );
//   }
// }
//
// class CashbackCard extends StatelessWidget {
//   final Map<String, dynamic> item;
//
//   CashbackCard({required this.item});
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       color: Color.fromARGB(255, 200, 233, 202),
//       margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//       child: Padding(
//         padding: EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 Image.asset(item['imageUrl'], height: 50, width: 90),
//                 Spacer(),
//                 Container(
//                   padding: EdgeInsets.symmetric(vertical: 4, horizontal: 10),
//                   decoration: BoxDecoration(
//                     color: item['statusColor'],
//                     borderRadius: BorderRadius.circular(50),
//                   ),
//                   child: Text(
//                     item['status'],
//                     style: GoogleFonts.poppins(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             Divider(height: 20, thickness: 1, color: Colors.white),
//             Row(
//               children: [
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         '₹${item['cashback']}',
//                         style: GoogleFonts.poppins(
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       Text(
//                         '  Cashback',
//                         style: GoogleFonts.poppins(
//                           fontSize: 14,
//                           color: Colors.grey[600],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Spacer(),
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.end,
//                     children: [
//                       Text(
//                         '${item['cashbackPercentage']}%',
//                         style: GoogleFonts.poppins(
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       Text(
//                         'Cashback% ',
//                         style: GoogleFonts.poppins(
//                           fontSize: 14,
//                           color: Colors.grey[600],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             Divider(height: 20, thickness: 1, color: Colors.white),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               crossAxisAlignment: CrossAxisAlignment.end,
//               children: [
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Order ID',
//                         style: GoogleFonts.poppins(
//                           fontSize: 14,
//                           color: Colors.grey[600],
//                         ),
//                       ),
//                       Text(
//                         '${item['orderId']}',
//                         style: GoogleFonts.poppins(
//                           fontSize: 18,
//                           color: Colors.grey[900],
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       Text(
//                         'Order Amount',
//                         style: GoogleFonts.poppins(
//                           fontSize: 14,
//                           color: Colors.grey[600],
//                         ),
//                       ),
//                       Text(
//                         '₹${item['orderAmount']}',
//                         style: GoogleFonts.poppins(
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.grey[900],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Align(
//                   child: TextButton(
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => CashbackDetailPage(item: item),
//                         ),
//                       );
//                     },
//                     child: Row(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         Text(
//                           'View more',
//                           style: GoogleFonts.poppins(
//                             color: Colors.blue,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         Icon(Icons.arrow_forward_ios, color: Colors.blue, size: 15),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import '../UserState.dart';
import 'getUserSubId.dart';
import 'updateUserRewards.dart';

class CashbackPage extends StatefulWidget {
  @override
  _CashbackPageState createState() => _CashbackPageState();
}

class _CashbackPageState extends State<CashbackPage> {
  List<Map<String, dynamic>> cashbackData = [];

  @override
  void initState() {
    super.initState();
    _fetchCashbackData();
  }

  Future<void> _fetchCashbackData() async {
    try {
      // Replace with actual userId
      String userId = Provider.of<UserState>(context, listen: false).userId;
      print('inside the cashback ${userId}');
      String? subId = await getUserSubId(userId);

      if (subId != null) {
        QuerySnapshot querySnapshot = await FirebaseFirestore.instance
            .collection('transactions')
            .where('sub_id1', isEqualTo: subId)
            .get();

        List<Map<String, dynamic>> fetchedData = [];
        for (var doc in querySnapshot.docs) {
          var data = doc.data() as Map<String, dynamic>;

          // Parse and convert necessary fields to double
          double? userCommission = double.tryParse(data['user_commission'].toString());
          double? saleAmount = double.tryParse(data['sale_amount'].toString());

          // Update data with parsed values
          var updatedData = {
            ...data,
            'user_commission': userCommission ?? 0.0,
            'sale_amount': saleAmount ?? 0.0,
          };

          fetchedData.add(updatedData);

          String status = data['status'] ?? 'unknown';
          print('Transaction status: $status');

          if (status == 'success') {
            await updateUserRewards(userCommission ?? 0.0, userId, doc.id);
          }
        }

        setState(() {
          cashbackData = fetchedData;
        });
      } else {
        print('Sub ID not found for the user');
      }
    } catch (error) {
      print('Error fetching cashback data: $error');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.green.shade900,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
            Text(
              'Order Details',
              style: GoogleFonts.poppins(
                color: Colors.green,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: ListView.builder(
        itemCount: cashbackData.length,
        itemBuilder: (context, index) {
          final item = cashbackData[index];
          return CashbackCard(item: item);
        },
      ),
    );
  }
}

class CashbackCard extends StatelessWidget {
  final Map<String, dynamic> item;

  CashbackCard({required this.item});

  @override
  Widget build(BuildContext context) {
    DateTime transactionDate = DateTime.parse(item['sale_date']);
    DateTime expectedDate = transactionDate.add(Duration(days: 45));

    return Card(
      color: Color.fromARGB(255, 200, 233, 202),
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [// Display store name instead of image
                Text(
                  item['store_name'] ?? 'Unknown Store',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.red.shade900,
                  ),
                ),
                Spacer(),

                Container(
                  padding: EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                  decoration: BoxDecoration(
                    color: item['status'] == 'success'
                        ? Colors.green
                        : item['status'] == 'pending'
                        ? Colors.yellow
                        : Colors.red,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Text(
                    item['status'],
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Divider(height: 20, thickness: 1, color: Colors.white),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '₹${item['user_commission']}',
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '  Cashback',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '${item['cashback_percentage'] ?? 'N/A'}%',
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Cashback% ',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Divider(height: 20, thickness: 1, color: Colors.white),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Order ID',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                      Text(
                        '${item['id']}',
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          color: Colors.grey[900],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Order Amount',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                      Text(
                        '₹${item['sale_amount']}',
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[900],
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Transaction Date',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                    Text(
                      '${item['sale_date']}',
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[900],
                      ),
                    ),
                    Text(
                      'Expected Confirmation',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                    Text(
                      '${expectedDate.toLocal().toString().split(' ')[0]}',
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[900],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


