import 'package:app_colecao_pessoal/page/pagina_navegacao.dart';
import 'global/const.dart';
import 'package:flutter/material.dart';

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

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
      home: const PaginaNavegacao(),
    );
  }
}
