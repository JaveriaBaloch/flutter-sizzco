import 'package:flutter/material.dart';

Container MainProductImage(String image) {
  return Container(
    width: 340,
    height: 200,
    padding: EdgeInsets.all(10),
    margin: EdgeInsets.all(10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30),
      color: Colors.white,
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Image.network(
        image,
        fit: BoxFit.fitWidth, // 'BoxFit' was corrected to 'BoxFit.fitWidth'
      ),
    ),
  );
}
