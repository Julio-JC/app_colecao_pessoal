class Usuario {
  String? nomeUsuario;
  DateTime? dataNascimento;
  String? avatarUrl;
  String? generoFilmeFavorito;
  String? generoLivroFavorito;
  String? diretorFavorito;
  String? autorFavorito;

  Usuario(
      {this.nomeUsuario,
      this.dataNascimento,
      this.avatarUrl,
      this.generoFilmeFavorito,
      this.generoLivroFavorito,
      this.diretorFavorito,
      this.autorFavorito});

  Usuario.fromJson(Map<String, dynamic> json) {
    nomeUsuario = json['nomeUsuario'];
    dataNascimento = DateTime.parse(json['dataNascimento']);
    avatarUrl = json['avatarUrl'];
    generoFilmeFavorito = json['generoFilmeFavorito'];
    generoLivroFavorito = json['generoLivroFavorito'];
    diretorFavorito = json['diretorFavorito'];
    autorFavorito = json['autorFavorito'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nomeUsuario'] = nomeUsuario;
    data['dataNascimento'] = dataNascimento.toString();
    data['avatarUrl'] = avatarUrl;
    data['generoFilmeFavorito'] = generoFilmeFavorito;
    data['generoLivroFavorito'] = generoLivroFavorito;
    data['diretorFavorito'] = diretorFavorito;
    data['autorFavorito'] = autorFavorito;
    return data;
  }
}
