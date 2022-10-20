import 'package:flutter/material.dart';

class Themes {
  static final light = ThemeData(
    appBarTheme: const AppBarTheme(color: Color(0xffA36EF3)),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xffA36EF3),
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: const Color(0xffA36EF3),
    ),
  );
  static final dark = ThemeData(
    appBarTheme: const AppBarTheme(color: Color(0xff41464D)),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xff41464D),
    ),
    scaffoldBackgroundColor: const Color.fromARGB(255, 79, 85, 94),
    drawerTheme: const DrawerThemeData(
      backgroundColor: Color.fromARGB(255, 196, 195, 195),
    ),
    textTheme: const TextTheme(
      bodyText2: TextStyle(color: Colors.black),
    ),
  );
}
