import 'package:app_colecao_pessoal/profile/repositorio/repositorio.dart';
import 'package:flutter/material.dart';
import '../profile/models/filme.dart';
import '../widget/botao_de_texot.dart';
import '../widget/data.dart';
import '../widget/tag_genero.dart';
import '../widget/widget_de_classificacao.dart';

// ignore: must_be_immutable
class PaginaDeEdicaoFilme extends StatefulWidget {
  PaginaDeEdicaoFilme(
      {super.key,
      required this.filmes,
      required this.index,
      required this.repositorioFilme,
      required this.emMudanca});
  List<Filme> filmes;
  final int index;
  final Repositorio repositorioFilme;
  final Function(List<Filme>) emMudanca;
  @override
  State<PaginaDeEdicaoFilme> createState() => _PaginaDeEdicaiFilmeState();
}

class _PaginaDeEdicaiFilmeState extends State<PaginaDeEdicaoFilme> {
  @override
  void initState() {
    super.initState();
    widget.repositorioFilme.getFilmeLista().then((value) {
      setState(() {
        widget.filmes = value;
      });
    });
  }

  late final TextEditingController _tituloController =
      TextEditingController(text: widget.filmes[widget.index].titulo);
  late final TextEditingController _diretorController =
      TextEditingController(text: widget.filmes[widget.index].diretor);
  late final DateTime _data = widget.filmes[widget.index].anoDeLancamento!;
  late final TextEditingController _produtoraController =
      TextEditingController(text: widget.filmes[widget.index].produtora);
  late final TextEditingController _sinopseController =
      TextEditingController(text: widget.filmes[widget.index].sinopse);
  late String? _genero = widget.filmes[widget.index].generoDoFilme;
  late int? _classificacao = widget.filmes[widget.index].notaDoUsuario;

  submeterItem() {
    final filmeEditado = widget.filmes[widget.index].copy(
      titulo: _tituloController.text,
      diretor: _diretorController.text,
      anoDeLancamento: _data,
      produtora: _produtoraController.text,
      sinopse: _sinopseController.text,
      generoDoFilme: _genero,
      notaDoUsuario: _classificacao,
    );

    widget.filmes[widget.index] = filmeEditado;

    widget.repositorioFilme.salvarListaDeFilme(widget.filmes);

    widget.emMudanca.call(widget.filmes);

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
                    controller: _diretorController,
                    decoration: const InputDecoration(
                      labelText: 'Diretor',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: TextField(
                    controller: _produtoraController,
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
                        tirulo: 'Editar filme',
                        aoPressionar: submeterItem,
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
