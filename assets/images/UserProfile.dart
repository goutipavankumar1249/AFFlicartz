import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(userprofile());
}

class userprofile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'User Profile Page',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      home: Scaffold(
        body: Container(
          // padding: EdgeInsets.all(20.0),
          child: 
          Stack(
            children: [
              Card(
              elevation: 5,
              color: Color.fromARGB(255, 164, 205, 255),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Bank Details',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Text(
                          'Account Number:',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 2),
                    Row(
                      children: [
                          Text(
                      '1234567890', // Display the account number below the heading
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                      ],
                    ),
                    
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Text(
                          'IFSC Code:',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 2),
                    Row(
                      children: [
                        Text(
                      'ABC1234567', // Display the IFSC code below the heading
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
              Positioned(
                bottom: 190,
                right: 0,
                left: 0,
                top: 0,
                child:Card(
              elevation: 5,
              color: Color.fromARGB(255, 189, 240, 231),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Personal Details',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      
                      children: [
                        Icon(
                          Icons.email,
                          size: 24,
                          color: Colors.blue,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'user@gmail.com',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      
                      children: [
                        Icon(
                          Icons.phone,
                          size: 24,
                          color: Colors.blue,
                        ),
                        SizedBox(width: 8),
                        Text(
                          '+910000000000',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        
                      ],
                    ),
                  ],
                ),
              ),
            ),
              ),
            Positioned(
              bottom: 330,
                right: 0,
                left: 0,
                top:0,
              child: Card(
              elevation: 4,
              color: Color.fromARGB(255, 225, 239, 255),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("\u20B9${0.0}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                        SizedBox(height: 4),
                        Text('My Earnings',style:TextStyle(fontSize: 20),),
                      ],
                    ),
                    SizedBox(width: 16),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("\u20B9${0.0}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                        SizedBox(height: 4),
                        Text('My Rewards',style: TextStyle(fontSize: 20),),
                      ],
                    ),
                  ],
                ),
              ),
            ),
              ),
              Positioned(
                bottom: 450,
                right: 0,
                left: 0,
                child:UserProfileCard(
                  // profileImage: AssetImage('assets/images/people.png'),
                  username: 'Username',
                ) ,
                )
            
            ],
          ),
        ),
      ),
    );
  }
}
class UserProfileCard extends StatelessWidget {
  final String username;

  const UserProfileCard({
    Key? key,
    this.username = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: Color.fromARGB(255,239,239,239),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 45,
                  // backgroundColor: Colors.blue,
                  child: Icon(Icons.person,size: 60), // Temporary icon
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello,',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(
                      height: 0,
                    ),
                    Text(
                      '$username👋 ',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
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


