import 'package:app_colecao_pessoal/widget/botao_pagina_inicial.dart';
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
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.30,
                  width: double.infinity,
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 20, bottom: 20),
                        height: 70,
                        width: 70,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.amber,
                          image: DecorationImage(
                            image:
                                AssetImage('assets/image/icone-do-perfil.jpg'),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text('Nome: '),
                            SizedBox(
                              width: 40,
                            ),
                            Text('Nome do Usuário'),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text('Data de nascimento: '),
                            SizedBox(
                              width: 40,
                            ),
                            Text('08/10/1983'),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text('Genero favorito: '),
                            SizedBox(
                              width: 40,
                            ),
                            Text('Ação'),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text('Diretor favorito: '),
                            SizedBox(
                              width: 40,
                            ),
                            Text('Spilberg'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  color: Colors.blue,
                ),
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
