import 'package:app_colecao_pessoal/page/pagina_add_filme.dart';
import 'package:app_colecao_pessoal/page/pagina_do_usuario.dart';
import 'package:app_colecao_pessoal/page/pagina_conteudo_do_filme.dart';
import 'package:app_colecao_pessoal/page/pagina_inicial.dart';
import 'package:app_colecao_pessoal/page/pagina_lista_de_filmes.dart';
import 'package:app_colecao_pessoal/page/pagina_lista_de_livros.dart';
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
      routes: {
        '/PaginaNavegacao': (context) => const PaginaNavegacao(),
        '/PaginaInicial': (context) => PaginaInicial(),
        '/PaginaAddFilme': (context) => const PaginaAddFilme(),
        '/PaginaAddUsuario': (context) => PaginaDoUsuario(),
        '/PaginaListaDeFilmes': (context) => PaginaListaDeFilmes(),
        '/PaginaListaDeLivros': (context) => PaginaListaDeLivros(),
        '/PaginaConteudoDoFilme': (context) => PaginaConteudoDoFilme(),
      },
    );
  }
}
