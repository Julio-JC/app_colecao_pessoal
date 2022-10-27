import 'package:app_colecao_pessoal/global/const.dart';
import 'package:app_colecao_pessoal/profile/models/usuario.dart';
import 'package:app_colecao_pessoal/profile/repositorio/repositorio_usuario.dart';
import 'package:app_colecao_pessoal/widget/botao_pagina_inicial.dart';
import 'package:app_colecao_pessoal/page/pagina_lista_de_livros.dart';
import 'package:app_colecao_pessoal/page/pagina_lista_de_filmes.dart';
import 'package:flutter/material.dart';
import '../global/app_controller.dart';

class PaginaInicial extends StatefulWidget {
  PaginaInicial({
    super.key,
    this.usuario,
  });

  Usuario? usuario;
  @override
  State<PaginaInicial> createState() => _PaginaInicialState();
}

class _PaginaInicialState extends State<PaginaInicial> {
  RepositorioUsuario repositorioUsuario = RepositorioUsuario();

  @override
  void initState() {
    super.initState();
    repositorioUsuario.getUsiario().then((value) {
      setState(() {
        widget.usuario = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final avatar = widget.usuario == null || widget.usuario!.avatarUrl!.isEmpty
        ? const CircleAvatar(child: Icon(Icons.person))
        : CircleAvatar(
            backgroundImage: NetworkImage(widget.usuario!.avatarUrl!),
          );
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Minha Coleção'),
        ),
        drawer: Drawer(
          // Adicionar no Drawer os dados do usuário para uma visualizaçao rapida
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.50,
                  width: double.infinity,
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 20, bottom: 20),
                        height: 70,
                        width: 70,
                        child: avatar,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Nome: '),
                            const SizedBox(
                              width: 40,
                            ),
                            SizedBox(
                              child: widget.usuario != null
                                  ? Text(widget.usuario!.nomeUsuario!)
                                  : const Text(''),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Data de nasc: '),
                            const SizedBox(
                              width: 40,
                            ),
                            widget.usuario != null
                                ? Text(widget.usuario!.dataNascimento!)
                                : const Text(''),
                          ], //DateFormat('d/MM/yyyy').format(widget.dateTime),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(' Meu Tipo de filme: '),
                            const SizedBox(
                              width: 40,
                            ),
                            SizedBox(
                              child: widget.usuario != null
                                  ? Text(widget.usuario!.generoFilmeFavorito!)
                                  : const Text(''),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Meu tipo de Livro: '),
                            const SizedBox(
                              width: 40,
                            ),
                            SizedBox(
                              child: widget.usuario != null
                                  ? Text(widget.usuario!.generoLivroFavorito!)
                                  : const Text(''),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Diretor favorito: '),
                            const SizedBox(
                              width: 40,
                            ),
                            SizedBox(
                              child: widget.usuario != null
                                  ? Text(widget.usuario!.diretorFavorito!)
                                  : const Text(''),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Autor favorito: '),
                            const SizedBox(
                              width: 40,
                            ),
                            SizedBox(
                              child: widget.usuario != null
                                  ? Text(widget.usuario!.autorFavorito!)
                                  : const Text(''),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  color: kCorDivider,
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
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) {
                    //       return const PaginaListaDeLivros();
                    //     },
                    //   ),
                    // );
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
