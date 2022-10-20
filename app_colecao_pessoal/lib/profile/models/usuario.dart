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

  String nome = 'Nome';
  DateTime dataNascimento = DateTime.now();
  String avatarUrl;
  String generoFilmeFavorito = 'Genero filme';
  String generoLivroFavorito = 'Genero Livro';
  String diretorFavorito = 'Diretor';
  String autoFavorito = 'Autor';
}
