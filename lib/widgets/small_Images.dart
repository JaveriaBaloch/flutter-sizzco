import 'package:flutter/cupertino.dart';

Widget SmallImages(String image) {
  return Container(
    width: 80,
    height: 80,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      image: DecorationImage(
        fit: BoxFit.cover,
        image: NetworkImage(image),
      ),
    ),
  );
}
