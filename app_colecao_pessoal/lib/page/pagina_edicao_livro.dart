import 'package:app_colecao_pessoal/profile/repositorio/repositorio_de_livros.dart';
import 'package:flutter/material.dart';
import '../profile/models/livro.dart';
import '../widget/botao_de_texot.dart';
import '../widget/data.dart';
import '../widget/tag_genero.dart';
import '../widget/widget_de_classificacao.dart';

// ignore: must_be_immutable
class PaginaDeEdicaoLivro extends StatefulWidget {
  PaginaDeEdicaoLivro(
      {super.key,
      required this.livros,
      required this.index,
      required this.repositorioLivro,
      required this.emMudanca});
  List<Livro> livros;
  final int index;
  final RepositorioDeLivros repositorioLivro;
  final Function(List<Livro>) emMudanca;
  @override
  State<PaginaDeEdicaoLivro> createState() => _PaginaDeEdicaiFilmeState();
}

class _PaginaDeEdicaiFilmeState extends State<PaginaDeEdicaoLivro> {
  @override
  void initState() {
    super.initState();
    widget.repositorioLivro.getLivroLista().then((value) {
      setState(() {
        widget.livros = value;
      });
    });
  }

  late final TextEditingController _tituloController =
      TextEditingController(text: widget.livros[widget.index].titulo);
  late final TextEditingController _autorController =
      TextEditingController(text: widget.livros[widget.index].autor);
  late final DateTime _data = widget.livros[widget.index].anoDePublicacao!;
  late final TextEditingController _editoraController =
      TextEditingController(text: widget.livros[widget.index].editora);
  late final TextEditingController _sinopseController =
      TextEditingController(text: widget.livros[widget.index].sinopse);
  late String? _genero = widget.livros[widget.index].generoDoLivro;
  late int? _classificacao = widget.livros[widget.index].notaDoUsuario;

  submeterItemLivro() {
    final livroEditado = widget.livros[widget.index].copy(
      titulo: _tituloController.text,
      autor: _autorController.text,
      anoDePublicacao: _data,
      editora: _editoraController.text,
      sinopse: _sinopseController.text,
      generoDoLivro: _genero,
      notaDoUsuario: _classificacao,
    );

    widget.livros[widget.index] = livroEditado;

    widget.repositorioLivro.salvarListaDeLivro(widget.livros);

    widget.emMudanca.call(widget.livros);

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Editar Filme'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                    bottom: 10,
                  ),
                  child: TextField(
                    controller: _tituloController,
                    decoration: const InputDecoration(
                      labelText: 'Titulo',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Data(titulo: 'Lançado em:', dateTime: _data),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: TextField(
                    controller: _autorController,
                    decoration: const InputDecoration(
                      labelText: 'Diretor',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: TextField(
                    controller: _editoraController,
                    decoration: const InputDecoration(
                      labelText: 'Produtora',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxHeight: 100),
                    child: TextField(
                      maxLines: null,
                      controller: _sinopseController,
                      decoration: const InputDecoration(
                        labelText: 'Sinopse',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TagGenero(
                          genero: 'Ação',
                          aoPessionar: (aoPessionar) {
                            _genero = aoPessionar;
                          }),
                      TagGenero(
                          genero: 'Drama',
                          aoPessionar: (aoPessionar) {
                            _genero = aoPessionar;
                          }),
                      TagGenero(
                          genero: 'Ficção',
                          aoPessionar: (aoPessionar) {
                            _genero = aoPessionar;
                          }),
                      TagGenero(
                          genero: 'Fantasia',
                          aoPessionar: (aoPessionar) {
                            _genero = aoPessionar;
                          }),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text('Quantas estrelas você da para este filme'),
                WidgetDeClassificacao(
                  aoSelecClassificacao: (aoSelecClassificacao) {
                    _classificacao = aoSelecClassificacao;
                  },
                ),
                SizedBox(
                  height: 30,
                  child: _classificacao != null && _classificacao! > 0
                      ? Text(
                          'Sua classificação é de $_classificacao estrela',
                          style: const TextStyle(fontSize: 15),
                        )
                      : const SizedBox.shrink(),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BotaoDeTexto(
                        tirulo: 'Cancelar',
                        aoPressionar: () {
                          Navigator.pop(context);
                        },
                      ),
                      BotaoDeTexto(
                        tirulo: 'Editar livro',
                        aoPressionar: submeterItemLivro,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
