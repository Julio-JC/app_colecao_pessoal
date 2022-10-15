import 'package:app_colecao_pessoal/profile/infraestructure/data.dart';
import 'package:app_colecao_pessoal/widget/tag_genero.dart';
import 'package:app_colecao_pessoal/widget/widget_de_classificacao.dart';
import 'package:flutter/material.dart';

class PaginaAddFilme extends StatefulWidget {
  const PaginaAddFilme({super.key, required this.aoSubimeter});

  final Function(
    String,
    String,
    DateTime,
    String,
    String,
    String,
    int,
  ) aoSubimeter;

  @override
  State<PaginaAddFilme> createState() => _AddMovePageState();
}

class _AddMovePageState extends State<PaginaAddFilme> {
  final TextEditingController _tituloController = TextEditingController();
  final TextEditingController _diretorController = TextEditingController();
  DateTime data = DateTime.now();
  final TextEditingController _produtoraController = TextEditingController();
  final TextEditingController _sinopseController = TextEditingController();
  String? _genero;
  int? _classificacao;

  submeterItem() {
    final tituloDoFilme = _tituloController.text;
    final diretorDoFilme = _diretorController.text;
    final dataFilme = data;
    final produtoraDoFilme = _produtoraController.text;
    final sinopseDoFilme = _sinopseController.text;
    final generoFilme = _genero;
    final estrelas = _classificacao;

    if (tituloDoFilme.isEmpty ||
        diretorDoFilme.isEmpty ||
        produtoraDoFilme.isEmpty) {
      return;
    }

    widget.aoSubimeter(
      tituloDoFilme,
      diretorDoFilme,
      dataFilme,
      produtoraDoFilme,
      sinopseDoFilme,
      generoFilme!,
      estrelas!,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Adicionando filme novo',
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 20,
                      bottom: 10,
                    ),
                    child: TextField(
                      controller: _tituloController,
                      onSubmitted: (_) => submeterItem(),
                      decoration: const InputDecoration(
                        labelText: 'Titulo',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  //TODO Subistitir o acesso a data total por ano rolavel
                  Data(dateTime: data),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: TextField(
                      controller: _diretorController,
                      onSubmitted: submeterItem(),
                      decoration: const InputDecoration(
                        labelText: 'Diretor',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: TextField(
                      controller: _produtoraController,
                      onSubmitted: submeterItem(),
                      decoration: const InputDecoration(
                        labelText: 'Produtora',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxHeight: 100),
                      child: TextField(
                        maxLines: null,
                        controller: _sinopseController,
                        onSubmitted: submeterItem(),
                        decoration: const InputDecoration(
                          labelText: 'Sinopse',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TagGenero(
                            genero: 'Ação',
                            aoPessionar: (aoPessionar) {
                              _genero = aoPessionar;
                            }),
                        TagGenero(
                            genero: 'Drama',
                            aoPessionar: (aoPessionar) {
                              _genero = aoPessionar;
                            }),
                        TagGenero(
                            genero: 'Ficção',
                            aoPessionar: (aoPessionar) {
                              _genero = aoPessionar;
                            }),
                        TagGenero(
                            genero: 'Fantasia',
                            aoPessionar: (aoPessionar) {
                              _genero = aoPessionar;
                            }),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text('Quantas estrelas você da para este filme'),
                  WidgetDeClassificacao(
                    aoSelecClassificacao: (aoSelecClassificacao) {
                      _classificacao = aoSelecClassificacao;
                    },
                  ),
                  SizedBox(
                    height: 30,
                    child: _classificacao != null && _classificacao! > 0
                        ? Text(
                            'Sua classificação é de $_classificacao estrela',
                            style: const TextStyle(fontSize: 15),
                          )
                        : const SizedBox.shrink(),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  //TODO criar um widget textButton
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            'Cancelar',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        TextButton(
                          onPressed: submeterItem,
                          child: const Text(
                            'Adicionar Filme',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ],
                    ),
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
