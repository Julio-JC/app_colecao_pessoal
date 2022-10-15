import 'package:flutter/material.dart';

class PaginaAddUsuario extends StatefulWidget {
  const PaginaAddUsuario({super.key});

  @override
  State<PaginaAddUsuario> createState() => _PaginaAddUsuarioState();
}

class _PaginaAddUsuarioState extends State<PaginaAddUsuario> {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController nascimentoController = TextEditingController();
  String? imagem;
  final TextEditingController generoFavController = TextEditingController();
  final TextEditingController diretorFavController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Pagina do Usuário'),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(children: [
                GestureDetector(
                  onTap: () {
                    print('Editar Imagem');
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 30, bottom: 30),
                    height: 150,
                    width: 150,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.amber,
                      image: DecorationImage(
                          image:
                              AssetImage('assets/image/icone-do-perfil.jpg')),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: TextField(
                    controller: nomeController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Nome',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: TextField(
                    controller: nascimentoController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Data de nascimento',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: TextField(
                    controller: generoFavController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Genero favorito',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: TextField(
                    controller: diretorFavController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Diretor favorito',
                    ),
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
