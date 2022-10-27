import 'package:app_colecao_pessoal/profile/models/usuario.dart';
import 'package:flutter/material.dart';
import 'data.dart';

class ExibirUsuario extends StatelessWidget {
  const ExibirUsuario({super.key, this.usuario, this.aoPressionar});
  final Usuario? usuario;
  final Function()? aoPressionar;

  @override
  Widget build(BuildContext context) {
    final avatar = usuario!.avatarUrl == null || usuario!.avatarUrl!.isEmpty
        ? const CircleAvatar(child: Icon(Icons.person))
        : CircleAvatar(
            backgroundImage: NetworkImage(usuario!.avatarUrl!),
          );
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.50,
            width: double.infinity,
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 20, bottom: 20),
                  height: 70,
                  width: 70,
                  // decoration: BoxDecoration(
                  //   shape: BoxShape.circle,
                  //   color: Colors.amber,
                  //   image: DecorationImage(
                  //     image: AssetImage('assets/imageicone-do-perfil.jpg'),
                  //   ),
                  // ),
                  child: avatar,
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Nome: '),
                      const SizedBox(
                        width: 40,
                      ),
                      SizedBox(
                        child: usuario!.nomeUsuario != null
                            ? Text(usuario!.nomeUsuario!)
                            : const Text('Nome do usuário'),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // const Text('Data de nascimento: '),
                      // const SizedBox(
                      //   width: 40,
                      // ),
                      // Text('Data '),
                      Data(
                        titulo: 'Data de Nascimento: ',
                        dateTime: usuario!.dataNascimento! as DateTime,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Genero filme favorito: '),
                      const SizedBox(
                        width: 40,
                      ),
                      SizedBox(
                        child: usuario!.generoFilmeFavorito != null
                            ? Text(usuario!.generoFilmeFavorito!)
                            : const Text('Genero de filme favorito'),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Genero livro favorito: '),
                      const SizedBox(
                        width: 40,
                      ),
                      SizedBox(
                        child: usuario!.generoLivroFavorito != null
                            ? Text(usuario!.generoLivroFavorito!)
                            : const Text('Genero livro favorito'),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Diretor favorito: '),
                      const SizedBox(
                        width: 40,
                      ),
                      SizedBox(
                        child: usuario!.diretorFavorito != null
                            ? Text(usuario!.diretorFavorito!)
                            : const Text('Diretor Favorito'),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Autor favorito: '),
                      const SizedBox(
                        width: 40,
                      ),
                      SizedBox(
                        child: usuario!.autorFavorito != null
                            ? Text(usuario!.autorFavorito!)
                            : const Text('Autor Favorito'),
                      ),
                    ],
                  ),
                ),
                // SizedBox(
                //   height: 10,
                //   child: BotaoDeTexto(
                //       tirulo: 'Editar',
                //       aoPressionar: () {
                //         Navigator.push(context,
                //             MaterialPageRoute(builder: (context) {
                //           return PaginaAddUsuario();
                //         }));
                //       }),
                // )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
