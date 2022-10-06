import 'package:flutter/material.dart';

class MyMovesList extends StatelessWidget {
  const MyMovesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Meus Filmes'),
      ),
    );
  }
}
