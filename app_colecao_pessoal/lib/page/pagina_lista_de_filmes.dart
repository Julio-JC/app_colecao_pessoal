import 'dart:math';
import 'package:app_colecao_pessoal/page/pagina_add_filme.dart';
import 'package:app_colecao_pessoal/profile/repositorio/repositorio_de_filme.dart';
import 'package:app_colecao_pessoal/widget/card_do_carrossel.dart';
import 'package:flutter/material.dart';
import '../profile/models/item.dart';
import '../widget/item_da_lista.dart';

class PaginaListaDeFilmes extends StatefulWidget {
  PaginaListaDeFilmes({super.key, this.item});
  Item? item;
  @override
  State<PaginaListaDeFilmes> createState() => _MinhaListaDeFilmesState();
}

class _MinhaListaDeFilmesState extends State<PaginaListaDeFilmes> {
  final RepositorioDeFilmes repositorioDeFilmes = RepositorioDeFilmes();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Meus Filmes'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              child: SizedBox(
                height: 90,
                width: 600,
                child: Center(
                  // Adicionar os titulos dos 3 melhores filmes no carrossel
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: const [
                      CardDoCarrossel(texto: 'Filme 1'),
                      CardDoCarrossel(texto: 'Filme 2'),
                      CardDoCarrossel(texto: 'filme 3'),
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
              height: 400,
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6), color: Colors.white),
              child: ListView.builder(
                itemCount: itens.length,
                itemBuilder: (context, index) {
                  return ItemDaLista(
                    item: itens[index],
                    removerItem: removerItem,
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Sua lista possui ${itens.length} filmes',
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
                            return PaginaAddFilme(aoSubimeter: adicionarItem);
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
