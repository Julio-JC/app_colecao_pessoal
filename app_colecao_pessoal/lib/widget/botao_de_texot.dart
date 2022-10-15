import 'package:flutter/material.dart';

class BotaoDeTexto extends StatelessWidget {
  const BotaoDeTexto(
      {super.key, required this.tirulo, required this.aoPressionar});

  final String tirulo;
  final void Function() aoPressionar;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: aoPressionar,
      child: Text(
        tirulo,
        style: const TextStyle(fontSize: 20),
      ),
    );
  }
}
