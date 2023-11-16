import 'package:flutter/material.dart';
import 'package:sizzco/APIServices/stripe_service.dart';
import 'package:sizzco/Screens/CartItems/stripecheckout.dart';
import 'package:sizzco/Utilies/colors.dart';
import 'package:sizzco/widgets/primaryText.dart';

import 'CodCheckout.dart';

Widget PaymentMethodCard(
    String imageLink,
    String title,
    BuildContext context,
    ) {
  return InkWell(
    onTap: () async {
      if (title == "Cash on Delivery") {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => CodCheckoutScreen()),
        );
      } else if (title == "Online Payment") {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => StripePaymentCheckoutScreen()),
        );
      }
    },
    child: Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      padding: EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: AppColors.getLightPrimaryColor(),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.asset(
              imageLink,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 20),
          PrimaryText(title),
        ],
      ),
    ),
  );
}
