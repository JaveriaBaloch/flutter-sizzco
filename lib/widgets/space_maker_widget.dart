import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

Container SpaceMaker(String title) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 20),
    child: Text(
      title,
      textAlign: TextAlign.center,
      style: GoogleFonts.aBeeZee(fontSize: 19, fontWeight: FontWeight.bold),
    ),
  );
}
