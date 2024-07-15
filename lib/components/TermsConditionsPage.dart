import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TermsConditionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(253, 254, 255, 1.0),
      appBar: AppBar(
        title: Text('Terms & Conditions'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('1. Introduction:'),
            SizedBox(height: 8),
            _buildParagraph(
                'Thank you for visiting www.Afflicartz.com or the Afflicartz mobile application (together the “Afflicartz”) – Cashback Site www.Afflicartz.com. The Cashback Service (“We”, “Us”, “Afflicartz” or “Our” where such expression shall unless repugnant to the context thereof, be deemed to include its respective legal heirs, representatives, administrators, permitted successors and assigns). By using the various services available on the Afflicartz Platform (“Services”), you consent to these terms, guidelines and supplemental terms provided to you for the Services that you use (collectively, “Terms”) and Afflicartz efforts to improve every User’s experience on the platform. Please read these terms and conditions (“Terms and Conditions” or “Agreement”) carefully as they contain the legal terms and conditions that you agree to when you use the service provided by us through the Website and the App (“Platform”, “Website”). We will also notify our registered members of material changes (if any) to these terms and conditions by either sending a notice to the email address provided to us at the time of signing-up or by placing a pop-up on our website/mobile application(s). Be sure to visit this page periodically to review the most recent version of the Agreement.'),
            SizedBox(height: 16),
            _buildSectionTitle('2. Membership:'),
            SizedBox(height: 8),
            _buildParagraph(
                'Our membership is available through registration process after you submit certain requested information to Afflicartz. A user must read and click on the checkbox to accept the prevailing Terms and Conditions which the User needs to adhere to while availing Our services.\n\nPlease be aware that a member of Afflicartz is not allowed to run any paid ads on Google, Facebook or any other platform pointing to Afflicartz. If the member does not comply with this then it would result in immediate termination of his/her account.\n\nDeclaration:\n\nThe purchases made by You using the platform of Afflicartz will be used only for bona fide personal purposes. You shall not use Afflica Platform to purchase anything to resell for commercial or business purposes, to derive any financial gain. Afflicartz also reserves the right to block/terminate the User\'s account on Afflicartz Platform without any prior notice if, based on its risk management criteria, it reasonably believes that Afflicartz Platform is used for any nonauthorized purposes.'),
            SizedBox(height: 16),
            _buildSectionTitle('3. Our Service:'),
            SizedBox(height: 8),
            _buildParagraph(
                'Afflicartz Service:\n\nOur Afflicartz Service allows users who register on the Platform (“Members”) and therefore create an account with us (“Account”) to earn cashback by making purchases from the retailers listed on Our Platform (“Retailers”). To qualify for cashback, the Retailer must confirm that the Member’s purchase is tracked, genuine and successful (constituting a “Qualifying Transaction”), and your resulting cashback must be received by us (becoming “Cashback” as a result). The earned Cashback can be transferred directly to the bank accounts only after reaching the minimum limit of threshold set by Us.\n\nA transaction is termed to be a qualified transaction where, the user is redirected by Afflicartz to the Retailer’s platform /Website making a valid and subsisting purchase afterwhich the Product/service is duly delivered, and the refund/return period has also expired.\n\nIn the event that the Retailers do not track a transaction using their affiliate tracking system, then such sales might not be paid to Afflicartz, and hence any due or expected cashback from these sales will also not be paid to the Member.\n\nReward Program\n\nOur Reward program allows the registered users to earn Rewards by making purchases through Us and thereafter be redirected to the selective retailers, with whom, we have partnered and agreed to provide rewards instead of cashbacks. Earnings in the form of rewards cannot be transferred to the bank account of the user but can only be redeemed via gift cards or wallet, only after reaching the minimum limit of threshold set by Us.'),
            _buildParagraph(
                'Unique Referral Fee:\n\nThe Afflicartz Service also provides a unique referral fee to its Members where the Existing Members (referrer) gets 10% (Ten percent) cashback on each new Member’s (referee) introduced by them in the manner provided on the Platform (“Qualifying Referral”) as long as they remain a Member themselves. The referee, transacting at specific stores/retailers, may not make the referrer qualify for the 10% cashbacks. Please see Clause 5 below for details.\n\nAfflicartz complies to stringent laws of the land and the Members are obliged to stick to the lawful use of our website. We are persistent to enhance our referral programme and we retain the right to modify any referral programme terms at any time and without notice.'),
            SizedBox(height: 16),
            _buildSectionTitle('4. Becoming a Member:'),
            SizedBox(height: 8),
            _buildParagraph(
                'If You are a natural person, (i) as a condition to Your use of the Platform, You must be 18 (eighteen) years of age or older; and (ii) by visiting the Platform or accepting these Terms and Conditions, You represent and warrant to Afflicartz that You are 18 (eighteen) years of age or older, and that You have the right, authority and capacity to use the Platform and agree to and abide by these Terms and Conditions; provided however that if You are a parent or legal guardian of a person younger than 18 (eighteen) years of age, You are permitted to access and use the Platform for the purposes of procuring the Services, on behalf of such persons. You must register for the Cashback Service using accurate and current information about yourself – including your correct name, address and any other requested details. If you are asked for, and provide, details of a bank account, UPI or other payment mode details through which you wish to receive the pay-outs (your “Cashback Receipt Method”), you (a) must ensure that you are, and remain, fully entitled to use that Cashback Receipt Method, and (b) confirm that you wish to receive cashback through that Cashback Receipt Method. You should keep this information updated through your Account. We reserve the right to discontinue or temporary put on hold any payment methods listed on Our site, be it UPI, Bank Transfer or Wallet/Gift Card.\n\nGeneration and collection of ‘Sensitive Personal Data or Information’ is in accordance with Information Technology Act, 2000 as amended from time to time and allied rules requires the User’s express consent. By clicking on the “I agree with Terms and Policy” button at the time of registration, the User provides affirming assent to such information generation and collection as required under applicable laws.'),
            _buildParagraph(
                'Note that your Cashback Receipt Method (such as Bank Transfer, Gift Cards/ Wallets, UPI or other payment modes as We may introduce in the near future) provides a minimum Cashback threshold limit that a User needs to reach or attain in order to withdraw & receive Cashback through the opted Cashback Receipt Method.\n\nImportant: You must ensure that the email address and mobile number we hold for you is kept up-to-date and that you have full access to it – We will be sending you important updates via text messages & Emails , App Notifications and in some cases via WhatsApp. If you change your email address or mobile number, then you must change the details we hold for you on your Account.'),
            SizedBox(height: 16),
            _buildSectionTitle('5. Cashback/Reward and Referral Fees:'),
            SizedBox(height: 8),
            _buildParagraph(
                'After a Member successfully completes a Qualifying Transaction, and once we have received the resulting Cashback/Reward for that Qualifying Transaction, we pass that Cashback/Reward to the Member through his/her Cashback Receipt Method.\n\nPlease note that there are various circumstances in which a transaction with a Retailer may not constitute a Qualifying Transaction, or Cashback/Rewards may not result from it. This is also true for a Qualifying Referral. The Member understands that all transactions made by him/her are not with us, but with the individual Retailer. Our help pages provide further information about these circumstances. Further, from time to time Retailers may increase or decrease the commission paid – in which case the cashback/Reward offer illustrated on our Platform may be incorrect/outdated. By default, your applicable transactions will be credited in line with the commission reported to us by the Retailer, which may be more or less than the advertised rate.'),
            _buildParagraph(
                'When we have traced a paying, Qualifying Transaction to your Account, we will credit your Account with a Cashback/Reward on behalf of the Retailer as soon as the Retailer sends us the payment. This typically takes 90-120 days. Where a retailer reverses a transaction or fails to track a transaction to us, then we may debit your Account with the corresponding amount credited earlier.\n\nThere are various circumstances in which Cashback/Reward will not be payable to the Member, and will instead be retained by us, including but not limited to:\n\na. Where the commission earned by us is less than minimum threshold set by Afflicartz from time to time;\n\nb. Where a Member is not logged-in when making the relevant purchase or fails to use the relevant links provided by us before making the transaction;\n\nc. The purchase made is not a Qualifying Transaction or a Qualifying Referral in the manner set out above;\n\nd. If the Cashback/Reward payment received by us is rejected or failed validation by the Retailers;\n\ne. Where the commission payment from the Retailer is not received by us for any reason or has been clawed back by the Retailer for any reason;'),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: GoogleFonts.lato(
        textStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildParagraph(String text) {
    return Text(
      text,
      style: GoogleFonts.lato(
        textStyle: TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }
}
