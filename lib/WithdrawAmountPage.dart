// import 'package:flutter/material.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:provider/provider.dart';
// import 'MyEarningsPage.dart';
// import 'UserState.dart';
// import 'package:fluttertoast/fluttertoast.dart';
//
// class WithdrawAmountPage extends StatefulWidget {
//   @override
//   _WithdrawAmountPageState createState() => _WithdrawAmountPageState();
// }
//
// class _WithdrawAmountPageState extends State<WithdrawAmountPage> {
//   final TextEditingController _amountController = TextEditingController();
//   final TextEditingController _beneIdController = TextEditingController();
//   final TextEditingController _transferIdController = TextEditingController();
//
//   void _saveTransferDetails(BuildContext context) async {
//     String amount = _amountController.text;
//     String beneId = _beneIdController.text;
//     String transferId = _transferIdController.text;
//
//     if (amount.isEmpty || beneId.isEmpty || transferId.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Please fill all the fields'),
//         ),
//       );
//       return;
//     }
//
//     try {
//       // // Access userId from the UserState using Provider
//       String userId = Provider.of<UserState>(context, listen: false).userId;
//       print('User ID: $userId'); // Debugging statement
//
//       DatabaseReference database = FirebaseDatabase.instance.ref().child('users').child(userId);
//
//       await database.update({
//         'amount': amount,
//         'beneId': beneId,
//         'transferId': transferId,
//       });
//
//       showToast('Details saved successfully');
//
//       // Navigate to MyEarningsPage
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => MyEarningsPage()),
//       );
//
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Failed to update account details: $e'),
//         ),
//       );
//     }
//   }
//
//   void showToast(String message) {
//     Fluttertoast.showToast(
//       msg: message,
//       toastLength: Toast.LENGTH_SHORT,
//       gravity: ToastGravity.BOTTOM,
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color.fromRGBO(249, 249, 249, 1.0),
//       appBar: AppBar(
//         title: Text('Withdraw Amount'),
//         backgroundColor: Colors.green,
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           padding: const EdgeInsets.symmetric(horizontal: 40),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: <Widget>[
//               Column(
//                 children: <Widget>[
//                   const SizedBox(height: 30.0),
//                   Container(
//                     height: 150,
//                     width: 150,
//                     child: Image.asset('assets/images/Logo.png'),
//                   ),
//                   Text(
//                     "Enter Your transfer details",
//                     style: TextStyle(fontSize: 15, color: Colors.grey[700]),
//                   )
//                 ],
//               ),
//               SizedBox(height: 20),
//               Column(
//                 children: <Widget>[
//                   TextField(
//                     controller: _amountController,
//                     decoration: InputDecoration(
//                       hintText: "Enter amount",
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(18),
//                         borderSide: BorderSide.none,
//                       ),
//                       fillColor: Colors.green.withOpacity(0.1),
//                       filled: true,
//                       prefixIcon: Icon(Icons.account_circle),
//                     ),
//                   ),
//                   SizedBox(height: 20),
//                   TextField(
//                     controller: _beneIdController,
//                     decoration: InputDecoration(
//                       hintText: "Enter beneId",
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(18),
//                         borderSide: BorderSide.none,
//                       ),
//                       fillColor: Colors.green.withOpacity(0.1),
//                       filled: true,
//                       prefixIcon: Icon(Icons.account_balance),
//                     ),
//                   ),
//                   SizedBox(height: 20),
//                   TextField(
//                     controller: _transferIdController,
//                     decoration: InputDecoration(
//                       hintText: "Enter unique transferId",
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(18),
//                         borderSide: BorderSide.none,
//                       ),
//                       fillColor: Colors.green.withOpacity(0.1),
//                       filled: true,
//                       prefixIcon: Icon(Icons.account_balance),
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () => _saveTransferDetails(context),
//                 child: Text(
//                   "Save details",
//                   style: TextStyle(fontSize: 18, color: Colors.white),
//                 ),
//                 style: ElevatedButton.styleFrom(
//                   shape: StadiumBorder(),
//                   padding: EdgeInsets.symmetric(vertical: 15),
//                   backgroundColor: Colors.green,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:provider/provider.dart';
// import 'MyEarningsPage.dart';
// import 'UserState.dart';
// import 'package:fluttertoast/fluttertoast.dart';
//
// class WithdrawAmountPage extends StatefulWidget {
//   @override
//   _WithdrawAmountPageState createState() => _WithdrawAmountPageState();
// }
//
// class _WithdrawAmountPageState extends State<WithdrawAmountPage> {
//   final TextEditingController _amountController = TextEditingController();
//   final TextEditingController _beneIdController = TextEditingController();
//   final TextEditingController _transferIdController = TextEditingController();
//
//   void _saveTransferDetails(BuildContext context) async {
//     String amount = _amountController.text;
//     String beneId = _beneIdController.text;
//     String transferId = _transferIdController.text;
//
//     if (amount.isEmpty || beneId.isEmpty || transferId.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Please fill all the fields'),
//         ),
//       );
//       return;
//     }
//
//     try {
//       // Replace with the actual user ID
//       //String userId = Provider.of<UserState>(context, listen: false).userId;
//       String userId = 'cYEPQuA7ZUfzZdEDY7YEQiAob463';
//       DatabaseReference database = FirebaseDatabase.instance.ref().child('users');
//       DatabaseEvent event = await database.orderByChild('uid').equalTo(userId).once();
//
//       if (event.snapshot.exists) {
//         Map<dynamic, dynamic> userData = event.snapshot.value as Map<dynamic, dynamic>;
//         String uniqueKey = userData.keys.first;
//
//         DatabaseReference userRef = database.child(uniqueKey);
//
//         await userRef.update({
//           'amount': amount,
//           'beneId': beneId,
//           'transferId': transferId,
//         });
//
//         showToast('Details saved successfully');
//
//         // Navigate to MyEarningsPage
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => MyEarningsPage()),
//         );
//       } else {
//         showToast('User not found');
//       }
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Failed to update transfer details: $e'),
//         ),
//       );
//     }
//   }
//
//   void showToast(String message) {
//     Fluttertoast.showToast(
//       msg: message,
//       toastLength: Toast.LENGTH_SHORT,
//       gravity: ToastGravity.BOTTOM,
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         backgroundColor: Color(0xFFCBF4C9),
//         body: SingleChildScrollView(
//           child: Container(
//             padding: const EdgeInsets.symmetric(horizontal: 40),
//             height: MediaQuery.of(context).size.height,
//             width: double.infinity,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: <Widget>[
//                 Column(
//                   children: <Widget>[
//                     const SizedBox(height: 30.0),
//                     Container(
//                       height: 100,
//                       width: 100,
//                       child: Image.asset('assets/images/Logo.png'),
//                     ),
//                     const SizedBox(height: 10.0),
//                     Text(
//                       "Enter Your Transfer Details",
//                       style: TextStyle(
//                         fontSize: 24,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     Text(
//                       "Provide the details to proceed with the transfer",
//                       style: TextStyle(fontSize: 16),
//                       textAlign: TextAlign.center,
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 20),
//                 Column(
//                   children: <Widget>[
//                     _buildTextField(
//                       controller: _amountController,
//                       hintText: "Enter amount",
//                       icon: Icons.attach_money,
//                     ),
//                     SizedBox(height: 20),
//                     _buildTextField(
//                       controller: _beneIdController,
//                       hintText: "Enter Beneficiary ID",
//                       icon: Icons.account_balance_wallet,
//                     ),
//                     SizedBox(height: 20),
//                     _buildTextField(
//                       controller: _transferIdController,
//                       hintText: "Enter Unique Transfer ID",
//                       icon: Icons.swap_horiz,
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 20),
//                 ElevatedButton(
//                   onPressed: () => _saveTransferDetails(context),
//                   child: const Text(
//                     "Save Details",
//                     style: TextStyle(fontSize: 18, color: Colors.white),
//                   ),
//                   style: ElevatedButton.styleFrom(
//                     shape: StadiumBorder(),
//                     padding: EdgeInsets.symmetric(vertical: 15),
//                     backgroundColor: Colors.green,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildTextField({
//     required TextEditingController controller,
//     required String hintText,
//     required IconData icon,
//   }) {
//     return TextField(
//       controller: controller,
//       decoration: InputDecoration(
//         hintText: hintText,
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(18),
//           borderSide: BorderSide.none,
//         ),
//         fillColor: Colors.white,
//         filled: true,
//         prefixIcon: Icon(icon),
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:provider/provider.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'UserState.dart';
// import 'MyEarningsPage.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:pointycastle/api.dart';
// import 'package:pointycastle/asymmetric/api.dart';
// import 'package:pointycastle/asymmetric/oaep.dart';
// import 'package:pointycastle/asymmetric/rsa.dart';
// import 'dart:typed_data';
// import 'package:asn1lib/asn1lib.dart';
//
//
//
// class WithdrawAmountPage extends StatefulWidget {
//   @override
//   _WithdrawAmountPageState createState() => _WithdrawAmountPageState();
// }
//
// class _WithdrawAmountPageState extends State<WithdrawAmountPage> {
//   final TextEditingController _amountController = TextEditingController();
//   final TextEditingController _beneIdController = TextEditingController();
//   final TextEditingController _transferIdController = TextEditingController();
//   double _userBalance = 0.0;
//   String _error = '';
//
//   @override
//   void initState() {
//     super.initState();
//     _fetchUserData();
//     _generateRandomTransferId();
//   }
//
//   Future<void> _fetchUserData() async {
//     try {
//       String userId = Provider.of<UserState>(context, listen: false).userId;
//       DatabaseReference database = FirebaseDatabase.instance.ref().child('users');
//       DatabaseEvent event = await database.orderByChild('uid').equalTo(userId).once();
//
//       if (event.snapshot.exists) {
//         Map<dynamic, dynamic> userData = event.snapshot.value as Map<dynamic, dynamic>;
//         String uniqueKey = userData.keys.first;
//         var data = userData[uniqueKey];
//         setState(() {
//           _beneIdController.text = data['beneId'] ?? '';
//           _userBalance = double.parse(data['earnedAmount']?.toString() ?? '0');
//         });
//       } else {
//         showToast('User not found');
//       }
//     } catch (e) {
//       print('Error fetching user data: $e');
//     }
//   }
//
//   void _generateRandomTransferId() {
//     String randomId = 'CART${(1000 + (9999 * (1 + (DateTime.now().millisecondsSinceEpoch % 9999) / 10000)).toInt())}';
//     setState(() {
//       _transferIdController.text = randomId;
//     });
//   }
//
//   void _saveTransferDetails(BuildContext context) async {
//     String amount = _amountController.text;
//     String beneId = _beneIdController.text;
//     String transferId = _transferIdController.text;
//
//     if (amount.isEmpty || beneId.isEmpty || transferId.isEmpty) {
//       setState(() {
//         _error = 'Please fill all the fields';
//       });
//       return;
//     }
//
//     double amountDouble = double.tryParse(amount) ?? 0.0;
//     if (amountDouble < 10 || amountDouble > _userBalance) {
//       setState(() {
//         _error = 'Amount must be greater than 100 and less than or equal to $_userBalance';
//       });
//       return;
//     }
//     try {
//       // Fetch user data to get the unique key
//       String userId = Provider.of<UserState>(context, listen: false).userId;
//       DatabaseReference database = FirebaseDatabase.instance.ref().child('users');
//       DatabaseEvent event = await database.orderByChild('uid').equalTo(userId).once();
//
//       if (event.snapshot.exists) {
//         Map<dynamic, dynamic> userData = event.snapshot.value as Map<dynamic, dynamic>;
//         String uniqueKey = userData.keys.first;
//
//         DatabaseReference userRef = database.child(uniqueKey);
//         await userRef.update({
//           'amount': amount,
//           'beneId': beneId,
//           'transferId': transferId,
//         });
//
//         showToast('Details saved successfully');
//         generateToken('CF10180708CP5EDP9BRFKLVP14O2B0','cfsk_ma_test_0a6279ba7f0a2e722564bdb922ab9aa9_ed6b5c19');
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => MyEarningsPage()),
//         );
//       } else {
//         showToast('User not found');
//       }
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Failed to update transfer details: $e'),
//         ),
//       );
//     }
//   }
//
//   Future<String> generateToken(String clientId, String clientSecret) async {
//     print('called');
//     final String url = 'https://payout-gamma.cashfree.com/payout/v1/authorize';
//     const String publicKey = """-----BEGIN PUBLIC KEY-----
// MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAtsVN2+BBHWdlEKSfMpoy
// 6WiXOfYDfCegrpHnKEX04OBENOOMh5wuibLCVSJFFc3VISRTYYhRF3OR7HLDdU8e
// /ahAqbPfeCQKkXOrq7tIncguoc3KhzyeC2yMLXpbqZBiYsNRSUjdjU6prCkn5jF0
// RqaKAbKgjA839VO3dpLQDmeTm8ta9eZybleAF4xZ1ZgIVB30EXGRih/5w7/fS8fs
// wEZUgzg9nthIvc/PABZm2lX9k3i8QX+EcF4+1unuTMvuGPeefNgUOTv8NmC43+/N
// usRBe6Z1Q228srlGaWlC6ww5Bni2wrIfhkaAk+ta1LsU/IKQC7G1oYSoY7rXrfq3
// rQIDAQAB
// -----END PUBLIC KEY-----
// """;
//     final String signature = await generateSignature(clientId, publicKey);
//     print('Generated Signature: $signature');
//
//     // Create a map with your client ID, client secret, and signature
//     Map<String, String> body = {
//       "clientId": clientId,
//       "clientSecret": clientSecret,
//       "signature": signature,
//     };
//
//     // Convert the map to JSON
//     String jsonBody = json.encode(body);
//
//     // Make a POST request to generate the token
//     final response = await http.post(
//       Uri.parse(url),
//       headers: {
//         'x-client-Id' : 'CF10180708CP5EDP9BRFKLVP14O2B0',
//         'x-client-secret' : 'cfsk_ma_test_0a6279ba7f0a2e722564bdb922ab9aa9_ed6b5c19',
//         'x-cf-signature' : signature,
//         'Content-Type': 'application/json',
//       },
//       body: jsonBody,
//     );
//
//     // Check if the request was successful
//     if (response.statusCode == 200) {
//       Map<String, dynamic> responseData = json.decode(response.body);
//       dynamic data = responseData['data'];
//       String token = data['token'];
//       verifyToken(token);
//       return token;
//     } else {
//       throw Exception('Failed to generate token: ${response.statusCode}');
//     }
//   }
//
//   Future<void> verifyToken(String token) async {
//     final String url = 'https://payout-gamma.cashfree.com/payout/v1/verifyToken';
//     final String authHeader = 'Bearer $token';
//
//     // Make a POST request to verify the token
//     final response = await http.post(
//       Uri.parse(url),
//       headers: {
//         'Authorization': authHeader,
//         'Content-Type': 'application/json',
//       },
//       body: json.encode({'token': token}),
//     );
//
//     if (response.statusCode == 200) {
//       Map<String, dynamic> responseData = json.decode(response.body);
//       if (responseData.containsKey('status') && responseData['status'] == 'SUCCESS') {
//         transferMoney(authHeader);
//       } else {
//         print('Failed to verify token: ${responseData['message']}');
//       }
//     } else {
//       print('Failed to verify token: ${response.statusCode}');
//     }
//   }
//
//   Future<void> transferMoney(String token) async {
//     final String url = 'https://payout-gamma.cashfree.com/payout/v1.2/requestAsyncTransfer';
//
//     Map<String, dynamic> requestBody = {
//       "beneId": _beneIdController.text,
//       "transferId": _transferIdController.text,
//       "amount": _amountController.text
//     };
//
//     String jsonBody = json.encode(requestBody);
//
//     final response = await http.post(
//       Uri.parse(url),
//       headers: {
//         'Authorization': token,
//         'Content-Type': 'application/json',
//       },
//       body: jsonBody,
//     );
//
//     if (response.statusCode == 200) {
//       Map<String, dynamic> responseData = json.decode(response.body);
//       print('Response Data: $responseData');
//       // Transfer succeeded, update the user's balance in Firebase
//       DatabaseReference database = FirebaseDatabase.instance.ref().child('users');
//       DatabaseReference userRef = database.child(uniqueKey);
//       double newBalance = _userBalance - ;
//
//       await userRef.update({'earnedAmount': newBalance});
//     } else {
//       print('Failed to transfer money: ${response.statusCode}');
//     }
//   }
//
//
//   Future<String> generateSignature(String clientId, String publicKeyPem) async {
//     // Get current timestamp in seconds
//     final int timestamp = DateTime.now().millisecondsSinceEpoch ~/ 1000;
//
//     // Create the data to encrypt
//     final String dataToEncrypt = '$clientId.$timestamp';
//
//     // Parse the PEM key
//     final RSAPublicKey publicKey = parsePublicKeyFromPem(publicKeyPem);
//
//     // Encrypt the data using RSA/ECB/OAEPWithSHA-1AndMGF1Padding
//     final Uint8List encryptedData = encryptDataWithOAEP(publicKey, dataToEncrypt);
//
//     // Return the base64 encoded encrypted data
//     return base64Encode(encryptedData);
//   }
//
//   RSAPublicKey parsePublicKeyFromPem(String pem) {
//     final List<String> lines = pem.split('\n');
//     final String base64String = lines
//         .where((line) => !line.startsWith('-----BEGIN') && !line.startsWith('-----END'))
//         .join('');
//
//     final Uint8List publicKeyDER = base64Decode(base64String);
//     final ASN1Parser asn1Parser = ASN1Parser(publicKeyDER);
//     final ASN1Sequence sequence = asn1Parser.nextObject() as ASN1Sequence;
//
//     final  ASN1BitString bitString = sequence.elements[1] as ASN1BitString;
//     final ASN1Sequence publicKeySequence =
//     ASN1Parser(bitString.contentBytes()).nextObject() as ASN1Sequence;
//
//     final ASN1Integer modulus = publicKeySequence.elements[0] as ASN1Integer;
//     final ASN1Integer exponent = publicKeySequence.elements[1] as ASN1Integer;
//
//     return RSAPublicKey(modulus.valueAsBigInteger, exponent.valueAsBigInteger);
//   }
//
//   Uint8List encryptDataWithOAEP(RSAPublicKey publicKey, String data) {
//     final OAEPEncoding cipher = OAEPEncoding(RSAEngine())
//       ..init(
//         true, // true=encrypt
//         PublicKeyParameter<RSAPublicKey>(publicKey),
//       );
//
//     final Uint8List input = Uint8List.fromList(utf8.encode(data));
//     return cipher.process(input);
//   }
//
//   void showToast(String message) {
//     Fluttertoast.showToast(
//       msg: message,
//       toastLength: Toast.LENGTH_SHORT,
//       gravity: ToastGravity.BOTTOM,
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         backgroundColor: Color(0xFFCBF4C9),
//         body: SingleChildScrollView(
//           child: Container(
//             padding: const EdgeInsets.symmetric(horizontal: 40),
//             height: MediaQuery.of(context).size.height,
//             width: double.infinity,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: <Widget>[
//                 Column(
//                   children: <Widget>[
//                     const SizedBox(height: 30.0),
//                     Container(
//                       height: 100,
//                       width: 100,
//                       child: Image.asset('assets/images/Logo.png'),
//                     ),
//                     const SizedBox(height: 10.0),
//                     Text(
//                       "Enter Your Transfer Details",
//                       style: TextStyle(
//                         fontSize: 24,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     Text(
//                       "Provide the details to proceed with the transfer",
//                       style: TextStyle(fontSize: 16),
//                       textAlign: TextAlign.center,
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 20),
//                 Column(
//                   children: <Widget>[
//                     _buildTextField(
//                       controller: _amountController,
//                       hintText: "Enter amount",
//                       icon: Icons.attach_money,
//                     ),
//                     SizedBox(height: 20),
//                     _buildTextField(
//                       controller: _beneIdController,
//                       hintText: "Enter Beneficiary ID",
//                       icon: Icons.account_balance_wallet,
//                     ),
//                     SizedBox(height: 20),
//                     _buildTextField(
//                       controller: _transferIdController,
//                       hintText: "Enter Unique Transfer ID",
//                       icon: Icons.swap_horiz,
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 20),
//                 if (_error.isNotEmpty)
//                   Text(
//                     _error,
//                     style: TextStyle(color: Colors.red),
//                   ),
//                 SizedBox(height: 10),
//                 ElevatedButton(
//                   onPressed: () => _saveTransferDetails(context),
//                   child: const Text(
//                     "Save Details",
//                     style: TextStyle(fontSize: 18, color: Colors.white),
//                   ),
//                   style: ElevatedButton.styleFrom(
//                     shape: StadiumBorder(),
//                     padding: EdgeInsets.symmetric(vertical: 15),
//                     backgroundColor: Colors.green,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildTextField({
//     required TextEditingController controller,
//     required String hintText,
//     required IconData icon,
//   }) {
//     return TextField(
//       controller: controller,
//       decoration: InputDecoration(
//         hintText: hintText,
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(18),
//           borderSide: BorderSide.none,
//         ),
//         fillColor: Colors.white,
//         filled: true,
//         prefixIcon: Icon(icon),
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:project/HomePage.dart';
import 'package:provider/provider.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'UserState.dart';
import 'MyEarningsPage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pointycastle/api.dart';
import 'package:pointycastle/asymmetric/api.dart';
import 'package:pointycastle/asymmetric/oaep.dart';
import 'package:pointycastle/asymmetric/rsa.dart';
import 'dart:typed_data';
import 'package:asn1lib/asn1lib.dart';

