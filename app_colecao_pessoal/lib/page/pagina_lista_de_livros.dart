import 'dart:math';
import 'package:app_colecao_pessoal/page/pagina_add_livos.dart';
import 'package:app_colecao_pessoal/profile/repositorio/repositorio.dart';
import 'package:app_colecao_pessoal/profile/repositorio/repositorio_de_livros.dart';
import 'package:app_colecao_pessoal/widget/item_da_lista_livro.dart';
import 'package:flutter/material.dart';
import '../profile/models/livro.dart';
import '../widget/card_do_carrossel.dart';

class PaginaListaDeLivros extends StatefulWidget {
  const PaginaListaDeLivros({super.key, this.livro});
  final Livro? livro;
  @override
  State<PaginaListaDeLivros> createState() => _PaginaListaDeLivrosState();
}

class _PaginaListaDeLivrosState extends State<PaginaListaDeLivros> {
  final RepositorioDeLivros repositorioLivros = RepositorioDeLivros();
  List<Livro> livros = [];

  Livro? itemDeletadoL;
  int? posicaoItemL;

  @override
  void initState() {
    super.initState();
    repositorioLivros.getLivroLista().then((value) {
      setState(() {
        livros = value;
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
    final novoLivro = Livro(
      id: Random().nextDouble().toString(),
      titulo: livro,
      autor: autor,
      anoDePublicacao: anoPublicacao,
      editora: editora,
      sinopse: sinopseL,
      generoDoLivro: generoL,
      notaDoUsuario: notaL,
    );

    setState(() {
      livros.add(novoLivro);
    });

    repositorioLivros.salvarListaDeLivro(livros);

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
                  itemCount: livros.length,
                  itemBuilder: (context, index) {
                    return ItemDaListaLivro(
                      livro: livros[index],
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
                    livros.length <= 1
                        ? Text(
                            'Sua coleção possui ${livros.length} livro',
                            style: const TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                            ),
                          )
                        : Text(
                            'Sua coleção possui ${livros.length} livros',
                            style: const TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                            ),
                          ),
                    FloatingActionButton(
                      backgroundColor: Colors.blue[100],
                      child: const Icon(Icons.add),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return PaginaAddLivros(
                            aoSubimeter: adicionarItemLivro,
                          );
                        }));
                      },
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

  void removerItemLivro(Livro livro) {
    itemDeletadoL = livro;
    posicaoItemL = livros.indexOf(livro);

    setState(() {
      livros.remove(livro);
      repositorioLivros.salvarListaDeLivro(livros);
    });

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Livro ${livro.titulo} foi removido',
        ),
        action: SnackBarAction(
          label: 'Desfazer',
          onPressed: () {
            setState(() {
              livros.insert(posicaoItemL!, itemDeletadoL!);
            });
            repositorioLivros.salvarListaDeLivro(livros);
          },
        ),
        duration: const Duration(seconds: 5),
      ),
    );
  }
}
