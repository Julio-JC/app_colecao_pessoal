import 'package:app_colecao_pessoal/global/theme.dart';
import 'package:app_colecao_pessoal/page/pagina_add_usuario.dart';
import 'package:app_colecao_pessoal/page/pagina_inicial.dart';
import 'package:app_colecao_pessoal/page/pagina_navegacao.dart';
import 'package:flutter/material.dart';
import 'global/app_controller.dart';

class MeuApp extends StatefulWidget {
  const MeuApp({super.key});

  @override
  State<MeuApp> createState() => _MeuAppState();
}

class _MeuAppState extends State<MeuApp> {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: AppController.instance,
        builder: ((context, child) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: AppController.instance.isDark ? Themes.dark : Themes.light,
            darkTheme: Themes.dark,
            themeMode: ThemeMode.light,
            home: const PaginaNavegacao(),
            routes: {
              '/PaginaNavegacao': (context) => const PaginaNavegacao(),
              '/PaginaInicial': (context) => PaginaInicial(),
              '/PaginaAddUsuario': (context) => const PaginaAddUsuario(),
            },
          );
        }));
  }
}