class WithdrawAmountPage extends StatefulWidget {
  @override
  _WithdrawAmountPageState createState() => _WithdrawAmountPageState();
}

class _WithdrawAmountPageState extends State<WithdrawAmountPage> {
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _beneIdController = TextEditingController();
  final TextEditingController _transferIdController = TextEditingController();
  double _userBalance = 0.0;
  String _error = '';

  @override
  void initState() {
    super.initState();
    _fetchUserData();
    _generateRandomTransferId();
  }

  Future<void> _fetchUserData() async {
    try {
      String userId = Provider.of<UserState>(context, listen: false).userId;
      DatabaseReference database = FirebaseDatabase.instance.ref().child('users');
      DatabaseEvent event = await database.orderByChild('uid').equalTo(userId).once();

      if (event.snapshot.exists) {
        Map<dynamic, dynamic> userData = event.snapshot.value as Map<dynamic, dynamic>;
        String uniqueKey = userData.keys.first;
        var data = userData[uniqueKey];
        if (mounted) {
          setState(() {
            _beneIdController.text = data['beneId'] ?? '';
            _userBalance = double.parse(data['earnedAmount']?.toString() ?? '0');
          });
        }
      } else {
        showToast('User not found');
      }
    } catch (e) {
      print('Error fetching user data: $e');
    }
  }

