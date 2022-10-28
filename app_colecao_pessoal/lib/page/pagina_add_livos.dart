import 'package:flutter/material.dart';
import '../widget/data.dart';
import '../widget/botao_de_texot.dart';
import '../widget/tag_genero.dart';
import '../widget/widget_de_classificacao.dart';

class PaginaAddLivros extends StatefulWidget {
  const PaginaAddLivros({super.key, this.aoSubimeter});

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
  State<PaginaAddLivros> createState() => _PaginaAddLivrosState();
}

class _PaginaAddLivrosState extends State<PaginaAddLivros> {
  final formKey = GlobalKey<FormState>();

  final TextEditingController _tituloLController = TextEditingController();
  final TextEditingController _autorController = TextEditingController();
  final DateTime _data = DateTime.now();
  final TextEditingController _editoraController = TextEditingController();
  final TextEditingController _sinopseLController = TextEditingController();
  String? _generoL;
  int? _classificacaoL;

  submeterItemLivro() {
    final tituloDoLivro = _tituloLController.text;
    final autorDoLivro = _autorController.text;
    final dataLivro = _data;
    final editoraDoLivro = _editoraController.text;
    final sinopseDoLivro = _sinopseLController.text;
    final generoLivro = _generoL;
    final estrelasL = _classificacaoL;

    formKey.currentState?.validate();

    if (tituloDoLivro.isEmpty ||
        autorDoLivro.isEmpty ||
        editoraDoLivro.isEmpty) {
      return;
    }

    widget.aoSubimeter!(
      tituloDoLivro,
      autorDoLivro,
      dataLivro,
      editoraDoLivro,
      sinopseDoLivro,
      generoLivro!,
      estrelasL!,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Adicinar Livro'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 20,
                          bottom: 10,
                        ),
                        child: TextFormField(
                          controller: _tituloLController,
                          onFieldSubmitted: (_) => submeterItemLivro(),
                          decoration: const InputDecoration(
                            labelText: 'Titulo',
                            border: OutlineInputBorder(),
                          ),
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Titulo obrgatório';
                            }
                          },
                        ),
                      ),
                      Data(titulo: 'Publicado em:', dateTime: _data),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: TextFormField(
                          controller: _autorController,
                          onFieldSubmitted: submeterItemLivro(),
                          decoration: const InputDecoration(
                            labelText: 'Autor',
                            border: OutlineInputBorder(),
                          ),
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Autor obrgatório';
                            }
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: TextFormField(
                          controller: _editoraController,
                          onFieldSubmitted: submeterItemLivro(),
                          decoration: const InputDecoration(
                            labelText: 'Editora',
                            border: OutlineInputBorder(),
                          ),
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Editora obrgatório';
                            }
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(maxHeight: 100),
                          child: TextFormField(
                            maxLines: null,
                            controller: _sinopseLController,
                            onFieldSubmitted: submeterItemLivro(),
                            decoration: const InputDecoration(
                              labelText: 'Sinopse',
                              border: OutlineInputBorder(),
                            ),
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return 'Sinopse obrgatório';
                              }
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TagGenero(
                                genero: 'Aventura',
                                aoPessionar: (aoPessionar) {
                                  _generoL = aoPessionar;
                                }),
                            TagGenero(
                                genero: 'Romance',
                                aoPessionar: (aoPessionar) {
                                  _generoL = aoPessionar;
                                }),
                            TagGenero(
                                genero: 'Ficção',
                                aoPessionar: (aoPessionar) {
                                  _generoL = aoPessionar;
                                }),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TagGenero(
                                  genero: 'Fantasia',
                                  aoPessionar: (aoPessionar) {
                                    _generoL = aoPessionar;
                                  }),
                              TagGenero(
                                  genero: 'Terror',
                                  aoPessionar: (aoPessionar) {
                                    _generoL = aoPessionar;
                                  }),
                            ]),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text('Quantas estrelas você da para este filme'),
                      WidgetDeClassificacao(
                        aoSelecClassificacao: (aoSelecClassificacao) {
                          _classificacaoL = aoSelecClassificacao;
                        },
                      ),
                      SizedBox(
                        height: 30,
                        child: _classificacaoL != null && _classificacaoL! > 0
                            ? Text(
                                'Sua classificação é de $_classificacaoL estrela',
                                style: const TextStyle(fontSize: 15),
                              )
                            : const SizedBox.shrink(),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Padding(
                        padding: EdgeInsets.all(5),
                        child: Text('*Todos os campos são obrigatórios',
                            style: TextStyle(color: Colors.red)),
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
                              tirulo: 'Adicionar Livro',
                              aoPressionar: submeterItemLivro,
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
        ),
      ),
    );
  }
}
