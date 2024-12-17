import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData(
  primaryColor: const Color(0xFF004466),
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: const Color(0xFF006688),
  ),
  fontFamily: 'Arial',
  buttonTheme: const ButtonThemeData(
    buttonColor: Color(0xFF004466),
    textTheme: ButtonTextTheme.primary,
  ),
  textTheme: const TextTheme(
    headlineMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF333)), 
    bodyLarge: TextStyle(fontSize: 16, color: Color(0xFF555)), 
    bodyMedium: TextStyle(fontSize: 14, color: Color(0xFF666)),
  ),
);
