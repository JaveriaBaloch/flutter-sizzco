import 'package:flutter/material.dart';
import 'package:sizzco/widgets/primaryText.dart';

Container discountBanner(String amount) {
  String fivePrecent = (0.95 * double.parse(amount)).toStringAsFixed(2);
  String sevenPrecent = (0.93 * double.parse(amount)).toStringAsFixed(2);
  String tenPrecent = (0.90 * double.parse(amount)).toStringAsFixed(2);

  return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30), color: Colors.white),
      child: Column(
        children: [
          PrimaryText("Discount Per Quantity"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text("Quantity"),
                  Text("Discount"),
                  Text("Price"),
                ],
              ),
              Column(
                children: [Text("2 - 5"), Text("5%"), Text(fivePrecent)],
              ),
              Column(
                  children: [Text("6 - 10"), Text("7%"), Text(sevenPrecent)]),
              Column(
                children: [Text("11 - 20"), Text("10%"), Text(tenPrecent)],
              )
            ],
          )
        ],
      ));
}
