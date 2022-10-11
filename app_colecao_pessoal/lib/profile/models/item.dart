import '../../widget/tag_genero.dart';

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
}
