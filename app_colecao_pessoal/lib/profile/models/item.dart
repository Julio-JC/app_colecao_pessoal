import 'dart:convert';

class Item {
  Item({
    required this.id,
    required this.titulo,
    required this.autorDiretor,
    required this.anoDeLancamentoPublicacao,
    required this.produtoraEditora,
    required this.sinopse,
    required this.generoDoItem,
    required this.notaDoUsuario,
  });

  String id;
  String titulo;
  String autorDiretor;
  DateTime anoDeLancamentoPublicacao;
  String produtoraEditora;
  String sinopse;
  String generoDoItem;
  int notaDoUsuario;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'titulo': titulo,
      'autorDiretor': autorDiretor,
      'anoDeLancamentoPublicacao': anoDeLancamentoPublicacao.toIso8601String(),
      'produtoraEditora': produtoraEditora,
      'sinopse': sinopse,
      'generoDoItem': generoDoItem,
      'notaDoUsuario': notaDoUsuario,
    };
  }

  Item.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        titulo = json['titulo'],
        autorDiretor = json['autorDiretor'],
        anoDeLancamentoPublicacao =
            DateTime.parse(json['anoDeLancamentoPublicacao']),
        produtoraEditora = json['produtoraEditora'],
        sinopse = json['sinopse'],
        generoDoItem = json['generoDoItem'],
        notaDoUsuario = json['notaDoUsuario'];

  // Map<String, dynamic> toMap() {
  //   var map = <String, dynamic>{
  //     'id': id,
  //     'titulo': titulo,
  //     'autorDiretor': autorDiretor,
  //     'anoDeLancamentoPublicacao': anoDeLancamentoPublicacao,
  //     'produtoraEditora': produtoraEditora,
  //     'sinopse': sinopse,
  //     'generoDoItem': generoDoItem,
  //     'notaDoUsuario': notaDoUsuario,
  //   };
  //   return map;
  // }

  // Item.fromMap(Map<String, dynamic> map) {
  //   id = map['id'];
  //   titulo = map['titulo'];
  //   autorDiretor = map['autorDiretor'];
  //   anoDeLancamentoPublicacao = map['anoDeLancamentoPublicacao'];
  //   produtoraEditora = map['produtoraEditora'];
  //   sinopse = map['sinopse'];
  //   generoDoItem = map['generoDoItem'];
  //   notaDoUsuario = map['notaDoUsuario'];
  // }
}
