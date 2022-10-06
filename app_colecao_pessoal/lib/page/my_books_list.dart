import 'package:flutter/material.dart';

class MyBooksList extends StatelessWidget {
  const MyBooksList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Meus Livros'),
      ),
    );
  }
}
