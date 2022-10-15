import 'package:flutter/material.dart';

class PaginaListaDeLivros extends StatelessWidget {
  const PaginaListaDeLivros({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Meus Livros'),
      ),
      body: Center(
        child: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {},
        ),
      ),
    );
  }
}
