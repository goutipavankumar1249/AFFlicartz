import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(253, 254, 255, 1.0),
      appBar: AppBar(
        title: Text('Contact Us'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'You can get in touch with us through below platforms. Our team will reach out to you as soon as possible.',
                style: TextStyle(
                  fontSize: 13.0,
                  color: Colors.blueGrey,
                ),
              ),
              SizedBox(height: 20.0),
              Card(
                elevation: 4.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Customer Support',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.phone),
                      title: Text('Contact Number'),
                      subtitle: Text('+91 8899776655'),
                      onTap: () {
                        _launchURL('https://example.com');
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.email),
                      title: Text('Email Address'),
                      subtitle: Text('help@afflicartz.com'),
                      onTap: () {
                        _launchURL('https://example.com');
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              Card(
                elevation: 4.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Social Media',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        child: Image.asset('assets/images/insta.png'),
                      ),
                      title: Text('Instagram'),
                      subtitle: Text('@afflicartz_'),
                      onTap: () {
                        _launchURL('https://www.instagram.com');
                      },
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        child:Image.asset('assets/images/youtube.png'),
                      ),
                      title: Text('Youtube'),
                      subtitle: Text('@afflicartz_ecommerce'),
                      onTap: () {
                        _launchURL('https://www.youtube.com');
                      },
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        child:Image.asset('assets/images/twitter.png'),
                      ),
                      title: Text('Twitter'),
                      subtitle: Text('@afflicartz_ecom'),
                      onTap: () {
                        _launchURL('https://www.twitter.com');
                      },
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        child:Image.asset('assets/images/whatapp.png'),
                      ),
                      title: Text('WhatApp'),
                      subtitle: Text('@afflicartz_ecom'),
                      onTap: () {
                        _launchURL('https://www.whatsapp.com');
                      },
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        child:Image.asset('assets/images/telegram.png'),
                      ),
                      title: Text('Telegram'),
                      subtitle: Text('@afflicartz_ecom'),
                      onTap: () {
                        _launchURL('https://www.telegram.com');
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}