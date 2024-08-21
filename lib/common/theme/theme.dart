import 'package:flutter/material.dart';

abstract class MovieTheme {
  abstract Brightness brightness;

  final InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
    border: OutlineInputBorder(),
  );
}

class LightTheme extends MovieTheme {
  @override
  Brightness brightness = Brightness.light;
}

class DarkTheme extends MovieTheme {
  @override
  Brightness brightness = Brightness.dark;
}

extension MovieThemex on MovieTheme {
  ThemeData getThemeData() {
    return ThemeData(
      brightness: brightness,
      inputDecorationTheme: inputDecorationTheme,
    );
  }
}
