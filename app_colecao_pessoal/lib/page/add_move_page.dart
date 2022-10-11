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
    TagGenero,
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
  TagGenero genero = TagGenero(genero: '');
  int? _classificacao;

  submeterItem() {
    final tituloDoFilme = tituloController.text;
    final diretorDoFilme = diretorController.text;
    final produtoraDoFilme = produtoraController.text;
    final sinopseDoFilme = sinopseController.text;
    final dataFilme = data;
    final generoFilme = genero;
    final estrelas = _classificacao;

    if (tituloDoFilme.isEmpty) {
      return;
    }

    widget.aoSubimeter(
      tituloDoFilme,
      diretorDoFilme,
      dataFilme,
      produtoraDoFilme,
      sinopseDoFilme,
      generoFilme,
      estrelas!,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Adicionando filme novo',
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Card(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 8, right: 8, top: 10, bottom: 10),
                  child: TextField(
                    controller: tituloController,
                    onSubmitted: (_) => submeterItem(),
                    decoration: const InputDecoration(
                      labelText: 'Titulo',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                //Subistitir o acesso a data toral por ano rolavel
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.blue[100],
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Center(
                          child: IconButton(
                              onPressed: () {
                                showDatePicker(
                                  context: context,
                                  initialDate: data,
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime(2100),
                                );
                              },
                              icon: const Icon(Icons.date_range_outlined))),
                    ),
                    Container(
                      height: 50,
                      width: 120,
                      decoration: BoxDecoration(
                        color: Colors.blue[100],
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text('$data'),
                    )
                  ],
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
                  child: TextField(
                    controller: sinopseController,
                    onSubmitted: submeterItem(),
                    decoration: const InputDecoration(
                      labelText: 'Sinopse',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TagGenero(genero: 'Ação'),
                      TagGenero(genero: 'Drama'),
                      TagGenero(genero: 'Ficção'),
                      TagGenero(genero: 'Fantasia'),
                    ],
                  ),
                ),
                //Criar uma avaliação por extrelas
                WidgetDeClassificacao(
                  aoSelecClassificacao: (aoSelecClassificacao) {
                    setState(() {
                      _classificacao = aoSelecClassificacao;
                    });
                  },
                ),
                SizedBox(
                  height: 44,
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
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Cancelar'),
                      ),
                      TextButton(
                        onPressed: submeterItem,
                        child: const Text('Adicionar Filme'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
