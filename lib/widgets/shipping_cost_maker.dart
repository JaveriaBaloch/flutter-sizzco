import 'package:flutter/material.dart';
import 'package:sizzco/Utilies/colors.dart';

Container ShippingCostMarker() {
  return Container(
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
        color: AppColors.getPrimaryColor(),
        borderRadius: BorderRadius.circular(10)),
    child: Text(
      "Shipping cost:\t\$70",
      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
    ),
  );
}
