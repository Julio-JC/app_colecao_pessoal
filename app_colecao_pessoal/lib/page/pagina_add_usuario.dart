import 'package:app_colecao_pessoal/page/pagina_novo_usuario.dart';
import 'package:app_colecao_pessoal/profile/infraestructure/data.dart';
import 'package:app_colecao_pessoal/widget/botao_de_texot.dart';
import 'package:flutter/material.dart';

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
  final TextEditingController _avatarController = TextEditingController();
  final TextEditingController _generoFilmeController = TextEditingController();
  final TextEditingController _generoLivroController = TextEditingController();
  final TextEditingController _diretorFavController = TextEditingController();
  final TextEditingController _autorFavController = TextEditingController();

  adicionarUsuario() {
    final nomeUsuario = _nomeController.text;
    final nascimento = _dataNasc;
    final avatar = _avatarController.text;
    final generodoFilmeFav = _generoFilmeController.text;
    final generoDoLivroFav = _generoLivroController.text;
    final diretorFav = _diretorFavController.text;
    final autorFav = _autorFavController.text;

    if (nomeUsuario.isEmpty) {
      return;
    }

    if (widget.aoPressionar != null) {
      widget.aoPressionar!(
        nomeUsuario,
        nascimento,
        avatar,
        generodoFilmeFav,
        generoDoLivroFav,
        diretorFav,
        autorFav,
      );
    }
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
                        labelText: 'Genero filme favorito',
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
                        labelText: 'Genero Livro favorito',
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
                        aoPressionar: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return PaginaNovoUsuario(
                              receber: adicionarUsuario,
                            );
                          }));
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
