import 'package:flutter/material.dart';
import 'package:sizzco/Screens/Settings/settings_screen.dart';
import 'package:sizzco/widgets/textContainer.dart';

import '../../Utilies/colors.dart';
import '../../widgets/bottomNav.dart';

class PrivaryScreen extends StatelessWidget {
  const PrivaryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          TextContainer("READ ABOUT KNIFE WARRANTIES OR RETURNS & EXCHANGES",
              '''The Privacy Policy applies to personal information that may be collected when you interact with Sizzco, Inc. (“Sizzco”) and its websites (“Sizzco Websites”) at www.sizzco.com, /store/ or at the auction site and other pages operated by Sizzco Knives or by emails with us. Protecting the privacy and security of your personal information is a priority at Sizzco Knives, and we believe that a single, comprehensive privacy policy that is straightforward and clear is in the best interests of our customers and our businesses.

By doing business with or interacting with the Sizzco Knives Websites or by emails in the manner described in this Privacy Policy at any time on or after the Effective Date, you are accepting the practices described in this Privacy Policy and you expressly consent to the application of this Privacy Policy to the collection, storage, use and disclosure of all your personal information as described.

Sizzco Knives reserves the right to modify or amend this Privacy Policy at any time, but you can be assured that, should it be necessary to do so, we will post the changes in advance of the time that they become effective.'''),
          TextContainer(
              'INFORMATION AUTOMATICALLY COLLECTED WHEN YOU VISIT OUR WEBSITES',
              '''When you visit our Websites or send us emails, we automatically record information that your browser or emails provide whenever you visit a Sizzco Knives Website or send emails. For example, we may receive and collect: the name of the domain and host from which you access the Internet; the Internet Protocol (IP) address of the computer you are using; the date and time you access our websites; and the Internet address of the website from which you linked directly to our sites. We use this information to monitor the usage of our websites and as necessary for our business. This information does not include personal information except in the case of emails, we will have your email address and other personal information that you may decide to provide to us.'''),
          TextContainer('INFORMATION COLLECTED USING COOKIES',
              '''We use cookies to personalize and enhance your browsing and shopping experience during your sessions with us. Cookies are small files that we place on your computer’s hard drive to collect information about your activities on our Websites. Cookies help us to:

Speed navigation, keep track of items in your shopping cart and provide you with content that is tailored to you
Remember information you gave us so that you don’t have to reenter it
Determine the effectiveness of some of our marketing efforts and communications
Monitor the total number of visitors, pages viewed, and the total number of any banners displayed
Browsers are typically set to create cookies automatically. You can choose to have your browser notify you when cookies are being written to your computer or accessed, or you can disable cookies entirely. If you disable cookies, however, you will not be able to participate in any auctions at the Auction Site, and therefore you will not be able to place bids with us online. Also, by not using cookies, some Sizzco Knives Website features and Services may not function properly.'''),
          TextContainer('SITE ANALYTICS',
              '''We work with third party service providers to help us better understand how you use our Sizzco Knives Websites or to make your email experiences efficient and to determine whether emails are delivered and opened. Our third party service providers will place cookies on your computer to collect information or will track emails and when you open them or will record bounces (non-delivered emails) and sometimes may collect information on the email client. The information that our third party service providers collect will tell us things like which search engine referred you to our websites, how you navigated around our websites, what you purchased and what traffic is driven by banner ads and emails or whether you have opened any emails from us. This information will help us to better serve you and provide you with more personalized information and product offerings. We do not allow our third party service providers to collect your credit card information or password information. Our third party service providers may only use your personal information to perform services for us. Our third party service providers are contractually required to maintain all of the information they collect and analyze for us securely and in confidence. Our third party service providers may not share your personal information with anyone else, or use it for any other purpose, except on an aggregate, non-personal basis. For more information, view our third party service providers’ privacy policies.

Please note that our third party service providers collect data on our Sizzco Knives Websites or our emails using first-party data collection. As a result, blocking cookies from third-party domains will not block these first-party cookies. As a user of our Sizzco Knives Websites, you may choose to opt-out of this third party’s analysis of your browsing and purchasing behavior on our websites.'''),
          TextContainer('REGISTRATION AT THE AUCTION SITE',
              '''At registration for the Auction Site, we will collect personal information. Personal information is your name in combination with other information that we collect about you. For example, personal information will include your first name, last name, address, home phone, email address, billing address, credit card number, expiration date, and security code. We may require additional information for registration.'''),
          TextContainer('WHAT DO WE USE YOUR INFORMATION FOR?',
              '''To process transactions: Your information will not be sold, exchanged, transferred, or given to any other company for any reason whatsoever, without your consent, other than the purpose of processing and delivering your order.
To send periodic emails if you opt to receive such emails: The email address you provide may be used to send you information and updates pertaining to your order, in addition to receiving occasional company news, updates, related information and etc. Please note that when you register for our Auction Site, you must agree to receive all our emails, including those relating to any auctions in which you participate and other emails from us.
To personalize your experience so as to provide you with a superior customer experience and, as necessary, to administer our business with you.
To improve our Auction Site for yours and other registered users future uses.'''),
          TextContainer('HOW DO WE PROTECT YOUR INFORMATION?',
              '''Your security while using our website is very important. We take significant and appropriate security measures, including physical, technological and procedural measures, to help to safeguard your personal information and to prevent unauthorized access and disclosure. In addition, we use industry-standard technology, such as firewalls and encryption in the transmission of certain sensitive personal information, designed to prevent unauthorized persons from gaining access to your personal information, and, as technology develops, we intend to take additional measures to improve security.
''')
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.getPrimaryColor(),
        child: Icon(
          Icons.settings,
          color: Colors.white,
          size: 25,
        ),
        onPressed: () {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => SettingScreen()));
          // Implement your functionality here
        },
      ),
      bottomNavigationBar: NavBar(select: 0),
    );
  }
}
