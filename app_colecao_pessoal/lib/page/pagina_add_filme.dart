import 'package:flutter/material.dart';
import '../widget/data.dart';
import '../widget/botao_de_texot.dart';
import '../widget/tag_genero.dart';
import '../widget/widget_de_classificacao.dart';

class PaginaAddFilme extends StatefulWidget {
  const PaginaAddFilme({super.key, this.aoSubimeter});

  final Function(
    String,
    String,
    DateTime,
    String,
    String,
    String,
    int,
  )? aoSubimeter;

  @override
  State<PaginaAddFilme> createState() => _PaginaAddFilmeState();
}

class _PaginaAddFilmeState extends State<PaginaAddFilme> {
  final TextEditingController _tituloController = TextEditingController();
  final TextEditingController _diretorController = TextEditingController();
  final DateTime _data = DateTime.now();
  final TextEditingController _produtoraController = TextEditingController();
  final TextEditingController _sinopseController = TextEditingController();
  String? _genero;
  int? _classificacao;

  submeterItemFilme() {
    final tituloDoFilme = _tituloController.text;
    final diretorDoFilme = _diretorController.text;
    final dataFilme = _data;
    final produtoraDoFilme = _produtoraController.text;
    final sinopseDoFilme = _sinopseController.text;
    final generoFilme = _genero;
    final estrelas = _classificacao;

    if (tituloDoFilme.isEmpty ||
        diretorDoFilme.isEmpty ||
        produtoraDoFilme.isEmpty) {
      return;
    }

    widget.aoSubimeter!(
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
          title: const Text("Adicionando filme"),
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
                      onSubmitted: (_) => submeterItemFilme(),
                      decoration: const InputDecoration(
                        labelText: 'Titulo',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Data(titulo: 'Lançado em:', dateTime: _data),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: TextField(
                      controller: _diretorController,
                      onSubmitted: submeterItemFilme(),
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
                      onSubmitted: submeterItemFilme(),
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
                        onSubmitted: submeterItemFilme(),
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
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BotaoDeTexto(
                          tirulo: 'Cancelar',
                          aoPressionar: () {
                            Navigator.pop(context);
                          },
                        ),
                        BotaoDeTexto(
                          tirulo: 'Adicionar filme',
                          aoPressionar: submeterItemFilme,
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
