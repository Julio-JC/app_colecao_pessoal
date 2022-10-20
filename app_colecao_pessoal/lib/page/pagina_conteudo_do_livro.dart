import 'package:app_colecao_pessoal/global/const.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
import '../profile/models/livro.dart';

class PaginaConteudoDoLivro extends StatelessWidget {
  const PaginaConteudoDoLivro({super.key, required this.livro});

  final Livro? livro;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          livro!.titulo,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(
                        Icons.book,
                        size: 45,
                      ),
                      Row(
                        children: List<Widget>.generate(
                          livro!.notaDoUsuario,
                          (index) => const Icon(
                            Icons.star,
                            color: kColorEstrela,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Titulo: ',
                        style: TextStyle(fontSize: 16),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: SizedBox(
                          height: 20,
                          child: Text(
                            livro!.titulo,
                            style: const TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Divider(
                    height: 30,
                    color: kCorDivider,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Autor: ',
                        style: TextStyle(fontSize: 16),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: SizedBox(
                          height: 20,
                          child: Text(
                            livro!.autor,
                            style: const TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Divider(
                    height: 30,
                    color: kCorDivider,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Produtora: ',
                        style: TextStyle(fontSize: 16),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: SizedBox(
                          height: 20,
                          child: Text(
                            livro!.editora,
                            style: const TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Divider(
                    height: 30,
                    color: kCorDivider,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Ano de Publicação: ',
                        style: TextStyle(fontSize: 16),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: SizedBox(
                          height: 20,
                          child: Text(
                            DateFormat('yyyy').format(livro!.anoDePublicacao),
                            style: const TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Divider(
                    height: 30,
                    color: kCorDivider,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Genero do livro: ',
                        style: TextStyle(fontSize: 16),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: SizedBox(
                          height: 20,
                          child: Text(
                            livro!.generoDoLivro,
                            style: const TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Divider(
                    height: 30,
                    color: kCorDivider,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Sinopse: ',
                        style: TextStyle(fontSize: 16),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 10, left: 10, right: 10),
                        child: Center(
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Colors.grey[100],
                            ),
                            height: 250,
                            width: 350,
                            child: Text(
                              maxLines: null,
                              livro!.sinopse,
                              style: const TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.edit,
                                size: 30,
                                color: kCorDivider,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
