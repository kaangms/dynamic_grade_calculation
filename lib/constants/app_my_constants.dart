import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyConstants {
  //colors
  static const MaterialColor primaryColor = Colors.indigo;
  static final TextStyle headerStyle = GoogleFonts.quicksand(
    fontSize: 24,
    fontWeight: FontWeight.w900,
    color: primaryColor,
  );
  static final TextStyle averageShowBodyStyle = GoogleFonts.quicksand(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: primaryColor,
  );
  static final TextStyle averageStyle = GoogleFonts.quicksand(
    fontSize: 55,
    fontWeight: FontWeight.w800,
    color: primaryColor,
  );
  //texts
  static const appTitle = 'Grade Calculation';

  //others
  static BorderRadius myBorderRadius = BorderRadius.circular(24);
  static final dropDownPadding =
      EdgeInsets.symmetric(horizontal: 16, vertical: 8);
  static final horizontalPadding8 = EdgeInsets.symmetric(horizontal: 8);
}
