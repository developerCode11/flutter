import 'package:flutter/material.dart';

extension TextStyleExtensions on TextStyle {
  // Weights
  TextStyle get bold => weight(FontWeight.w600);

  // Styles
  TextStyle get medium20 => customStyle(
        fontSize: 20,
        letterSpacing: 0.0,
        weight: FontWeight.w500,
      );



  TextStyle get normal16 => customStyle(
        fontSize: 16,
        letterSpacing: 0.0,
        weight: FontWeight.normal,
      );



  TextStyle get medium14 => customStyle(
        fontSize: 14,
        letterSpacing: 0.0,
        weight: FontWeight.w500,
      );


  TextStyle get normal14 => customStyle(
        fontSize: 14,
        letterSpacing: 0.0,
        weight: FontWeight.normal,
      );

      
  TextStyle get errorText12 => customStyle(
        fontSize: 12,
        letterSpacing: 0.0,
        weight: FontWeight.normal,
      );

  /// Shortcut for color
  TextStyle textColor(Color v) => copyWith(color: v);

  /// Shortcut for fontWeight
  TextStyle weight(FontWeight v) => copyWith(fontWeight: v);

  /// Shortcut for fontSize
  TextStyle size(double v) => copyWith(fontSize: v);

  /// Shortcut for letterSpacing
  TextStyle letterSpace(double v) => copyWith(letterSpacing: v);

  TextStyle customStyle({
    required double letterSpacing,
    required double fontSize,
    required FontWeight weight,
  }) =>
      copyWith(
        letterSpacing: letterSpacing,
        fontSize: fontSize,
        fontWeight: weight,
      );
}
