import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class MyCustomFonts {
  static TextStyle getDmSans(
      {double? fontSize, Color? fontColor, FontWeight? fontWeight}) {
    return GoogleFonts.dmSans(
      fontSize: fontSize,
      color: fontColor,
      fontWeight: fontWeight,
    );
  }
}
