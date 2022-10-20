import 'package:app_colecao_pessoal/profile/models/usuario.dart';
import 'package:app_colecao_pessoal/widget/botao_pagina_inicial.dart';
import 'package:app_colecao_pessoal/page/pagina_lista_de_livros.dart';
import 'package:app_colecao_pessoal/page/pagina_lista_de_filmes.dart';
import 'package:flutter/material.dart';

import '../global/app_controller.dart';

class PaginaInicial extends StatefulWidget {
  const PaginaInicial({
    super.key,
    this.usuario,
  });

  final Usuario? usuario;

  @override
  State<PaginaInicial> createState() => _PaginaInicialState();
}

class _PaginaInicialState extends State<PaginaInicial> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Minha Coleção'),
          actions: [
            Switch(
              value: AppController.instance.isDark,
              onChanged: (value) {
                AppController.instance.changeTheme();
              },
            ),
          ],
        ),
        drawer: Drawer(
          // Adicionar no Drawer os dados do usuário
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.38,
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
                            Text('Nome do usuário'),
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
                            Text('01/01/2000'),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text('Genero filme favorito: '),
                            SizedBox(
                              width: 40,
                            ),
                            Text('Genero'),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text('Genero livro favorito: '),
                            SizedBox(
                              width: 40,
                            ),
                            Text('Genero'),
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
                            Text('Dietor'),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text('Autor favorito: '),
                            SizedBox(
                              width: 40,
                            ),
                            Text('Autor'),
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
                //Adicionar aqui informação da quantidade da lista de filmes
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
                //Adicionar aqui informação da quantidade da lista de livros
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Switch(
                    value: AppController.instance.isDark,
                    onChanged: (value) {
                      setState(() {
                        AppController.instance.changeTheme();
                      });
                    },
                  ),
                )
              ],
            ),
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                opacity: 0.60,
                image: AssetImage('assets/image/fundobbtc.jpg'),
                fit: BoxFit.cover),
          ),
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
