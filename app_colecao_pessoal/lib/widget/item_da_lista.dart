import 'package:flutter/material.dart';
import '../profile/models/item.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class ItemDaLista extends StatelessWidget {
  ItemDaLista({super.key, required this.item});

  Item item;
  DateTime data = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        color: Colors.grey[200],
        shadowColor: Colors.blue,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.movie,
                    size: 30,
                  ),
                  const SizedBox(width: 20),
                  Text(
                    item.titulo,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              const Divider(
                color: Colors.blue,
              ),
              // SizedBox(width: 100, child: ,)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ChoiceChip(
                    label: Text(
                      item.generoDoItem,
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
                  Text('Classificação ${item.notaDoUsuario} estrelas'),
                ],
              ),
              const SizedBox(
                width: 100,
              ),
              Text('Adicionado em: ${DateFormat('dd/MM/yyyy').format(data)}'),
            ],
          ),
        ),
      ),
    );
  }
}
