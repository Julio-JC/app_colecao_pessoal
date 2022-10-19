import 'package:app_colecao_pessoal/global/tema_controle.dart';
import 'package:app_colecao_pessoal/page/pagina_add_filme.dart';
import 'package:app_colecao_pessoal/page/pagina_add_usuario.dart';
import 'package:app_colecao_pessoal/widget/card_do_usuario.dart';
import 'package:app_colecao_pessoal/page/pagina_conteudo_do_filme.dart';
import 'package:app_colecao_pessoal/page/pagina_inicial.dart';
import 'package:app_colecao_pessoal/page/pagina_lista_de_filmes.dart';
import 'package:app_colecao_pessoal/page/pagina_lista_de_livros.dart';
import 'package:app_colecao_pessoal/page/pagina_navegacao.dart';
import 'package:flutter/material.dart';

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: TemaController.instancia,
      builder: (context, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            brightness: TemaController.instancia.temas
                ? Brightness.light
                : Brightness.dark,
          ),
          home: const PaginaNavegacao(),
          routes: {
            '/PaginaNavegacao': (context) => const PaginaNavegacao(),
            '/PaginaInicial': (context) => PaginaInicial(),
            '/PaginaAddFilme': (context) => const PaginaAddFilme(),
            '/PaginaAddUsuario': (context) => const PaginaAddUsuario(),
            '/PaginaListaDeFilmes': (context) => PaginaListaDeFilmes(),
            '/PaginaListaDeLivros': (context) => const PaginaListaDeLivros(),
            '/PaginaConteudoDoFilme': (context) => PaginaConteudoDoFilme(),
            '/PaginaDoUsuario': (context) => CardDoUsuario(),
          },
        );
      },
    );
  }
}
