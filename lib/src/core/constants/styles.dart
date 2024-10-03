import 'package:blott_mobile_assesment/src/core/extension/extension.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Styles {
  static TextStyle hXl({
    final Color? color,
    final double? height,
    final FontWeight? fontWeight,
  }) =>
      GoogleFonts.roboto(
        fontSize: 30.fontSize,
        fontWeight: fontWeight ?? FontWeight.w700,
        color: color ?? Colors.black,
        height: height,
      );

  static TextStyle hLg({
    final Color? color,
    final double? height,
    final FontWeight? fontWeight,
  }) =>
      GoogleFonts.roboto(
        fontSize: 24.fontSize,
        fontWeight: fontWeight ?? FontWeight.w700,
        color: color ?? Colors.black,
        height: height,
      );

  // paragraphs and body text

  static TextStyle regularXl({
    final Color? color,
    final FontWeight? fontWeight,
  }) =>
      GoogleFonts.roboto(
        fontSize: 20.fontSize,
        fontWeight: fontWeight ?? FontWeight.w400,
        color: color ?? Colors.black,
      );

  static TextStyle regularMd({
    final Color? color,
    final FontWeight? fontWeight,
  }) =>
      GoogleFonts.roboto(
        fontSize: 16.fontSize,
        fontWeight: fontWeight ?? FontWeight.w400,
        color: color ?? Colors.black,
      );
}
