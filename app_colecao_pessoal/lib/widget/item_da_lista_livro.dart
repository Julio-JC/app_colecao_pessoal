import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../page/pagina_conteudo_do_livro.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

import '../profile/models/livro.dart';

// ignore: must_be_immutable
class ItemDaListaLivro extends StatelessWidget {
  ItemDaListaLivro({
    super.key,
    required this.livro,
    required this.removerItemLivro,
  });

  Livro livro;
  DateTime data = DateTime.now();
  final Function(Livro) removerItemLivro;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) {
              return PaginaConteudoDoLivro(
                livro: livro,
                key: Key(livro.id),
              );
            },
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: Slidable(
          endActionPane: ActionPane(
            motion: const BehindMotion(),
            children: [
              SlidableAction(
                borderRadius: BorderRadius.circular(4),
                icon: Icons.delete,
                label: 'Apagar',
                backgroundColor: Colors.red[200] as Color,
                onPressed: (context) {
                  removerItemLivro(livro);
                },
              ),
            ],
          ),
          child: Card(
            color: Colors.grey[200],
            shadowColor: Colors.blue,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.book,
                          size: 30,
                        ),
                        const SizedBox(width: 20),
                        Text(
                          livro.titulo,
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    color: Colors.blue,
                  ),
                  // SizedBox(width: 100, child: ,)
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ChoiceChip(
                          label: Text(
                            livro.generoDoLivro,
                            style: const TextStyle(fontWeight: FontWeight.w700),
                          ),
                          selected: true,
                          selectedColor: Colors.blue[100],
                        ),
                        const SizedBox(width: 50),
                        const Icon(
                          Icons.star,
                          color: Colors.blue,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Text(
                              'Classificação ${livro.notaDoUsuario} estrelas'),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 100,
                  ),
                  Text(
                      'Adicionado em: ${DateFormat('dd/MM/yyyy').format(data)}'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
