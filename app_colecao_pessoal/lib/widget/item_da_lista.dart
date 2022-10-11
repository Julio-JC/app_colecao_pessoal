import 'package:flutter/material.dart';
import '../profile/models/item.dart';

// ignore: must_be_immutable
class ItemDaLista extends StatelessWidget {
  ItemDaLista({super.key, required this.item});

  Item item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        shadowColor: Colors.blue,
        child: Column(
          children: [
            Row(
              children: [
                const Icon(Icons.movie),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  item.titulo,
                ),
              ],
            ),
            Row(
              children: [
                ChoiceChip(
                  label: Text(item.generoDoItem.toString()),
                  selected: true,
                  selectedColor: Colors.blue,
                ),
                const Icon(
                  Icons.star,
                  color: Colors.blue,
                ),
                Text('Classificação ${item.notaDoUsuario} estrelas'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
