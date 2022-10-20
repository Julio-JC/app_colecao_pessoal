import 'package:flutter/material.dart';
import '../global/const.dart';
import '../profile/models/filme.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class PaginaConteudoDoFilme extends StatelessWidget {
  PaginaConteudoDoFilme({super.key, this.filme});

  Filme? filme;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(filme!.titulo),
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
                        Icons.movie,
                        size: 45,
                      ),
                      Row(
                        children: List<Widget>.generate(
                          filme!.notaDoUsuario,
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
                            filme!.titulo,
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
                        'Doretor: ',
                        style: TextStyle(fontSize: 16),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: SizedBox(
                          height: 20,
                          child: Text(
                            filme!.diretor,
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
                            filme!.produtora,
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
                        'Ano de lançamento: ',
                        style: TextStyle(fontSize: 16),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: SizedBox(
                          height: 20,
                          child: Text(
                            DateFormat('yyyy').format(filme!.anoDeLancamento),
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
                        'Genero do filme: ',
                        style: TextStyle(fontSize: 16),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: SizedBox(
                          height: 20,
                          child: Text(
                            filme!.generoDoFilme,
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
                              filme!.sinopse,
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
