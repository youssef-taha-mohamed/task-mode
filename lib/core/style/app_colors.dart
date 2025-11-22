import 'package:flutter/material.dart';

class MyColors {
  static const MaterialColor defaultColor =
      MaterialColor(_defaultColorPrimaryValue, <int, Color>{
        50: Color(0xFFF1EAF7),
        100: Color(0xFFDDC9EB),
        200: Color(0xFFC7A5DE),
        300: Color(0xFFB081D1),
        400: Color(0xFF9E66C7),
        500: Color(_defaultColorPrimaryValue),
        600: Color(0xFF4A256B),
        700: Color(0xFF411F5F),
        800: Color(0xFF391A54),
        900: Color(0xFF2B1040),
      });
  static const _defaultColorPrimaryValue = 0xFF3BADFC;
  static const primaryColor = defaultColor;


  static const Color color1 = Color(0xff23282E);
  static const Color white = Color(0xFFFFFFFF);
  static const Color color2 = Color(0xffFDCD56);
  static const Color color3 = Color(0xffAC92EA);
  static const Color color4 = Color(0xff56CBEB);
  static const Color color5 = Color(0xffA4AF4B);
  static const Color color6 = Color(0xffFA6C51);
  static const Color color7 = Color(0xff46CEAC);
  static const Color color8 = Color(0xffEB5463);
  static const Color color9 = Color(0xff9ED26A);
  static const Color color10 = Color(0xff4FC0E8);
  static const Color color11 = Color(0xff636C77);
  static const Color color12 = Color(0xff5E9CEA);
  static const Color color13 = Color(0xffFDCD56);
  static const Color color14 = Color(0xffEB86BE);
  static const Color color15 = Color(0xffE3B692);
  static const Color color16 = Color(0xffF6F4F8);
  static const Color color17 = Color(0xffA78EBC);
  static const Color appRed = Color(0xFFFF4A4A);
  static const Color background = Color(0xFF121418);
  static const Color neutral100 = Color(0xFF636363);
  static const Color color18 = Color(0xFFE3E3E3);
  static const Color fillColor = Color(0xFF16191E);
  static const Color borderColor = Color.fromRGBO(59, 173, 252, 0.25);

  static const color21 = Color(0xFFEDEDED);
  static const color22 = Color(0xFFEFEFEF);
  static const color23 = Color(0xFFFFFBF0);
  static const color24 = Color(0xFFECECEC);
  static const color25 = Color(0xFF775209);
  static const color26 = Color(0xFFFEFFD3);
  static const color27 = Color(0xFFEEE7ED);
  static const color28 = Color(0xFFFFCF4E);
  static const color29 = Color(0xFFEAE5EE);
  static const color30 = Color(0xFFE8E8E8);
  static const color31 = Color(0xFF848484);
  static const color32 = Color(0xFF717585);
  static const color33 = Color(0xFFFE2E2E);
  static const color34 = Color(0xFFD7D6E0);
  static const color35 = Color(0xFFD1D5DB);
}



String _appTheme = "lightCode";
LightCodeColors get appTheme => ThemeHelper().themeColor();
ThemeData get theme => ThemeHelper().themeData();

/// Helper class for managing themes and colors.

// ignore_for_file: must_be_immutable
class ThemeHelper {
  // A map of custom color themes supported by the app
  Map<String, LightCodeColors> _supportedCustomColor = {
    'lightCode': LightCodeColors()
  };

  // A map of color schemes supported by the app
  Map<String, ColorScheme> _supportedColorScheme = {
    'lightCode': ColorSchemes.lightCodeColorScheme
  };

  /// Changes the app theme to [_newTheme].
  void changeTheme(String _newTheme) {
    _appTheme = _newTheme;
  }

  /// Returns the lightCode colors for the current theme.
  LightCodeColors _getThemeColors() {
    return _supportedCustomColor[_appTheme] ?? LightCodeColors();
  }

  /// Returns the current theme data.
  ThemeData _getThemeData() {
    var colorScheme =
        _supportedColorScheme[_appTheme] ?? ColorSchemes.lightCodeColorScheme;
    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
    );
  }

  /// Returns the lightCode colors for the current theme.
  LightCodeColors themeColor() => _getThemeColors();

  /// Returns the current theme data.
  ThemeData themeData() => _getThemeData();
}

class ColorSchemes {
  static final lightCodeColorScheme = ColorScheme.light();
}

class LightCodeColors {
  // App Colors
  Color get blue_gray_900 => Color(0xFF23282E);
  Color get white_A700 => Color(0xFFFFFFFF);
  Color get blue_400 => Color(0xFF3BADFC);
  Color get gray_900 => Color(0xFF16191E);
  Color get deep_purple_300 => Color(0xFF8C7AE6);
  Color get blue_500 => Color(0xFF1E90FF);
  Color get red_400 => Color(0xFFEC4C66);
  Color get lime_700 => Color(0xFFA3CB37);
  Color get amber_500 => Color(0xFFFFC412);
  Color get gray_200 => Color(0xFFEDEDED);
  Color get black_900_19 => Color(0x19000000);
  Color get gray_700 => Color(0xFF636363);
  Color get red_500 => Color(0xFFFE2E2E);
  Color get gray_900_01 => Color(0xFF121418);

  // Additional Colors
  Color get transparentCustom => Colors.transparent;
  Color get whiteCustom => Colors.white;
  Color get greyCustom => Colors.grey;
  Color get redCustom => Colors.red;
  Color get colorFF3F3B => Color(0xFF3F3BAD);
  Color get colorFF8888 => Color(0xFF888888);
  Color get color888888 => Color(0x88888888);

  // Color Shades - Each shade has its own dedicated constant
  Color get grey200 => Colors.grey.shade200;
  Color get grey100 => Colors.grey.shade100;
}
