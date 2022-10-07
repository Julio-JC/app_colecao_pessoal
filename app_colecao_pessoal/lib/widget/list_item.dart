import 'package:flutter/material.dart';
import '../profile/models/item.dart';

// ignore: must_be_immutable
class ListItem extends StatelessWidget {
  ListItem({super.key, required this.item});

  Item item;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: Column(
        children: [
          item.icone,
          Text(
            item.titulo,
          ),
        ],
      ),
    );
  }
}
