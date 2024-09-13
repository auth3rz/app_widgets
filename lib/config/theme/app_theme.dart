import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.red,
  Colors.purple,
  Colors.deepPurple,
  Colors.pink,
];

class AppTheme {
  final int selectedColor;
  final bool isDark;
  ///LA VARIABLE COLOR DEBE SER ENTRE 0 Y 6
  AppTheme({
    this.selectedColor = 0,
    this.isDark = false,
  }): assert(selectedColor >= 0, 'El color debe ser mayor o igual a 0'),
  assert(selectedColor < colorList.length, 'El color debe ser menor a ${colorList.length}')
  ;

  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    brightness: isDark ? Brightness.dark : Brightness.light,
    appBarTheme: const AppBarTheme(
      centerTitle: false
    ),
    colorSchemeSeed: colorList[selectedColor]
  );
}