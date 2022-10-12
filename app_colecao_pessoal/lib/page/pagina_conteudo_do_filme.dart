import 'package:flutter/material.dart';
import '../profile/models/item.dart';

class PaginaConteudoDoFilme extends StatelessWidget {
  PaginaConteudoDoFilme({super.key, this.item});

  Item? item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(item!.titulo),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(10),
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
                        item!.notaDoUsuario,
                        (index) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Titulo: '),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: SizedBox(
                        height: 20,
                        child: Text(
                          item!.titulo,
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ],
                ),
                const Divider(
                  height: 30,
                  color: Colors.blue,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Doretor: '),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: SizedBox(
                        height: 20,
                        child: Text(
                          item!.autorDiretor,
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ],
                ),
                const Divider(
                  height: 30,
                  color: Colors.blue,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Produtora: '),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: SizedBox(
                        height: 20,
                        child: Text(
                          item!.produtoraEditora,
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ],
                ),
                const Divider(
                  height: 30,
                  color: Colors.blue,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Ano de lançamento: '),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: SizedBox(
                        height: 20,
                        child: Text(
                          '${item!.anoDeLancamentoPublicacao}',
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ],
                ),
                const Divider(
                  height: 30,
                  color: Colors.blue,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Genero do filme: '),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: SizedBox(
                        height: 20,
                        child: Text(
                          item!.generoDoItem,
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ],
                ),
                const Divider(
                  height: 30,
                  color: Colors.blue,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Sinopse: '),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Center(
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: Colors.grey[100],
                          ),
                          height: 200,
                          width: 350,
                          child: Text(
                            maxLines: null,
                            item!.sinopse,
                            style: const TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
