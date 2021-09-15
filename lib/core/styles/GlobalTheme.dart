import 'package:flutter/material.dart';

class GlobalTheme {
  static Color lightOrange = Color(0xFFFE7B49);
  static Color shadeOrange = Color(0xFFFDA86F);
  static Color lightGreen = Color(0xFF6dc82a);
  static Color customedBlack = Color(0xFF21282e);

  static Map<int, Color> stepperColors = {
    50: Color.fromRGBO(254, 123, 73, .1),
    100: Color.fromRGBO(254, 123, 73, .2),
    200: Color.fromRGBO(254, 123, 73, .3),
    300: Color.fromRGBO(254, 123, 73, .4),
    400: Color.fromRGBO(254, 123, 73, .5),
    500: Color.fromRGBO(254, 123, 73, .6),
    600: Color.fromRGBO(254, 123, 73, .7),
    700: Color.fromRGBO(254, 123, 73, .8),
    800: Color.fromRGBO(254, 123, 73, .9),
    900: Color.fromRGBO(254, 123, 73, 1),
  };

  static Map<int, Color> lightGreenMaterialColors = {
    50: Color.fromRGBO(109, 200, 42, .1),
    100: Color.fromRGBO(109, 200, 42, .2),
    200: Color.fromRGBO(109, 200, 42, .3),
    300: Color.fromRGBO(109, 200, 42, .4),
    400: Color.fromRGBO(109, 200, 42, .5),
    500: Color.fromRGBO(109, 200, 42, .6),
    600: Color.fromRGBO(109, 200, 42, .7),
    700: Color.fromRGBO(109, 200, 42, .8),
    800: Color.fromRGBO(109, 200, 42, .9),
    900: Color.fromRGBO(109, 200, 42, 1),
  };

  static ThemeData widgetThemeData = ThemeData(
      accentColor: GlobalTheme.lightOrange,
      primarySwatch: MaterialColor(
          0xFFFE7B49, GlobalTheme.stepperColors), 
      colorScheme: ColorScheme.light(primary: GlobalTheme.lightOrange));
}
