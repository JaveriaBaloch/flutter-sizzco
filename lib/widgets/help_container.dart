import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizzco/Utilies/colors.dart';

Container HelpContainer(String title, String detail, Icon icon) {
  return Container(
    padding: EdgeInsets.all(20),
    margin: EdgeInsets.symmetric(vertical: 20),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30),
      color: AppColors.getLightPrimaryColor(),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        icon,
        SizedBox(
          width: 15,
        ),
        Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Text(
            title,
            style: GoogleFonts.aBeeZee(
                fontSize: 19,
                fontWeight: FontWeight.bold,
                color: AppColors.getPrimaryColor()),
            textAlign: TextAlign.start,
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            detail,
            style: GoogleFonts.aBeeZee(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: AppColors.getPrimaryColor()),
            textAlign: TextAlign.start,
          ),
        ])
      ],
    ),
  );
}
