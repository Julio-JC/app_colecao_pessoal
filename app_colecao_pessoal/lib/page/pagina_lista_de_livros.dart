import 'dart:math';
import 'package:app_colecao_pessoal/profile/repositorio/repositorio.dart';
import 'package:app_colecao_pessoal/widget/item_da_lista_livro.dart';
import 'package:flutter/material.dart';

import '../profile/models/item.dart';
import '../widget/card_do_carrossel.dart';

class PaginaListaDeLivros extends StatefulWidget {
  PaginaListaDeLivros({super.key, this.itemLivro});
  Item? itemLivro;
  @override
  State<PaginaListaDeLivros> createState() => _PaginaListaDeLivrosState();
}

class _PaginaListaDeLivrosState extends State<PaginaListaDeLivros> {
  final Repositorio repositorioLivros = Repositorio();
  List<Item> itensL = [];

  Item? itemDeletadoL;
  int? posicaoItemL;

  @override
  void initState() {
    super.initState();
    repositorioLivros.getItemLista().then((value) {
      setState(() {
        itensL = value;
      });
    });
  }

  adicionarItemLivro(
    String livro,
    String autor,
    DateTime anoPublicacao,
    String editora,
    String sinopseL,
    String generoL,
    int notaL,
  ) {
    final novoitemLivro = Item(
      id: Random().nextDouble().toString(),
      titulo: livro,
      autorDiretor: autor,
      anoDeLancamentoPublicacao: anoPublicacao,
      produtoraEditora: editora,
      sinopse: sinopseL,
      generoDoItem: generoL,
      notaDoUsuario: notaL,
    );

    setState(() {
      itensL.add(novoitemLivro);
    });

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Meus Livros'),
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
                            texto: 'Livro 1',
                            imagem: 'assets/image/livros_fundo.jpg'),
                        CardDoCarrossel(
                            texto: 'Livro 2',
                            imagem: 'assets/image/livros_fundo.jpg'),
                        CardDoCarrossel(
                            texto: 'Livro 3',
                            imagem: 'assets/image/livros_fundo.jpg'),
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
                  itemCount: itensL.length,
                  itemBuilder: (context, index) {
                    return ItemDaListaLivro(
                      itemLivro: itensL[index],
                      removerItemLivro: removerItemLivro,
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
                      'Sua coleção possui ${itensL.length} filmes',
                      style: const TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                      ),
                    ),
                    FloatingActionButton(
                      backgroundColor: Colors.blue[100],
                      child: const Icon(Icons.add),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void removerItemLivro(Item item) {
    itemDeletadoL = item;
    posicaoItemL = itensL.indexOf(item);

    setState(() {
      itensL.remove(item);
      repositorioLivros.salvarListaDeItem(itensL);
    });

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Livro ${item.titulo} foi remosvido',
        ),
        action: SnackBarAction(
          label: 'Desfazer',
          onPressed: () {
            setState(() {
              itensL.insert(posicaoItemL!, itemDeletadoL!);
            });
            repositorioLivros.salvarListaDeItem(itensL);
          },
        ),
        duration: const Duration(seconds: 5),
      ),
    );
  }
}
