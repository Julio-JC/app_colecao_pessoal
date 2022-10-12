import 'package:app_colecao_pessoal/widget/tag_genero.dart';
import 'package:app_colecao_pessoal/widget/widget_de_classificacao.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';

class AddMovePage extends StatefulWidget {
  const AddMovePage({super.key, required this.aoSubimeter});

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
  State<AddMovePage> createState() => _AddMovePageState();
}

class _AddMovePageState extends State<AddMovePage> {
  final TextEditingController tituloController = TextEditingController();
  final TextEditingController diretorController = TextEditingController();
  DateTime data = DateTime.now();
  final TextEditingController produtoraController = TextEditingController();
  final TextEditingController sinopseController = TextEditingController();
  String? _genero;
  int? _classificacao;

  submeterItem() {
    final tituloDoFilme = tituloController.text;
    final diretorDoFilme = diretorController.text;
    final produtoraDoFilme = produtoraController.text;
    final sinopseDoFilme = sinopseController.text;
    final dataFilme = data;
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
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Card(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 8, right: 8, top: 20, bottom: 10),
                    child: TextField(
                      controller: tituloController,
                      onSubmitted: (_) => submeterItem(),
                      decoration: const InputDecoration(
                        labelText: 'Titulo',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  //TODO Subistitir o acesso a data total por ano rolavel
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Text(
                          'Ano de lançamento: ',
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
                                  onPressed: () {
                                    setState(() {
                                      showDatePicker(
                                        initialDatePickerMode:
                                            DatePickerMode.year,
                                        context: context,
                                        initialDate: data,
                                        firstDate: DateTime(1900),
                                        lastDate: DateTime(2100),
                                      );
                                    });
                                  },
                                  icon: const Icon(Icons.date_range_outlined))),
                        ),
                        Container(
                          padding: EdgeInsets.all(15),
                          height: 50,
                          width: 120,
                          decoration: BoxDecoration(
                            color: Colors.blue[50],
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Text(
                            DateFormat('yyyy').format(data),
                            style: const TextStyle(fontSize: 18),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 8, right: 8, top: 10, bottom: 10),
                    child: TextField(
                      controller: diretorController,
                      onSubmitted: submeterItem(),
                      decoration: const InputDecoration(
                        labelText: 'Diretor',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 8, right: 8, top: 10, bottom: 10),
                    child: TextField(
                      controller: produtoraController,
                      onSubmitted: submeterItem(),
                      decoration: const InputDecoration(
                        labelText: 'Produtora',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 8, right: 8, top: 10, bottom: 10),
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxHeight: 100),
                      child: TextField(
                        maxLines: null,
                        controller: sinopseController,
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
                      setState(() {
                        _classificacao = aoSelecClassificacao;
                      });
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
