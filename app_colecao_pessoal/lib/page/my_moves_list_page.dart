import 'package:app_colecao_pessoal/page/add_move_page.dart';
import 'package:flutter/material.dart';

class MyMovesListPage extends StatelessWidget {
  const MyMovesListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Meus Filmes'),
      ),
      body: Center(
        child: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return AddMovePage();
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
