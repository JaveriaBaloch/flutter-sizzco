import 'package:flutter/material.dart';
import 'package:sizzco/Utilies/colors.dart';
import 'package:google_fonts/google_fonts.dart';

Container NoItemFound(BuildContext context){
  return Container(
    width: MediaQuery.of(context).size.width*0.8,
    padding: EdgeInsets.all(30),
    margin: EdgeInsets.all(20),
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: AppColors.getLightPrimaryColor(),
      borderRadius: BorderRadius.circular(15)
    ),
    child: Text(
      "Item will be available soon!",
      textAlign: TextAlign.center,
      maxLines: 3,
      style: GoogleFonts.aBeeZee(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: AppColors.getPrimaryColor()
      ),
    ),
  );
}