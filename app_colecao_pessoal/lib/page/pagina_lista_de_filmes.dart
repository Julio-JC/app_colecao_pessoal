import 'dart:math';
import 'package:app_colecao_pessoal/page/pagina_add_filme.dart';
import 'package:app_colecao_pessoal/profile/repositorio/repositorio.dart';
import 'package:app_colecao_pessoal/widget/card_do_carrossel.dart';
import 'package:flutter/material.dart';
import '../profile/models/item.dart';
import '../widget/item_da_lista_filme.dart';

class PaginaListaDeFilmes extends StatefulWidget {
  PaginaListaDeFilmes({super.key, this.item});
  Item? item;
  @override
  State<PaginaListaDeFilmes> createState() => _MinhaListaDeFilmesState();
}

class _MinhaListaDeFilmesState extends State<PaginaListaDeFilmes> {
  final Repositorio repositorioDeFilmes = Repositorio();
  List<Item> itens = [];

  Item? itemDeletado;
  int? posicaoItem;

  @override
  void initState() {
    super.initState();

    repositorioDeFilmes.getItemLista().then((value) {
      setState(() {
        itens = value;
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
    final novoItem = Item(
      id: Random().nextDouble().toString(),
      titulo: filme,
      autorDiretor: diretor,
      anoDeLancamentoPublicacao: anoLancamento,
      produtoraEditora: produtora,
      sinopse: sinopse,
      generoDoItem: genero,
      notaDoUsuario: nota,
    );
    setState(() {
      itens.add(novoItem);
    });
    repositorioDeFilmes.salvarListaDeItem(itens);

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
                    itemCount: itens.length,
                    itemBuilder: (context, index) {
                      return ItemDaListaFilme(
                        item: itens[index],
                        removerItem: removerItem,
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
                        'Sua coleção possui ${itens.length} filmes',
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

  void removerItem(Item item) {
    itemDeletado = item;
    posicaoItem = itens.indexOf(item);

    setState(() {
      itens.remove(item);
      repositorioDeFilmes.salvarListaDeItem(itens);
    });

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Filme ${item.titulo} foi remosvido',
        ),
        action: SnackBarAction(
          label: 'Desfazer',
          onPressed: () {
            setState(() {
              itens.insert(posicaoItem!, itemDeletado!);
            });
            repositorioDeFilmes.salvarListaDeItem(itens);
          },
        ),
        duration: const Duration(seconds: 5),
      ),
    );
  }
}
