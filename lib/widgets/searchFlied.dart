import 'package:flutter/material.dart';
import 'package:sizzco/Utilies/colors.dart';

Container TextSearch(
    TextEditingController text, onPressed, BuildContext context) {
  return Container(
    alignment: Alignment.center,
    padding: EdgeInsets.symmetric(horizontal: 5),
    // width: MediaQuery.of(context).size.width *0.9, // Adjust the width as needed
    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
    child: Row(
      children: [
        Container(
          alignment: Alignment.center,

          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50), color: Colors.white),
          width: MediaQuery.of(context).size.width *
              0.75, // Adjust the width as needed
          child: TextField(
            controller: text,
            decoration: InputDecoration(
              hintText: "Search",
              contentPadding: EdgeInsets.symmetric(horizontal: 20),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(
                  color: AppColors.getLightPrimaryColor(),
                  // Set your initial border color here
                  width: 2.0, // Adjust the border width as needed
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide:
                    BorderSide(color: AppColors.getPrimaryColor(), width: 2.0),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        InkWell(
            borderRadius: BorderRadius.circular(25.0),
            onTap: () {
              onPressed();
            },
            child: Container(
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: AppColors.getPrimaryColor(),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.search,
                color: Colors.white,
              ),
            ))
      ],
    ),
  );
}
