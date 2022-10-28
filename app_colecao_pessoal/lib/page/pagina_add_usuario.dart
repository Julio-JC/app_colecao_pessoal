import 'package:app_colecao_pessoal/profile/models/usuario.dart';
import 'package:app_colecao_pessoal/profile/repositorio/repositorio_usuario.dart';
import 'package:app_colecao_pessoal/widget/data.dart';
import 'package:app_colecao_pessoal/widget/botao_de_texot.dart';
import 'package:flutter/material.dart';

class PaginaAddUsuario extends StatefulWidget {
  const PaginaAddUsuario({
    super.key,
  });

  @override
  State<PaginaAddUsuario> createState() => _PaginaAddUsuarioState();
}

class _PaginaAddUsuarioState extends State<PaginaAddUsuario> {
  late final RepositorioUsuario repositorioUsuario;
  late final Usuario usuario;

  final TextEditingController _nomeController = TextEditingController();
  final DateTime _dataNasc = DateTime.now();
  final TextEditingController _avatarController = TextEditingController();
  final TextEditingController _generoFilmeController = TextEditingController();
  final TextEditingController _generoLivroController = TextEditingController();
  final TextEditingController _diretorFavController = TextEditingController();
  final TextEditingController _autorFavController = TextEditingController();

  adicionarUsuario() {
    usuario = Usuario(
      nomeUsuario: _nomeController.text,
      dataNascimento: _dataNasc,
      avatarUrl: _avatarController.text,
      generoFilmeFavorito: _generoFilmeController.text,
      autorFavorito: _generoLivroController.text,
      diretorFavorito: _diretorFavController.text,
      generoLivroFavorito: _generoLivroController.text,
    );

    repositorioUsuario.salvarUsuario(usuario);

    Navigator.pushNamed(context, '/PaginaNavegacao');
  }

  @override
  void initState() {
    super.initState();

    repositorioUsuario = RepositorioUsuario();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Adicionar do Usuário'),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 40),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10, top: 20),
                    child: TextField(
                      controller: _avatarController,
                      //onChanged: (_) => adicionarUsuario(),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Url da Imagem',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: TextField(
                      controller: _nomeController,
                      //onChanged: (_) => adicionarUsuario(),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Nome',
                      ),
                    ),
                  ),
                  Data(titulo: 'Data de Nascimento', dateTime: _dataNasc),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: TextField(
                      controller: _generoFilmeController,
                      //onChanged: (_) => adicionarUsuario(),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Gênero filme favorito',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: TextField(
                      controller: _generoLivroController,
                      //onChanged: (_) => adicionarUsuario(),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Gênero Livro favorito',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: TextField(
                      controller: _diretorFavController,
                      //onChanged: (_) => adicionarUsuario(),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Diretor favorito',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: TextField(
                      controller: _autorFavController,
                      //onChanged: (_) => adicionarUsuario(),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Autor favorito',
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BotaoDeTexto(
                        tirulo: 'Cancelar',
                        aoPressionar: () {
                          Navigator.pushNamed(context, '/PaginaNavegacao');
                        },
                      ),
                      BotaoDeTexto(
                        tirulo: 'Adicionar usuário',
                        aoPressionar: adicionarUsuario,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
