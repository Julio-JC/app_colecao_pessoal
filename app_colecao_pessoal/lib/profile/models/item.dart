import 'package:flutter/cupertino.dart';

class Item {
  Item({
    required this.icone,
    required this.titulo,
    required this.autorDiretor,
    required this.anoDeLancamentoPublicacao,
    required this.produtoraEditora,
    required this.sinopse,
    required this.genero,
    required this.notaDoUsuario,
  });

  Icon icone;
  String titulo;
  String autorDiretor;
  DateTime anoDeLancamentoPublicacao;
  String produtoraEditora;
  String sinopse;
  String genero;
  int notaDoUsuario;
}
