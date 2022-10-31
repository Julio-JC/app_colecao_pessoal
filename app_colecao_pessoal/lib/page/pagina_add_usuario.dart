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
  final formKey = GlobalKey<FormState>();

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

    formKey.currentState?.validate();

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
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10, top: 20),
                      child: TextFormField(
                        controller: _avatarController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Url da Imagem',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: TextFormField(
                        controller: _nomeController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Nome',
                        ),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Nome obrigatório';
                          }
                          return null;
                        },
                      ),
                    ),
                    Data(titulo: 'Data de Nascimento', dateTime: _dataNasc),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: TextFormField(
                        controller: _generoFilmeController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Gênero filme favorito',
                        ),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Gênero obrigatório';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: TextFormField(
                        controller: _generoLivroController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Gênero Livro favorito',
                        ),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Gênero obrigatório';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: TextFormField(
                        controller: _diretorFavController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Diretor favorito',
                        ),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Diretor obrigatório';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: TextFormField(
                        controller: _autorFavController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Autor favorito',
                        ),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Autor obrigatório';
                          }
                          return null;
                        },
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
      ),
    );
  }
}
