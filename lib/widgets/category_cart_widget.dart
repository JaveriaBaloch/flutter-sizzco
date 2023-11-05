import 'package:flutter/material.dart';

import '../Screens/CategoryScreen/products_by_category_screen.dart';

InkWell CategoryCard(
    String imageLink, String title, BuildContext context, String id) {
  return InkWell(
    onTap: () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (_) => ProductByCategoryScreen(
                text: id,
              )));
    },
    child: Container(
      alignment: Alignment.center,
      margin: EdgeInsets.all(10),
      width: 130,
      // height: 180,
      padding: EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(27),
            child: Image.network(
              imageLink,
              fit: BoxFit.cover,
              width: 130,
              height: 90,
            ),
          ),
          SizedBox(height: 6),
          Text(title),
        ],
      ),
    ),
  );
}
