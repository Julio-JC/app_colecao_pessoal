import 'package:app_colecao_pessoal/page/pagina_inicial.dart';
import 'package:app_colecao_pessoal/profile/infraestructure/data.dart';
import 'package:app_colecao_pessoal/widget/botao_de_texot.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PaginaAddUsuario extends StatefulWidget {
  const PaginaAddUsuario({super.key, this.aoPressionar});

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
  DateTime _dataNasc = DateTime.now();
  String? _imagem;
  final TextEditingController _generoFilmeController = TextEditingController();
  final TextEditingController _generoLivroController = TextEditingController();
  final TextEditingController _diretorFavController = TextEditingController();
  final TextEditingController _autorFavController = TextEditingController();

  adcionarUsuario() {
    final nomeUsuario = _nomeController.text;
    final nascimento = _dataNasc;
    final imagemUsuario = _imagem;
    final genedoFilmeFav = _generoFilmeController.text;
    final generLivroFav = _generoLivroController.text;
    final diretorFav = _diretorFavController.text;
    final autorFav = _autorFavController.text;

    if (nomeUsuario.isEmpty || imagemUsuario!.isEmpty) {
      return;
    }

    widget.aoPressionar!(
      nomeUsuario,
      nascimento,
      imagemUsuario,
      genedoFilmeFav,
      generLivroFav,
      diretorFav,
      autorFav,
    );
  }

  @override
  Widget build(BuildContext context) {
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
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.amber,
                        image: DecorationImage(
                            image:
                                AssetImage('assets/image/icone-do-perfil.jpg')),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text(
                        'Data de nascimento',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Center(
                          child: IconButton(
                            onPressed: () async {
                              final data = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                lastDate: DateTime(2100),
                                firstDate: DateTime(1900),
                              );
                              if (_dataNasc != null && data != _dataNasc) {
                                setState(() {
                                  _dataNasc = data!;
                                });
                              }
                            },
                            icon: const Icon(Icons.date_range_outlined),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(15),
                        height: 50,
                        width: 120,
                        decoration: BoxDecoration(
                          color: Colors.blue[50],
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Text(
                          DateFormat('d/MM/yyyy').format(_dataNasc),
                          style: const TextStyle(fontSize: 18),
                        ),
                      )
                    ],
                  ),
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
                        aoPressionar: () {},
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
