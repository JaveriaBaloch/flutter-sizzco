import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizzco/Utilies/colors.dart';

Container PrimaryText(String title) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 10),
    child: Text(
      title,
      textAlign: TextAlign.center,
      style: GoogleFonts.aBeeZee(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: AppColors.getPrimaryColor()),
    ),
  );
}
