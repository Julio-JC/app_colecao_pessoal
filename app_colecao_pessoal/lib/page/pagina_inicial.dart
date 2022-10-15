import 'package:app_colecao_pessoal/botao_pagina_inicial.dart';
import 'package:app_colecao_pessoal/page/pagina_lista_de_livros.dart';
import 'package:app_colecao_pessoal/page/pagina_lista_de_filmes.dart';
import 'package:flutter/material.dart';

class PaginaInicial extends StatelessWidget {
  const PaginaInicial({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Minha Coleção'),
        ),
        drawer: Drawer(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: const Icon(Icons.movie),
                  title: const Text('Filmes'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const PaginaListaDeFilmes();
                        },
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.book),
                  title: const Text('Livros'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const PaginaListaDeLivros();
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BotaoPaginaInicial(
                  icon: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const PaginaListaDeFilmes();
                          },
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.local_movies,
                      size: 100,
                    ),
                  ),
                  image: 'assets/image/filme_botão2.jpg',
                ),
                BotaoPaginaInicial(
                  icon: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const PaginaListaDeLivros();
                          },
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.book,
                      size: 100,
                    ),
                  ),
                  image: 'assets/image/livro_botao.jpg',
                ),
              ],
            ),
          ),
        ),
        extendBody: true,
      ),
    );
  }
}
