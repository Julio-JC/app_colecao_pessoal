import 'package:app_colecao_pessoal/widget/botao_de_texot.dart';
import 'package:flutter/material.dart';
import '../profile/models/usuario.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class CardDoUsuario extends StatelessWidget {
  CardDoUsuario({super.key, this.usuario});

  Usuario? usuario;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                margin: const EdgeInsets.only(top: 20, bottom: 20),
                height: 120,
                width: 120,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.amber,
                  image: DecorationImage(
                    image: AssetImage('assets/image/icone-do-perfil.jpg'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Nome: ',
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                    Text(
                      usuario!.nome,
                      style: const TextStyle(fontSize: 16),
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
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                    Text(
                      usuario!.generoFilmeFavorito,
                      style: const TextStyle(fontSize: 16),
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
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                    Text(
                      usuario!.generoLivroFavorito,
                      style: const TextStyle(fontSize: 16),
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
                      style: TextStyle(fontSize: 16),
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
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                    Text(
                      usuario!.autoFavorito,
                      style: const TextStyle(fontSize: 16),
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
                      tirulo: 'Voltar Pagina Inicial',
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
    );
  }
}
