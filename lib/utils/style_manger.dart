import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';




TextStyle _getTextStyle(double fontSize, Color color,  double letterSpacing, FontWeight fontWeight,) {
   return GoogleFonts.jacquesFrancois(textStyle:TextStyle(fontSize: fontSize, color: color, letterSpacing: letterSpacing, fontWeight: fontWeight));
}


TextStyle getRFStyle({required Color color, required double fontSize}) {
  return _getTextStyle(fontSize,color,0.2.w,FontWeight.w400);
}

TextStyle getBFStyle({required Color color, required double fontSize}) {
  return _getTextStyle(fontSize, color, 0.2.w, FontWeight.w400);
}

TextStyle getMFStyle({required Color color, required double fontSize}) {
  return _getTextStyle(fontSize, color, 0.2.w, FontWeight.w400);
}

TextStyle getSFStyle({required Color color, required double fontSize,}) {
  return _getTextStyle(fontSize, color, 0.2.w, FontWeight.w400);
}

