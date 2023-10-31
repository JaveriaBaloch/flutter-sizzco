import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import this line for using FilteringTextInputFormatter
import 'package:sizzco/Utilies/colors.dart';

Widget NumberFliedCheckoutWidget(
    String hintText, TextEditingController controller) {
  return Container(
    margin: EdgeInsets.all(5),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(30.0),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 2,
          blurRadius: 5,
          offset: Offset(0, 3),
        ),
      ],
    ),
    child: TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      // Set the keyboardType to accept only numbers

      // Add the inputFormatters property to allow only numbers
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly,
      ],

      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide(color: AppColors.getLightPrimaryColor()),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide(color: AppColors.getLightPrimaryColor()),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide(color: AppColors.getPrimaryColor()),
        ),
      ),
    ),
  );
}
