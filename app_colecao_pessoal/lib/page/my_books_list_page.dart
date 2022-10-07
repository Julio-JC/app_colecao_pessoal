import 'package:flutter/material.dart';

class MyBooksListPage extends StatelessWidget {
  const MyBooksListPage({super.key});

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
