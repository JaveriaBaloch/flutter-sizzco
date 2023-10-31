import 'package:flutter/material.dart';
import 'package:sizzco/Screens/Settings/settings_screen.dart';
import 'package:sizzco/widgets/textContainer.dart';

import '../../Utilies/colors.dart';
import '../../widgets/bottomNav.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          TextContainer(
              'TERMS & CONDITIONS', '''Shipping, Return and Refund Policy

Hours:
Online orders and faxed orders are accepted 24 hours/7 days a week.

1) Shipping
We ship within 1-3 days after receiving the Payment.
NOTE: All claims of shortages or damages will only be accepted if LTL Bill of Lading receipt notes such at time of delivery from recipient. Please count the total number of cartons received and that it matches the number of cartons stated on the LTL Bill of Lading receipt. SIZZLING KNIFE STONES. will not be responsible for any shortages or damages if LTL Bill of Lading is signed for without notations of such.

2) Discount Policy
Effective immediately this price list supersedes all previous price lists. Prices are subject to change with or without notice.
Discounts are available based on the shipment total (discounts apply to shippable merchandise only:
Shipment total \$251 – \$500: 10% off
Shipment total \$501 – \$1000: 15% off
Shipment total \$1001 – and over: 20% off
Volume discounts do not apply to items on sale or close out.
Quantity prices apply to one color or style only.

How long will it take my product to arrive?
After placing an order with SIZZCO.COM you’ll receive an estimated delivery date during the checkout process. Your actual date of delivery will depend on the shipping option you choose. Keep in mind that on occasion bad weather and shipping company delays can slow down orders.

What different shipping options do you offer?
We offer standard (ground) and expedited shipping on most orders — simply choose the appropriate shipping method during checkout.

How much will the shipping cost?
We provide you with shipping costs for a variety of shipping methods while you are shopping and during checkout. Our shipping prices are based on the exact quote of major shipping companies to ship from the warehouse to your address. We do not make a profit on shipping.

Do you ship to military bases?
Absolutely. We are proud to serve our men and women in uniform by shipping to APO and FPO addresses.

Can I track my order?
Yes. Each SIZZCO order comes with a customized tracking code, which will be emailed to you once your order ships and will allow you to track your order progress.

Is there a way to check my order status on your site?
Yes. Please visit our page Order Update to view the current status of your order. You will need your order number and billing address zip code. You can reach us Via Our Contact Us Page with your order number and let us know that you are checking on the status of your order.

I hear you offer free shipping. Is that true?
You, We offer Free Shipping Within USA Main Land & or Some Specific items!

I have additional questions. Where can I ask them?
Send us an email at sizzlingknifestones@gmail.com and we will get back to you fast. You can get our Full Contact Info here.

2) Return and Refund Policy
We have a 15-day return policy, which means you have 15 days after receiving your item to request a return.

To be eligible for a return, your item must be in the same condition that you received it, unworn or unused, with tags, and in its original packaging. You’ll also need the receipt or proof of purchase.

To start a return, you can contact us at sizzlingknifestones@gmail.com Upon your return acceptance, we’ll send you a return shipping label, as well as for instructions on how and where to send your package. Items sent back to us without first requesting a return will not be accepted.

You can always contact us with any return question

1) sizzlingknifestones@gmail.com

2) Call us @ +92 304 667 4000

3) For Quick Response Whatsapp us at: +92 311 763 2184

Issuing Refunds

Once your return is accepted, we’ll send you a return shipping label, as well as the instructions on how and where to send your package.

We will notify you once we’ve received and inspected your return, and let you know if the refund was approved or not. If approved, you’ll be automatically refunded on your original payment method. Please remember it can take some time for your bank or credit card company to process

Damages and issues
Please inspect your order upon reception and contact us immediately if the item is defective, damaged or if you receive the wrong item so that we can evaluate the issue and make it right.

Exceptions / non-returnable items
Certain types of items cannot be returned, like perishable goods (such as food, flowers, or plants), custom products (such as special orders or personalized items), and personal care goods (such as beauty products). We also do not accept returns for hazardous materials, flammable liquids, or gases. Please get in touch if you have questions or concerns about your specific item.
Unfortunately, we cannot accept returns on sale items or gift cards.

Exchanges
The fastest way to ensure you get what you want is to return the item you have, and once the return is accepted, make a separate purchase for the new item.

No Ship Countries
We Don’t Ship to ISRAEL, INDIA.''')
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
