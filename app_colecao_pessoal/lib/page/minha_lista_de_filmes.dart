import 'dart:math';
import 'package:app_colecao_pessoal/page/add_move_page.dart';
import 'package:flutter/material.dart';
import '../profile/models/item.dart';
import '../widget/item_da_lista.dart';
import '../widget/tag_genero.dart';

class minhaListaDeFilmes extends StatefulWidget {
  const minhaListaDeFilmes({super.key});

  @override
  State<minhaListaDeFilmes> createState() => _minhaListaDeFilmesState();
}

class _minhaListaDeFilmesState extends State<minhaListaDeFilmes> {
  final List<Item> itens = [];

  adicionarItem(
    String filme,
    String diretor,
    DateTime anoLancamento,
    String produtora,
    String sinopse,
    TagGenero genero,
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
        notaDoUsuario: nota);
    setState(() {
      itens.add(novoItem);
    });

    Navigator.of(context).pop();
  }

  // abrirAdd(BuildContext constext){
  //   return AddMovePage(aoSubimeter: adicionarItem);
  // }

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
            const Expanded(
              child: SizedBox(
                height: 80,
                width: 200,
                child: Center(child: Text('Nome do Filme')),
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.white),
                child: ListView.builder(
                  itemCount: itens.length,
                  itemBuilder: (context, index) {
                    return ItemDaLista(
                      item: itens[index],
                    );
                  },
                ),
              ),
            ),
            FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return AddMovePage(aoSubimeter: adicionarItem);
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
