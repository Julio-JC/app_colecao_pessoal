import 'package:app_colecao_pessoal/page/pagina_add_usuario.dart';
import 'package:app_colecao_pessoal/widget/card_do_usuario.dart';
import 'package:app_colecao_pessoal/widget/botao_de_texot.dart';
import 'package:flutter/material.dart';

import '../profile/models/usuario.dart';

class PaginaNovoUsuario extends StatefulWidget {
  const PaginaNovoUsuario({super.key, this.usuario, this.receber});

  final Usuario? usuario;
  final Function()? receber;
  @override
  State<PaginaNovoUsuario> createState() => _NovoUsuarioState();
}

class _NovoUsuarioState extends State<PaginaNovoUsuario> {
  List<Usuario> usuario = [];

  cadastrarUsuario(
    String nome,
    DateTime nascimento,
    String avatar,
    String generoFilme,
    String generoLivro,
    String diretor,
    String autor,
  ) {
    final novoUsuario = Usuario(
      nome: nome,
      dataNascimento: nascimento,
      avatarUrl: avatar,
      generoFilmeFavorito: generoFilme,
      generoLivroFavorito: generoLivro,
      diretorFavorito: diretor,
      autoFavorito: autor,
    );

    setState(() {
      usuario.add(novoUsuario);
    });

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Usário',
          ),
        ),
        body: Column(
          children: [
            Center(
              child: Container(
                margin: const EdgeInsets.only(top: 16),
                height: 630,
                width: 370,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: ListView.builder(
                  itemCount: usuario.length,
                  itemBuilder: ((context, index) {
                    return CardDoUsuario(
                      usuario: usuario[index],
                    );
                  }),
                ),
              ),
            ),
            BotaoDeTexto(
              tirulo: 'Cadastrar Usuário',
              aoPressionar: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) {
                      return PaginaAddUsuario(aoPressionar: cadastrarUsuario);
                    }),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
