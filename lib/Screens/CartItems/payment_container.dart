import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sizzco/Screens/home_screen/home_screen.dart';
import 'package:sizzco/Utilies/colors.dart';
import 'package:sizzco/widgets/primaryText.dart';

import '../../APIServices/checkout_api.dart';
import '../../APIServices/stripe_service.dart';
import '../../Models/AddressModels.dart';

InkWell PaymentMethod(
    String imageLink,
    String title,
    String method,
    TextEditingController name,
    TextEditingController email,
    TextEditingController address,
    TextEditingController city,
    TextEditingController state,
    TextEditingController country,
    TextEditingController postcode,
    TextEditingController phone,
    BuildContext context,
    ) {
  return InkWell(
    onTap: () async {
      if (method == "COD") {
        if (_areTextControllersEmpty([
          name,
          email,
          address,
          city,
          state,
          country,
          postcode,
          phone,
        ])) {
          Fluttertoast.showToast(msg: 'All fields must be filled');
          return;
        }

        Billing billing = Billing(
          firstName: name.text,
          lastName: "",
          address1: address.text,
          city: city.text,
          state: state.text,
          postcode: postcode.text,
          country: country.text,
          email: email.text,
          phone: phone.text,
          address2: '',
        );

        Shipping shipping = Shipping(
          firstName: name.text,
          lastName: "",
          address1: address.text,
          city: city.text,
          state: state.text,
          postcode: postcode.text,
          country: country.text,
          email: email.text,
          phone: phone.text,
          address2: '', // You may need to adjust this based on your requirements
        );

        bool check =
        await placeOrder(method, title, billing, shipping,false);

        if (check) {
          Fluttertoast.showToast(msg: 'Order is successfully placed');
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => HomeScreen()),
          );
        } else {
          Fluttertoast.showToast(
            msg: 'Failed to place the order. Please try again.',
          );
        }
      } else if (method == "Online Payment") {
        await StripeService.stripePaymentCheckout(
          context: context,
          mounted: true,
          onSuccess: () async {
            print("Success");
            if (_areTextControllersEmpty([
              name,
              email,
              address,
              city,
              state,
              country,
              postcode,
              phone,
            ])) {
              Fluttertoast.showToast(msg: 'All fields must be filled');
              return;
            }

            Billing billing = Billing(
              firstName: name.text,
              lastName: "",
              address1: address.text,
              city: city.text,
              state: state.text,
              postcode: postcode.text,
              country: country.text,
              email: email.text,
              phone: phone.text,
              address2: '',
            );

            Shipping shipping = Shipping(
              firstName: name.text,
              lastName: "",
              address1: address.text,
              city: city.text,
              state: state.text,
              postcode: postcode.text,
              country: country.text,
              email: email.text,
              phone: phone.text,
              address2: '',
            );

            bool check =
            await placeOrder(method, title, billing, shipping,true);

            if (check) {
              Fluttertoast.showToast(msg: 'Order is successfully placed');
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => HomeScreen()),
              );
            } else {
              Fluttertoast.showToast(msg: 'Order is Placed Successfully');
            }
          },
          onError: (e) {
            print("Error: $e");
            Fluttertoast.showToast(
              msg: 'Failed to place the order. Please try again.',
            );
          },
          onCancel: () {
            print("Cancelled");
          },
        );
      }
    },
    child: Container(
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      padding: EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: AppColors.getLightPrimaryColor(),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
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

bool _areTextControllersEmpty(List<TextEditingController> controllers) {
  return controllers.any((controller) => controller.text.isEmpty);
}