  void _generateRandomTransferId() {
    String randomId = 'CART${(1000 + (9999 * (1 + (DateTime.now().millisecondsSinceEpoch % 9999) / 10000)).toInt())}';
    if (mounted) {
      setState(() {
        _transferIdController.text = randomId;
      });
    }
  }

  void _saveTransferDetails(BuildContext context) async {
    String amount = _amountController.text;
    String beneId = _beneIdController.text;
    String transferId = _transferIdController.text;

    if (amount.isEmpty || beneId.isEmpty || transferId.isEmpty) {
      setState(() {
        _error = 'Please fill all the fields';
      });
      return;
    }

    double amountDouble = double.tryParse(amount) ?? 0.0;
    if (amountDouble < 10 || amountDouble > _userBalance) {
      setState(() {
        _error = 'Amount must be greater than 10 and less than or equal to $_userBalance';
      });
      return;
    }

    try {
      // Fetch user data to get the unique key
      String userId = Provider.of<UserState>(context, listen: false).userId;
      DatabaseReference database = FirebaseDatabase.instance.ref().child('users');
      DatabaseEvent event = await database.orderByChild('uid').equalTo(userId).once();

      if (event.snapshot.exists) {
        Map<dynamic, dynamic> userData = event.snapshot.value as Map<dynamic, dynamic>;
        String uniqueKey = userData.keys.first;

        // Save transfer details temporarily before the API call
        DatabaseReference userRef = database.child(uniqueKey);
        await userRef.update({
          'amount': amount,
          'beneId': beneId,
          'transferId': transferId,
        });

        showToast('Details saved successfully');

        // Generate token and perform the transfer
        String token = await generateToken('CF10180708CP5EDP9BRFKLVP14O2B0', 'cfsk_ma_test_0a6279ba7f0a2e722564bdb922ab9aa9_ed6b5c19');
        verifyToken(token, amountDouble, uniqueKey, userId);

        // Navigate to the MyEarningsPage after a successful transfer
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      } else {
        showToast('User not found');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to update transfer details: $e'),
        ),
      );
    }
  }

  Future<String> generateToken(String clientId, String clientSecret) async {
    print('called');
    final String url = 'https://payout-gamma.cashfree.com/payout/v1/authorize';
    const String publicKey = """-----BEGIN PUBLIC KEY-----
MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAtsVN2+BBHWdlEKSfMpoy
6WiXOfYDfCegrpHnKEX04OBENOOMh5wuibLCVSJFFc3VISRTYYhRF3OR7HLDdU8e
/ahAqbPfeCQKkXOrq7tIncguoc3KhzyeC2yMLXpbqZBiYsNRSUjdjU6prCkn5jF0
RqaKAbKgjA839VO3dpLQDmeTm8ta9eZybleAF4xZ1ZgIVB30EXGRih/5w7/fS8fs
wEZUgzg9nthIvc/PABZm2lX9k3i8QX+EcF4+1unuTMvuGPeefNgUOTv8NmC43+/N
usRBe6Z1Q228srlGaWlC6ww5Bni2wrIfhkaAk+ta1LsU/IKQC7G1oYSoY7rXrfq3
rQIDAQAB
-----END PUBLIC KEY-----
""";
    final String signature = await generateSignature(clientId, publicKey);
    print('Generated Signature: $signature');

    // Create a map with your client ID, client secret, and signature
    Map<String, String> body = {
      "clientId": clientId,
      "clientSecret": clientSecret,
      "signature": signature,
    };

    // Convert the map to JSON
    String jsonBody = json.encode(body);

    // Make a POST request to generate the token
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'x-client-Id': 'CF10180708CP5EDP9BRFKLVP14O2B0',
        'x-client-secret': 'cfsk_ma_test_0a6279ba7f0a2e722564bdb922ab9aa9_ed6b5c19',
        'x-cf-signature': signature,
        'Content-Type': 'application/json',
      },
      body: jsonBody,
    );

    // Check if the request was successful
    if (response.statusCode == 200) {
      Map<String, dynamic> responseData = json.decode(response.body);
      dynamic data = responseData['data'];
      String token = data['token'];
      return token;
    } else {
      throw Exception('Failed to generate token: ${response.statusCode}');
    }
  }

  Future<void> verifyToken(String token, double amount, String uniqueKey, String userId) async {
    final String url = 'https://payout-gamma.cashfree.com/payout/v1/verifyToken';
    final String authHeader = 'Bearer $token';

    // Make a POST request to verify the token
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Authorization': authHeader,
        'Content-Type': 'application/json',
      },
      body: json.encode({'token': token}),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> responseData = json.decode(response.body);
      if (responseData.containsKey('status') && responseData['status'] == 'SUCCESS') {
        // Proceed with the money transfer
        await transferMoney(authHeader, amount, uniqueKey, userId);
      } else {
        print('Failed to verify token: ${responseData['message']}');
      }
    } else {
      print('Failed to verify token: ${response.statusCode}');
    }
  }

  Future<void> transferMoney(String token, double amount, String uniqueKey, String userId) async {
    final String url = 'https://payout-gamma.cashfree.com/payout/v1/requestTransfer';

    Map<String, dynamic> requestBody = {
      "beneId": _beneIdController.text,
      "transferId": _transferIdController.text,
      "amount": _amountController.text
    };

    String jsonBody = json.encode(requestBody);

    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Authorization': token,
        'Content-Type': 'application/json',
      },
      body: jsonBody,
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> responseData = json.decode(response.body);
      print('Response Data: $responseData');

      if (responseData['status'] == 'PENDING') {
        // Transfer succeeded, update the user's balance in Firebase
        print('entered');
        DatabaseReference database = FirebaseDatabase.instance.ref().child('users');
        DatabaseReference userRef = database.child(uniqueKey);
        double newBalance = _userBalance - amount;
        print(newBalance);
        // Convert the new balance to a string
        String newBalanceString = newBalance.toString();
        await userRef.update({'earnedAmount': newBalanceString});
        showToast('Transfer successful. New balance: $newBalanceString');
      } else {
        showToast('Failed to transfer money: ${responseData['message']}');
      }
    } else {
      print('Failed to transfer money: ${response.statusCode}');
    }
  }

  Future<String> generateSignature(String clientId, String publicKeyPem) async {
    // Get current timestamp in seconds
    final int timestamp = DateTime.now().millisecondsSinceEpoch ~/ 1000;

    // Create the data to encrypt
    final String dataToEncrypt = '$clientId.$timestamp';

    // Parse the PEM key
    final RSAPublicKey publicKey = parsePublicKeyFromPem(publicKeyPem);

    // Encrypt the data using RSA/ECB/OAEPWithSHA-1AndMGF1Padding
    final Uint8List encryptedData = encryptDataWithOAEP(publicKey, dataToEncrypt);

    // Return the base64 encoded encrypted data
    return base64Encode(encryptedData);
  }

  RSAPublicKey parsePublicKeyFromPem(String pem) {
    final List<String> lines = pem.split('\n');
    final String base64String = lines
        .where((line) => !line.startsWith('-----BEGIN') && !line.startsWith('-----END'))
        .join('');

    final Uint8List publicKeyDER = base64Decode(base64String);
    final ASN1Parser asn1Parser = ASN1Parser(publicKeyDER);
    final ASN1Sequence sequence = asn1Parser.nextObject() as ASN1Sequence;

    final ASN1BitString bitString = sequence.elements[1] as ASN1BitString;
    final ASN1Sequence publicKeySequence =
    ASN1Parser(bitString.contentBytes()).nextObject() as ASN1Sequence;

    final ASN1Integer modulus = publicKeySequence.elements[0] as ASN1Integer;
    final ASN1Integer exponent = publicKeySequence.elements[1] as ASN1Integer;

    return RSAPublicKey(modulus.valueAsBigInteger, exponent.valueAsBigInteger);
  }

  Uint8List encryptDataWithOAEP(RSAPublicKey publicKey, String data) {
    final OAEPEncoding cipher = OAEPEncoding(RSAEngine())
      ..init(
        true, // true=encrypt
        PublicKeyParameter<RSAPublicKey>(publicKey),
      );

    final Uint8List input = Uint8List.fromList(utf8.encode(data));
    return cipher.process(input);
  }

  void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
    );
  }

  @override
  void dispose() {
    _amountController.dispose();
    _beneIdController.dispose();
    _transferIdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFFCBF4C9),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    const SizedBox(height: 30.0),
                    Container(
                      height: 100,
                      width: 100,
                      child: Image.asset('assets/images/Logo.png'),
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      "Enter Your Transfer Details",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Provide the details to proceed with the transfer",
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Column(
                  children: <Widget>[
                    _buildTextField(
                      controller: _amountController,
                      hintText: "Enter amount",
                      icon: Icons.attach_money,
                    ),
                    SizedBox(height: 20),
                    _buildTextField(
                      controller: _beneIdController,
                      hintText: "Enter Beneficiary ID",
                      icon: Icons.account_balance_wallet,
                    ),
                    SizedBox(height: 20),
                    _buildTextField(
                      controller: _transferIdController,
                      hintText: "Enter Unique Transfer ID",
                      icon: Icons.swap_horiz,
                    ),
                  ],
                ),
                SizedBox(height: 20),
                if (_error.isNotEmpty)
                  Text(
                    _error,
                    style: TextStyle(color: Colors.red),
                  ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () => _saveTransferDetails(context),
                  child: const Text(
                    "Save Details",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: StadiumBorder(),
                    padding: EdgeInsets.symmetric(vertical: 15),
                    backgroundColor: Colors.green,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
  }) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide.none,
        ),
        fillColor: Colors.white,
        filled: true,
        prefixIcon: Icon(icon),
      ),
    );
  }
}




