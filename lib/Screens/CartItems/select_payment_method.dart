import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizzco/Screens/CartItems/payment_method_card.dart';
import 'package:sizzco/widgets/primaryText.dart';

class SelectPaymentMethod extends StatefulWidget {
  const SelectPaymentMethod({Key? key}) : super(key: key);

  @override
  State<SelectPaymentMethod> createState() => _SelectPaymentMethodState();
}

class _SelectPaymentMethodState extends State<SelectPaymentMethod> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(30),
          child: Column(
            children: [
             PrimaryText("Select a Payment Method"),
              PaymentMethodCard('assets/img_1.png',"Cash on Delivery",context),
              PaymentMethodCard("assets/card_payment.png","Online Payment",context),

            ],
          ),
        )

      ),
    );
  }
}
