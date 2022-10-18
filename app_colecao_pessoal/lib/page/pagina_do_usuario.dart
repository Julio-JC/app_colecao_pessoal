import 'package:app_colecao_pessoal/widget/botao_de_texot.dart';
import 'package:flutter/material.dart';
import '../profile/models/usuario.dart';
import 'package:intl/intl.dart';

class PaginaDoUsuario extends StatelessWidget {
  PaginaDoUsuario({super.key});

  Usuario? usuario;

  @override
  Widget build(BuildContext context) {
    Map data = ModalRoute.of(context)!.settings.arguments as Map;
    usuario!.nome = data['nome'];
    usuario!.dataNascimento = data['data'];
    usuario!.avatarUrl = data['avatar'];
    usuario!.generoFilmeFavorito = data['generoFilme'];
    usuario!.generoLivroFavorito = data['generoLivro'];
    usuario!.diretorFavorito = data['dietor'];
    usuario!.autoFavorito = data['autor'];
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Pagina do usuário'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 20, bottom: 20),
                    height: 150,
                    width: 150,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.amber,
                      image: DecorationImage(
                        image: AssetImage('assets/image/icone-do-perfil.jpg'),
                      ),
                    ),
                  ),
                  const Divider(
                    height: 30,
                    color: Colors.blue,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Nome: ',
                          style: TextStyle(fontSize: 20),
                        ),
                        const SizedBox(
                          width: 40,
                        ),
                        Text(
                          usuario!.nome,
                          style: const TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    height: 30,
                    color: Colors.blue,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Ano de lançamento: ',
                        style: TextStyle(fontSize: 16),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: SizedBox(
                          height: 20,
                          child: Text(
                            DateFormat('dd/MM/yyyy')
                                .format(usuario!.dataNascimento),
                            style: const TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Divider(
                    height: 30,
                    color: Colors.blue,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Genero filme favorito: ',
                          style: TextStyle(fontSize: 20),
                        ),
                        const SizedBox(
                          width: 40,
                        ),
                        Text(
                          usuario!.generoFilmeFavorito,
                          style: const TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    height: 30,
                    color: Colors.blue,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Genero livro favorito: ',
                          style: TextStyle(fontSize: 20),
                        ),
                        const SizedBox(
                          width: 40,
                        ),
                        Text(
                          usuario!.generoLivroFavorito,
                          style: const TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    height: 30,
                    color: Colors.blue,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Diretor favorito: ',
                          style: TextStyle(fontSize: 20),
                        ),
                        const SizedBox(
                          width: 40,
                        ),
                        Text(usuario!.diretorFavorito),
                      ],
                    ),
                  ),
                  const Divider(
                    height: 30,
                    color: Colors.blue,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Autor favorito: ',
                          style: TextStyle(fontSize: 20),
                        ),
                        const SizedBox(
                          width: 40,
                        ),
                        Text(
                          usuario!.autoFavorito,
                          style: const TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        BotaoDeTexto(
                          tirulo: 'Cadastrado',
                          aoPressionar: () {
                            Navigator.pushNamed(context, '/PaginaNavegacao');
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
