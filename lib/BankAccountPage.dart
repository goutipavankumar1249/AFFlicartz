// import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:provider/provider.dart';
//
// import 'MyEarningsPage.dart';
// import 'UserState.dart';
// // import 'package:test1/UpiPage.dart';
//
// class BankAccountPage extends StatefulWidget {
//   @override
//   _BankAccountPageState createState() => _BankAccountPageState();
// }
//
//
// class _BankAccountPageState extends State<BankAccountPage> {
//   double earnings = 0.0;
//   final TextEditingController _accountHolderController = TextEditingController();
//   final TextEditingController _accountNumberController = TextEditingController();
//   final TextEditingController _ifscCodeController = TextEditingController();
//   final TextEditingController _phoneNumberController = TextEditingController();
//   final TextEditingController _beneIdController = TextEditingController();
//   final TextEditingController _address1Controller  = TextEditingController();
//
//   void _saveAccountDetails(BuildContext context) async {
//     String accountHolder = _accountHolderController.text;
//     String accountNumber = _accountNumberController.text;
//     String ifscCode = _ifscCodeController.text;
//     String phoneNumber = _phoneNumberController.text;
//     String beneId = _beneIdController.text;
//     String address1 = _address1Controller.text;
//
//     if (accountHolder.isEmpty || accountNumber.isEmpty || ifscCode.isEmpty || phoneNumber.isEmpty || beneId.isEmpty || address1.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Please fill all the fields'),
//         ),
//       );
//       return;
//     }
//
//     try {
//       // Access userId from the UserState using Provider
//       String userId = Provider.of<UserState>(context, listen: false).userId;
//       print('User ID: $userId'); // Debugging statement
//
//       DatabaseReference database = FirebaseDatabase.instance.ref().child('users').child(userId);
//
//       await database.update({
//         'accountHolder': accountHolder,
//         'accountNumber': accountNumber,
//         'ifscCode': ifscCode,
//         'phoneNumber': phoneNumber,
//         'beneId' : beneId,
//         'address1' : address1,
//       });
//       showToast('successfully stored');
//
//       // Navigate to MyEarningsPage
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => MyEarningsPage()), // Replace MyEarningsPage with your actual page
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
//         backgroundColor: Color.fromRGBO(249, 249, 249, 1.0),
//         body: SingleChildScrollView(
//           child: Container(
//             padding: const EdgeInsets.symmetric(horizontal: 40),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: <Widget>[
//                 Column(
//                   children: <Widget>[
//                     const SizedBox(height: 30.0),
//                     Container(
//                       height: 150,
//                       width: 150,
//                       child: Image.asset('assets/images/Logo.png'),
//                     ),
//                     Text(
//                       "Enter Your Account Details",
//                       style: TextStyle(fontSize: 15, color: Colors.grey[700]),
//                     )
//                   ],
//                 ),
//                 SizedBox(height: 20),
//                 Column(
//                   children: <Widget>[
//                     TextField(
//                       controller: _accountHolderController, // Add this line
//                       decoration: InputDecoration(
//                         hintText: "Account holder user name",
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(18),
//                           borderSide: BorderSide.none,
//                         ),
//                         fillColor: Colors.green.withOpacity(0.1),
//                         filled: true,
//                         prefixIcon: Icon(Icons.account_circle),
//                       ),
//                     ),
//                     SizedBox(height: 20),
//                     TextField(
//                       controller: _accountNumberController, // Add this line
//                       decoration: InputDecoration(
//                         hintText: "Enter Account Number",
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(18),
//                           borderSide: BorderSide.none,
//                         ),
//                         fillColor: Colors.green.withOpacity(0.1),
//                         filled: true,
//                         prefixIcon: Icon(Icons.account_balance),
//                       ),
//                     ),
//                     SizedBox(height: 20),
//                     TextField(
//                       controller: _ifscCodeController, // Add this line
//                       decoration: InputDecoration(
//                         hintText: "Enter Your IFSC Code",
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(18),
//                           borderSide: BorderSide.none,
//                         ),
//                         fillColor: Colors.green.withOpacity(0.1),
//                         filled: true,
//                         prefixIcon: Icon(Icons.account_balance),
//                       ),
//                     ),
//                     SizedBox(height: 20),
//                     TextField(
//                       controller: _phoneNumberController, // Add this line
//                       decoration: InputDecoration(
//                         hintText: "Enter Phone Number",
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(18),
//                           borderSide: BorderSide.none,
//                         ),
//                         fillColor: Colors.green.withOpacity(0.1),
//                         filled: true,
//                         prefixIcon: Icon(Icons.phone),
//                       ),
//                     ),
//                     SizedBox(height: 20),
//                     TextField(
//                       controller: _beneIdController, // Add this line
//                       decoration: InputDecoration(
//                         hintText: "Enter beneId",
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(18),
//                           borderSide: BorderSide.none,
//                         ),
//                         fillColor: Colors.green.withOpacity(0.1),
//                         filled: true,
//                         prefixIcon: Icon(Icons.phone),
//                       ),
//                     ),
//                     SizedBox(height: 20),
//
//                     TextField(
//                       controller: _address1Controller, // Add this line
//                       decoration: InputDecoration(
//                         hintText: "Enter address1",
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(18),
//                           borderSide: BorderSide.none,
//                         ),
//                         fillColor: Colors.green.withOpacity(0.1),
//                         filled: true,
//                         prefixIcon: Icon(Icons.phone),
//                       ),
//                     ),
//                     SizedBox(height: 20),
//
//                   ],
//                 ),
//                 ElevatedButton(
//                   onPressed: ()=> _saveAccountDetails(context),
//                   child: Text(
//                     "Save details",
//                     style: TextStyle(fontSize: 18, color: Colors.white),
//                   ),
//                   style: ElevatedButton.styleFrom(
//                     shape: StadiumBorder(),
//                     padding: EdgeInsets.symmetric(vertical: 15),
//                     backgroundColor: Colors.green,
//                   ),
//                 ),
//                 SizedBox(height: 20),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }



