class Livro {
  Livro({
    required this.id,
    required this.titulo,
    required this.autor,
    required this.anoDePublicacao,
    required this.editora,
    required this.sinopse,
    required this.generoDoLivro,
    required this.notaDoUsuario,
  });

  String? id;
  String? titulo;
  String? autor;
  DateTime? anoDePublicacao;
  String? editora;
  String? sinopse;
  String? generoDoLivro;
  int? notaDoUsuario;

  Livro copy({
    String? id,
    String? titulo,
    String? autor,
    DateTime? anoDePublicacao,
    String? editora,
    String? sinopse,
    String? generoDoLivro,
    int? notaDoUsuario,
  }) =>
      Livro(
        id: id ?? this.id,
        titulo: titulo ?? this.titulo,
        autor: autor ?? this.autor,
        anoDePublicacao: anoDePublicacao ?? this.anoDePublicacao,
        editora: editora ?? this.editora,
        sinopse: sinopse ?? this.sinopse,
        generoDoLivro: generoDoLivro ?? this.generoDoLivro,
        notaDoUsuario: notaDoUsuario ?? this.notaDoUsuario,
      );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'titulo': titulo,
      'autor': autor,
      'anoDePublicacao': anoDePublicacao!.toIso8601String(),
      'produtora': editora,
      'sinopse': sinopse,
      'generoDoLivro': generoDoLivro,
      'notaDoUsuario': notaDoUsuario,
    };
  }

  Livro.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        titulo = json['titulo'],
        autor = json['autor'],
        anoDePublicacao = DateTime.parse(json['anoDePublicacao']),
        editora = json['produtora'],
        sinopse = json['sinopse'],
        generoDoLivro = json['generoDoLivro'],
        notaDoUsuario = json['notaDoUsuario'];
}
