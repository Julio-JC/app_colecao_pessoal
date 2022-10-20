import 'dart:math';
import 'package:app_colecao_pessoal/page/pagina_add_filme.dart';
import 'package:app_colecao_pessoal/profile/repositorio/repositorio.dart';
import 'package:app_colecao_pessoal/widget/card_do_carrossel.dart';
import 'package:flutter/material.dart';
import '../profile/models/filme.dart';
import '../widget/item_da_lista_filme.dart';

class PaginaListaDeFilmes extends StatefulWidget {
  const PaginaListaDeFilmes({super.key, this.filme});
  final Filme? filme;
  @override
  State<PaginaListaDeFilmes> createState() => _MinhaListaDeFilmesState();
}

class _MinhaListaDeFilmesState extends State<PaginaListaDeFilmes> {
  final Repositorio repositorioDeFilmes = Repositorio();
  List<Filme> filmes = [];

  Filme? itemDeletado;
  int? posicaoItem;

  @override
  void initState() {
    super.initState();

    repositorioDeFilmes.getFilmeLista().then((value) {
      setState(() {
        filmes = value;
      });
    });
  }

  adicionarItem(
    String filme,
    String diretor,
    DateTime anoLancamento,
    String produtora,
    String sinopse,
    String genero,
    int nota,
  ) {
    final novoFilme = Filme(
      id: Random().nextDouble().toString(),
      titulo: filme,
      diretor: diretor,
      anoDeLancamento: anoLancamento,
      produtora: produtora,
      sinopse: sinopse,
      generoDoFilme: genero,
      notaDoUsuario: nota,
    );
    setState(() {
      filmes.add(novoFilme);
    });
    repositorioDeFilmes.salvarListaDeFilme(filmes);

    Navigator.of(context).pop();
  }

  //Criar a lógica para adicionar no carrigo de TopFilmes

  // melhoresFilmes(context, index) {
  //   repositorioDeFilmes.getItemLista().then((value) {
  //     final topFilmes = itens[index].titulo.isEmpty ||
  //             itens[index].titulo.isEmpty == itens[index].titulo.isEmpty &&
  //                 itens[7].notaDoUsuario <= 2
  //         ? 'Filme'
  //         : itens[1].titulo;
  //     return topFilmes;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Meus Filmes'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 16, right: 16),
                  child: TextField(
                    decoration: InputDecoration(labelText: 'Pesquisar: '),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: SizedBox(
                    height: 200,
                    width: 400,
                    child: Center(
                      // Adicionar os titulos dos 3 melhores filmes no carrossel
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: const [
                          CardDoCarrossel(
                              texto: 'Filme 1',
                              imagem: 'assets/image/filme_fundo2.jpg'),
                          CardDoCarrossel(
                              texto: 'Filme 2',
                              imagem: 'assets/image/filme_fundo2.jpg'),
                          CardDoCarrossel(
                              texto: 'filme 3',
                              imagem: 'assets/image/filme_fundo2.jpg'),
                        ],
                      ),
                    ),
                  ),
                ),
                const Divider(
                  color: Colors.blue,
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  height: 350,
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Colors.white),
                  child: ListView.builder(
                    itemCount: filmes.length,
                    itemBuilder: (context, index) {
                      return ItemDaListaFilme(
                        filme: filmes[index],
                        removerFilme: removerItem,
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Sua coleção possui ${filmes.length} filmes',
                        style: const TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                        ),
                      ),
                      FloatingActionButton(
                        backgroundColor: Colors.blue[100],
                        child: const Icon(Icons.add),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return PaginaAddFilme(
                                    aoSubimeter: adicionarItem);
                              },
                            ),
                          );
                        },
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

  void removerItem(Filme item) {
    itemDeletado = item;
    posicaoItem = filmes.indexOf(item);

    setState(() {
      filmes.remove(item);
      repositorioDeFilmes.salvarListaDeFilme(filmes);
    });

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Filme ${item.titulo} foi removido',
        ),
        action: SnackBarAction(
          label: 'Desfazer',
          onPressed: () {
            setState(() {
              filmes.insert(posicaoItem!, itemDeletado!);
            });
            repositorioDeFilmes.salvarListaDeFilme(filmes);
          },
        ),
        duration: const Duration(seconds: 5),
      ),
    );
  }
}
