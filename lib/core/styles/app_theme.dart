import 'package:flutter/material.dart';

final ThemeData appTheme = _buildAppTheme();

ThemeData _buildAppTheme() {
  final ThemeData base = ThemeData.light();

  return base.copyWith(
    // brightness: Brightness.dark,
    // scaffoldBackgroundColor: scaffoldBackgroundColor,
    textTheme: _appTextTheme(base.textTheme),
  );
}

TextTheme _appTextTheme(TextTheme base) {
  return base
      // .copyWith(
      //     button: base.button.copyWith(fontSize: buttonFontSize),
      //     bodyText2: bodyStyle)
      .apply(
        fontFamily: "greycliff-cf-regular",
      );
}