import 'dart:convert';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:project/WithdrawAmountPage.dart';
import 'package:provider/provider.dart';
import 'UserState.dart';
import 'package:http/http.dart' as http;
import 'package:pointycastle/api.dart';
import 'package:pointycastle/asymmetric/api.dart';
import 'package:pointycastle/asymmetric/oaep.dart';
import 'package:pointycastle/asymmetric/rsa.dart';
import 'dart:typed_data';
import 'package:asn1lib/asn1lib.dart';

class BankAccountPage extends StatefulWidget {
  @override
  _BankAccountPageState createState() => _BankAccountPageState();
}

class _BankAccountPageState extends State<BankAccountPage> {
  final TextEditingController _accountHolderController = TextEditingController();
  final TextEditingController _accountNumberController = TextEditingController();
  final TextEditingController _ifscCodeController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _beneIdController = TextEditingController();
  final TextEditingController _address1Controller = TextEditingController();
  final TextEditingController _address2Controller = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  void _saveAccountDetails() async {
    String accountHolder = _accountHolderController.text;
    String accountNumber = _accountNumberController.text;
    String ifscCode = _ifscCodeController.text;
    String phoneNumber = _phoneNumberController.text;
    String beneId = _beneIdController.text;
    String address1 = _address1Controller.text;
    String email = _emailController.text;

    if (accountHolder.isEmpty ||
        accountNumber.isEmpty ||
        ifscCode.isEmpty ||
        phoneNumber.isEmpty ||
        beneId.isEmpty ||
        address1.isEmpty ||
        email.isEmpty) {
      Fluttertoast.showToast(msg: 'Please fill all the fields');
      return;
    }

    try {
      String userId = Provider.of<UserState>(context, listen: false).userId;
      print('inside userId  ${userId}');
      // Query the database to find the unique key based on the uid
      DatabaseReference database = FirebaseDatabase.instance.ref().child('users');
      DatabaseEvent event = await database.orderByChild('uid').equalTo(userId).once();

      if (event.snapshot.exists) {
        Map<dynamic, dynamic> userData = event.snapshot.value as Map<
            dynamic,
            dynamic>;
        String uniqueKey = userData.keys.first;

        // Update the data at the location of the unique key
        DatabaseReference userRef = database.child(uniqueKey);

        await userRef.update({
          'name': accountHolder,
          'bankAccount': accountNumber,
          'ifsc': ifscCode,
          'phone': phoneNumber,
          'beneId': beneId,
          'address1': address1,
          'bankEmail': email,
        });


        Fluttertoast.showToast(msg: 'Data successfully stored');
        generateToken('CF10180708CP5EDP9BRFKLVP14O2B0',
            'cfsk_ma_test_0a6279ba7f0a2e722564bdb922ab9aa9_ed6b5c19');
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => WithdrawAmountPage()));
      }else{
        Fluttertoast.showToast(msg: 'user not found');
      }
    } catch (e) {
      Fluttertoast.showToast(msg: 'Failed to update account details: $e');
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

    Map<String, String> body = {
      "clientId": clientId,
      "clientSecret": clientSecret,
      "signature": signature,
    };

    String jsonBody = json.encode(body);

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

    if (response.statusCode == 200) {
      Map<String, dynamic> responseData = json.decode(response.body);
      dynamic data = responseData['data'];
      String token = data['token'];
      verifyToken(token);
      return token;
    } else {
      throw Exception('Failed to generate token: ${response.statusCode}');
    }
  }

  Future<void> verifyToken(String token) async {
    final String url = 'https://payout-gamma.cashfree.com/payout/v1/verifyToken';
    final String authHeader = 'Bearer $token';

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
        addBeneficiary(authHeader);
      } else {
        print('Failed to verify token: ${responseData['message']}');
      }
    } else {
      print('Failed to verify token: ${response.statusCode}');
    }
  }

  Future<void> addBeneficiary(String token) async {
    final String url = 'https://payout-gamma.cashfree.com/payout/v1/addBeneficiary';

    Map<String, dynamic> requestBody = {
      "bankAccount": _accountNumberController.text,
      "ifsc": _ifscCodeController.text,
      "beneId": _beneIdController.text,
      "name": _accountHolderController.text,
      "email": _emailController.text,
      "phone": _phoneNumberController.text,
      "address1": _address1Controller.text,
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
    } else {
      print('Failed to add beneficiary: ${response.statusCode}');
    }
  }

  Future<String> generateSignature(String clientId, String publicKeyPem) async {
    final int timestamp = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    final String dataToEncrypt = '$clientId.$timestamp';
    final RSAPublicKey publicKey = parsePublicKeyFromPem(publicKeyPem);
    final Uint8List encryptedData = encryptDataWithOAEP(publicKey, dataToEncrypt);
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

  @override
  void dispose() {
    _accountHolderController.dispose();
    _accountNumberController.dispose();
    _ifscCodeController.dispose();
    _phoneNumberController.dispose();
    _beneIdController.dispose();
    _address1Controller.dispose();
    _address2Controller.dispose();
    _cityController.dispose();
    _emailController.dispose();
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
                    SizedBox(height: 30),
                    Container(
                      height: 90,
                      width: 90,
                      child: Image.asset('assets/images/Logo.png'),
                    ),
                    Text(
                      "Enter Your Account Details",
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Column(
                  children: <Widget>[
                    _buildTextField(
                      controller: _accountHolderController,
                      hintText: "Account Holder Name",
                      icon: Icons.account_circle,
                    ),
                    SizedBox(height: 20),
                    _buildTextField(
                      controller: _accountNumberController,
                      hintText: "Account Number",
                      icon: Icons.account_balance,
                    ),
                    SizedBox(height: 20),
                    _buildTextField(
                      controller: _ifscCodeController,
                      hintText: "IFSC Code",
                      icon: Icons.code,
                    ),
                    SizedBox(height: 20),
                    _buildTextField(
                      controller: _phoneNumberController,
                      hintText: "Phone Number",
                      icon: Icons.phone,
                    ),
                    SizedBox(height: 20),
                    _buildTextField(
                      controller: _beneIdController,
                      hintText: "Beneficiary ID",
                      icon: Icons.badge,
                    ),
                    SizedBox(height: 20),
                    _buildTextField(
                      controller: _address1Controller,
                      hintText: "Address Line 1",
                      icon: Icons.location_on,
                    ),
                    SizedBox(height: 20),
                    _buildTextField(
                      controller: _emailController,
                      hintText: "Email",
                      icon: Icons.markunread_mailbox,
                    ),
                  ],
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _saveAccountDetails,
                  child: const Text(
                    "Save Details",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: StadiumBorder(),
                    padding: EdgeInsets.symmetric(vertical: 14),
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


