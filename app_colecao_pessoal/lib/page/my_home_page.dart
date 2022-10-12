import 'package:app_colecao_pessoal/button_home_page.dart';
import 'package:app_colecao_pessoal/page/minha_lista_de_livros.dart';
import 'package:app_colecao_pessoal/page/minha_lista_de_filmes.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Minha Coleção'),
      ),
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      print('Catalogo de Filmes');
                    },
                    icon: const Icon(
                      Icons.local_movies,
                    ),
                  ),
                  const Text('Filmes'),
                ],
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      print('Catalogo de Livros');
                    },
                    icon: const Icon(
                      Icons.book,
                    ),
                  ),
                  const Text('Lovros'),
                ],
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.white),
            label: 'Perfil',
          )
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonHomePage(
                icon: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const MinhaListaDeFilmes();
                        },
                      ),
                    );
                    print('Catalogo de filmes');
                  },
                  icon: const Icon(
                    Icons.local_movies,
                    size: 100,
                  ),
                ),
                image: 'assets/image/filme_botão2.jpg',
              ),
              ButtonHomePage(
                icon: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const MinhaListaDeLivros();
                        },
                      ),
                    );
                    print('Catalogo de livro');
                  },
                  icon: const Icon(
                    Icons.book,
                    size: 100,
                  ),
                ),
                image: 'assets/image/livro_botao.jpg',
              ),
            ],
          ),
        ),
      ),
      extendBody: true,
    );
  }
}
