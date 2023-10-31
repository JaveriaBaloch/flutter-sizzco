import 'package:flutter/material.dart';
import 'package:sizzco/Screens/Settings/settings_screen.dart';
import 'package:sizzco/widgets/textContainer.dart';

import '../../Utilies/colors.dart';
import '../../widgets/bottomNav.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          TextContainer("About Us",
              "SIZZLING KNIFE STONES have been Manufacturing & Exporting High Quality Handmade Damascus & Stainless Steel Blanks, Fixed knives, Daggers, Pocket knives, Hunting knives, Kitchen knives, Swords, Axes & Cutlery products using premium quality material since 1997."),
          TextContainer("CEO", '''AHMED MUSTAFA
Our highly Skilled Artisans and Craftsmen work these materials by Hand using time Honoured Traditional methods to produce premium quality Damascus in a Range of Patterns and Styles. We use Machinery and Equipment to Achieve Consistently High Quality in the Grinding and heat treatment of our finished and semi-finished products. Our Sizzling’s Highly Dedicated team take great pride in the quality of their workmanship and their growing reputation for Timely, Efficient and Friendly service to both large and small Customers to Worldwide. Our Sizzling’s Purpose is to be Leader in the knives industry by providing Enhanced Services, Relationship and Profability. Our vision is to provide Quality services that exceeds the expectations of our Esteemed Customers. Our Mission is to Build Long Term Relationship with our Customers and Provide Exceptional Customer Services by Pusuing Business through innovation and Advanced technology. We Assure to Provide Best Quality at Best Wholesale and Retail Prices. We also accept Custom Orders.'''),
          TextContainer('OUR DAMASCUS STEEL',
              '''Damascus steel is Hot-forged Steel. The foundation of Damascus steel basically is Wootz steel and pattern welding Technique. The technique to create original Damascus steel is currently matter for Historic Conjecture. Our modern Damascus steel is developed like pattern welding; strips of two metals, 15N20 high nickel alloy and 1095 high carbon steel. These strips are tied up with clamp in many layers and weld them. Then that pile placed in fire, when the steel is cherry red, it is ready for hammering. With hammering, it get Hammered many times in a specific way considering different patterns either ladder, twist, rain drop, mosaic, straight, fire etc. And this process continuous repeatedly. Final hammering develops the desired pattern and layers range from 172-256, depending on the nature of use, either knives, swords or Axe. To enhance the pattern by darkening, pickled the steel in dilute acid after grinding and polishing. Specifically, to expose the layers is not a secret. Our modern heat treatment process gives each blade about 58-62 HRC hardness.'''),
          TextContainer('SOME OF OUR PATTERNS ARE',
              '''WIST, RAIN DROP, LADDER , MOSAIC, STRAIGHT, FIRE & BUTTERFLY and can be Available in any Dimension on Demand
1. We ensure that the products are manufactured according to demand customer’s requirements and expectations.
2. We are committed to achieve accuracy, precision & consistency in our products.
3. We deliver the product right the first time, on time and every time through effective system.
4. We pledge to satisfy our clients by providing Quality Product through motivated qualified and dynamic team of people.''')
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
      bottomNavigationBar: NavBar(select: 5),
    );
  }
}
