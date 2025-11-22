import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/app_export.dart';
import '../../core/style/app_colors.dart';

/// A helper class for managing text styles in the application
class TextStyleHelper {
  static TextStyleHelper? _instance;

  TextStyleHelper._();

  static TextStyleHelper get instance {
    _instance ??= TextStyleHelper._();
    return _instance!;
  }

  // Title Styles
  // Medium text styles for titles and subtitles

  TextStyle get title20RegularRoboto => TextStyle(
    fontSize: 20.fSize,
    fontWeight: FontWeight.w400,
    fontFamily: 'Roboto',
  );

  TextStyle get title20BoldCairo => TextStyle(
    fontSize: 20.fSize,
    fontWeight: FontWeight.w700,
    fontFamily: 'Cairo',
  );

  // Body Styles
  // Standard text styles for body content

  TextStyle get body14BoldCairo => TextStyle(
    fontSize: 14.fSize,
    fontWeight: FontWeight.w700,
    fontFamily: 'Cairo',
  );

  TextStyle get body12MediumPoppins => TextStyle(
    fontSize: 12.fSize,
    fontWeight: FontWeight.w500,
    fontFamily: 'Poppins',
    color: appTheme.whiteCustom,
  );

  TextStyle get body12RegularCairo => TextStyle(
    fontSize: 12.fSize,
    fontWeight: FontWeight.w400,
    fontFamily: 'Cairo',
  );

  // Label Styles
  // Small text styles for labels, captions, and hints

  TextStyle get label10RegularCairo => TextStyle(
    fontSize: 10.fSize,
    fontWeight: FontWeight.w400,
    fontFamily: 'Cairo',
    color: appTheme.whiteCustom,
  );

  TextStyle get label8RegularCairo => TextStyle(
    fontSize: 8.fSize,
    fontWeight: FontWeight.w400,
    fontFamily: 'Cairo',
  );
}
