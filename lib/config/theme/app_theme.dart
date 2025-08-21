// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

const List<Color> _colors = [Colors.red, Colors.blue];

class AppTheme {
  bool isDarkMode;

  AppTheme({this.isDarkMode = false});

  ThemeData appTheme() =>
      ThemeData(
        colorSchemeSeed: _colors[0],
        brightness: isDarkMode ? Brightness.dark : Brightness.light,
        
        );

  AppTheme copiWith({bool? isDarkMode}) =>
      AppTheme(isDarkMode: isDarkMode ?? this.isDarkMode);
}
