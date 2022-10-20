import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TagGenero extends StatefulWidget {
  TagGenero({super.key, required this.genero, required this.aoPessionar});

  String genero;
  final Function(String)? aoPessionar;

  @override
  State<TagGenero> createState() => _TagGeneroState();
}

class _TagGeneroState extends State<TagGenero> {
  bool selecionado = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: ChoiceChip(
        label: Text(
          widget.genero,
        ),
        selected: selecionado,
        selectedColor: Colors.blue,
        onSelected: (novoSelecionado) {
          setState(() {
            selecionado = novoSelecionado;
          });
          widget.aoPessionar!(widget.genero);
        },
      ),
    );
  }
}
