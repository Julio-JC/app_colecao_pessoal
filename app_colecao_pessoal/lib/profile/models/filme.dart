class Filme {
  Filme({
    this.id,
    this.titulo,
    this.diretor,
    this.anoDeLancamento,
    this.produtora,
    this.sinopse,
    this.generoDoFilme,
    this.notaDoUsuario,
  });

  String? id;
  String? titulo;
  String? diretor;
  DateTime? anoDeLancamento;
  String? produtora;
  String? sinopse;
  String? generoDoFilme;
  int? notaDoUsuario;

  Filme copy({
    String? id,
    String? titulo,
    String? diretor,
    DateTime? anoDeLancamento,
    String? produtora,
    String? sinopse,
    String? generoDoFilme,
    int? notaDoUsuario,
  }) =>
      Filme(
        id: id ?? this.id,
        titulo: titulo ?? this.titulo,
        diretor: diretor ?? this.diretor,
        anoDeLancamento: anoDeLancamento ?? this.anoDeLancamento,
        produtora: produtora ?? this.produtora,
        sinopse: sinopse ?? this.sinopse,
        generoDoFilme: generoDoFilme ?? generoDoFilme,
        notaDoUsuario: notaDoUsuario ?? this.notaDoUsuario,
      );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'titulo': titulo,
      'diretor': diretor,
      'anoDeLancamento': anoDeLancamento!.toIso8601String(),
      'produtora': produtora,
      'sinopse': sinopse,
      'generoDoFilme': generoDoFilme,
      'notaDoUsuario': notaDoUsuario,
    };
  }

  Filme.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        titulo = json['titulo'],
        diretor = json['diretor'],
        anoDeLancamento = DateTime.parse(json['anoDeLancamento']),
        produtora = json['produtora'],
        sinopse = json['sinopse'],
        generoDoFilme = json['generoDoFilme'],
        notaDoUsuario = json['notaDoUsuario'];
}
