
import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(253, 254, 255, 1.0),
      appBar: AppBar(
        title: Text('Privacy Policy'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Privacy Policy',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Text(
                'Afflicartz.com (We, Our, Afflicartz, or Us) own and operate the website and mobile application Afflicartz.com (Website, Our Website, Site).',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                'For the purpose of providing the Services (as defined in clause 1 below), Afflicartz is required to collect and use certain information of the users of the Website (Users) using the Services and involves capturing, storage, and transmission of such information. This privacy policy (Privacy Policy/Policy) explains how We collect, use, share and protect personal information of the Users of the Services (jointly and severally referred to as You, Your, Yourself or User or Users in this Privacy Policy).',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                '1. Definitions',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                '“Personal Information” shall have the same meaning as given in Rule 2(1)(i) of the Information Technology (Reasonable Security Practices and Procedures and Sensitive Personal Data or Information) Rules, 2011 to mean any information that relates to a natural person, which, either directly or indirectly, in combination with other information available or likely to be available to a body corporate, is capable of identifying such person.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                '2. Collection of Information',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'We collect the following types of information from you when you use our Services:',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8),
              Text(
                '• Personal Information: Name, email address, phone number, and other contact information.',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '• Usage Data: Information about how you use our Website and Services.',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '• Device Information: Information about the device you use to access our Services, including device type, operating system, and browser type.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                '3. Use of Information',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'We use the information we collect for the following purposes:',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8),
              Text(
                '• To provide and maintain our Services.',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '• To notify you about changes to our Services.',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '• To provide customer support.',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '• To monitor the usage of our Services.',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '• To detect, prevent, and address technical issues.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                '4. Sharing of Information',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'We may share your information with third parties in the following circumstances:',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8),
              Text(
                '• With your consent.',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '• To comply with legal obligations.',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '• To protect and defend our rights and property.',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '• To prevent or investigate possible wrongdoing in connection with our Services.',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '• To protect the personal safety of users of our Services or the public.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                '5. Security of Information',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'We use appropriate security measures to protect your information from unauthorized access, use, or disclosure. However, no method of transmission over the Internet or method of electronic storage is 100% secure, and we cannot guarantee absolute security.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                '6. Changes to This Privacy Policy',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'We may update our Privacy Policy from time to time. We will notify you of any changes by posting the new Privacy Policy on this page. You are advised to review this Privacy Policy periodically for any changes. Changes to this Privacy Policy are effective when they are posted on this page.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                '7. Contact Us',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'If you have any questions about this Privacy Policy, please contact us at:',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8),
              Text(
                'Email: support@afflicartz.com',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                'Phone: +1 234 567 890',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                'Address: 123 Privacy St, Suite 100, Privacy City, PC 12345',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



