import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizzco/Utilies/colors.dart';

Container TextContainer(String title, String description) {
  return Container(
    padding: EdgeInsets.all(20),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.aBeeZee(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: AppColors.getPrimaryColor()),
          textAlign: TextAlign.start,
        ),
        SizedBox(
          height: 20,
        ),
        Text(description),
        SizedBox(
          height: 30,
        ),
      ],
    ),
  );
}
