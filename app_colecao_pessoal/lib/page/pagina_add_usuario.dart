import 'package:app_colecao_pessoal/page/pagina_inicial.dart';
import 'package:app_colecao_pessoal/profile/infraestructure/data.dart';
import 'package:app_colecao_pessoal/widget/botao_de_texot.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../profile/models/usuario.dart';

class PaginaAddUsuario extends StatefulWidget {
  const PaginaAddUsuario({
    super.key,
    this.aoPressionar,
  });

  final Function(
    String,
    DateTime,
    String,
    String,
    String,
    String,
    String,
  )? aoPressionar;

  @override
  State<PaginaAddUsuario> createState() => _PaginaAddUsuarioState();
}

class _PaginaAddUsuarioState extends State<PaginaAddUsuario> {
  final TextEditingController _nomeController = TextEditingController();
  final DateTime _dataNasc = DateTime.now();
  late String _avatarUsuario = 'assets/image/icone-do-perfil.jpg';
  final TextEditingController _generoFilmeController = TextEditingController();
  final TextEditingController _generoLivroController = TextEditingController();
  final TextEditingController _diretorFavController = TextEditingController();
  final TextEditingController _autorFavController = TextEditingController();

  // addUsuario() {
  //   widget.usuario!.nome = _nomeController.text;
  //   widget.usuario!.dataNascimento = _dataNasc;
  //   widget.usuario!.avatarUrl = _avatarUsuario;
  //   widget.usuario!.generoFilmeFavorito = _generoFilmeController.text;
  //   widget.usuario!.generoLivroFavorito = _generoLivroController.text;
  //   widget.usuario!.diretorFavorito = _diretorFavController.text;
  //   widget.usuario!.autoFavorito = _autorFavController.text;

  //   if (widget.usuario!.nome.isEmpty) {
  //     return;
  //   }

  //   widget.aoPressionar!(
  //     widget.usuario!.nome,
  //     widget.usuario!.dataNascimento,
  //     widget.usuario!.avatarUrl,
  //     widget.usuario!.generoFilmeFavorito,
  //     widget.usuario!.generoLivroFavorito,
  //     widget.usuario!.diretorFavorito,
  //     widget.usuario!.autoFavorito,
  //   );
  // }

  // addcionarUsuario() {
  //   final nomeUsuario = _nomeController.text;
  //   final nascimento = _dataNasc;
  //   final avatar = _avatarUsuario;
  //   final genedoFilmeFav = _generoFilmeController.text;
  //   final generLivroFav = _generoLivroController.text;
  //   final diretorFav = _diretorFavController.text;
  //   final autorFav = _autorFavController.text;

  //   if (nomeUsuario.isEmpty) {
  //     return;
  //   }

  //   widget.aoPressionar!(
  //     nomeUsuario,
  //     nascimento,
  //     avatar,
  //     genedoFilmeFav,
  //     generLivroFav,
  //     diretorFav,
  //     autorFav,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    void _addUsuario() {
      Navigator.pushReplacementNamed(
        context,
        '/PaginaDoUsuario',
        arguments: {
          'nome': _nomeController.value.text,
          'data': _dataNasc,
          'avatar': _avatarUsuario,
          'generoFilme': _generoFilmeController.value.text,
          'generoLivro': _generoLivroController.value.text,
          'doretor': _diretorFavController.value.text,
          'autor': _autorFavController.value.text,
        },
      );
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Pagina do Usuário'),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      print('Editar Imagem');
                    },
                    child: Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.amber,
                        image: DecorationImage(
                          image: NetworkImage(_avatarUsuario),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: TextField(
                      controller: _nomeController,
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
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Genero filme favorito',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: TextField(
                      controller: _generoLivroController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Genero Livro favorito',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: TextField(
                      controller: _diretorFavController,
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
                        aoPressionar: () {
                          return _addUsuario();
                        },
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
