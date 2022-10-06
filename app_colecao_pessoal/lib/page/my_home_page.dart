import 'package:app_colecao_pessoal/button_home_page.dart';
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
      drawer: Drawer(child: Column()),
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
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                'assets/image/filme_fundo2.jpg',
              ),
              fit: BoxFit.cover),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonHomePage(
                icon: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.videocam_outlined,
                  ),
                ),
                image: 'assets/image/filme_botão2.jpg',
              ),
              ButtonHomePage(
                icon: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.book,
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
