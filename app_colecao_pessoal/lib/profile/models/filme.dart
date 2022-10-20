class Filme {
  Filme({
    required this.id,
    required this.titulo,
    required this.diretor,
    required this.anoDeLancamento,
    required this.produtora,
    required this.sinopse,
    required this.generoDoFilme,
    required this.notaDoUsuario,
  });

  String id;
  String titulo;
  String diretor;
  DateTime anoDeLancamento;
  String produtora;
  String sinopse;
  String generoDoFilme;
  int notaDoUsuario;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'titulo': titulo,
      'diretor': diretor,
      'anoDeLancamento': anoDeLancamento.toIso8601String(),
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
