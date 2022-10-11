import 'package:flutter/material.dart';

//TODO Refaturar o código para não usar funções para retornar widget

class WidgetDeClassificacao extends StatefulWidget {
  const WidgetDeClassificacao(
      {super.key,
      this.classificacaoMaxima = 5,
      required this.aoSelecClassificacao});

  final int classificacaoMaxima;
  final Function(int) aoSelecClassificacao;

  @override
  State<WidgetDeClassificacao> createState() => _WidgetDeClassificacaoState();
}

class _WidgetDeClassificacaoState extends State<WidgetDeClassificacao> {
  int _classificacaoAtual = 0;

  Widget _estrelaDeClassificacao(int index) {
    if (index < _classificacaoAtual) {
      return const Icon(
        Icons.star,
        color: Colors.blue,
      );
    } else {
      return const Icon(Icons.star_border_outlined);
    }
  }

  Widget _corpoDaConstrucao() {
    final stars = List<Widget>.generate(
      widget.classificacaoMaxima,
      (index) {
        return GestureDetector(
          child: _estrelaDeClassificacao(index),
          onTap: () {
            setState(() {
              _classificacaoAtual = index + 1;
            });
            widget.aoSelecClassificacao(_classificacaoAtual);
          },
        );
      },
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: stars,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: _corpoDaConstrucao(),
    );
  }
}
