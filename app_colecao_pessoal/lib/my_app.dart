import 'global/const.dart';
import 'page/my_home_page.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: kColorMyApp,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: kColorMyApp,
        ),
        scaffoldBackgroundColor: kColorScaffold,
        cardColor: kColorCard,
      ),
      home: const MyHomePage(),
    );
  }
}
