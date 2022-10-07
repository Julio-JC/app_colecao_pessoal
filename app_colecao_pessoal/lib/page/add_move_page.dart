import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';

class AddMovePage extends StatefulWidget {
  AddMovePage({
    super.key,
  });

  @override
  State<AddMovePage> createState() => _AddMovePageState();
}

class _AddMovePageState extends State<AddMovePage> {
  final TextEditingController tituloController = TextEditingController();
  final TextEditingController autorDiretorController = TextEditingController();
  final TextEditingController produtoraEditoraController =
      TextEditingController();
  final TextEditingController sinopseController = TextEditingController();
  DateTime data = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Adicionando filme novo',
          ),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Card(
              child: Column(
                children: [
                  const Padding(
                    padding:
                        EdgeInsets.only(left: 8, right: 8, top: 20, bottom: 20),
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Titulo',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
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
                  ),
                  const Padding(
                    padding:
                        EdgeInsets.only(left: 8, right: 8, top: 20, bottom: 20),
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Diretor',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const Padding(
                    padding:
                        EdgeInsets.only(left: 8, right: 8, top: 20, bottom: 20),
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Produtora',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const Padding(
                    padding:
                        EdgeInsets.only(left: 8, right: 8, top: 20, bottom: 20),
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Sinopse',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Row(children: const [Text('Tags de generos')]),
                  Row(
                    children: const [
                      Text('Nota do usuário Star selector'),
                    ],
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
                          onPressed: () {},
                          child: const Text('Cancelar'),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text('Adicionar Filme'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
