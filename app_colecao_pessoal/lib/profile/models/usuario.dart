class Usuario {
  Usuario({
    required this.nome,
    required this.dataNascimento,
    required this.avatarUrl,
    required this.generoFilmeFavorito,
    required this.generoLivroFavorito,
    required this.diretorFavorito,
    required this.autoFavorito,
  });

  String nome;
  DateTime dataNascimento;
  String avatarUrl;
  String generoFilmeFavorito;
  String generoLivroFavorito;
  String diretorFavorito;
  String autoFavorito;
}
