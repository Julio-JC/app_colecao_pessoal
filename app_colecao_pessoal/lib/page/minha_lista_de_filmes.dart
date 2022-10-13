import 'dart:math';
import 'package:app_colecao_pessoal/page/pagina_add_filme.dart';
import 'package:app_colecao_pessoal/profile/repositorio/repositorio_de_filme.dart';
import 'package:flutter/material.dart';
import '../profile/models/item.dart';
import '../widget/item_da_lista.dart';

class MinhaListaDeFilmes extends StatefulWidget {
  const MinhaListaDeFilmes({super.key});

  @override
  State<MinhaListaDeFilmes> createState() => _MinhaListaDeFilmesState();
}

class _MinhaListaDeFilmesState extends State<MinhaListaDeFilmes> {
  final RepositorioDeFilmes repositorioDeFilmes = RepositorioDeFilmes();
  List<Item> itens = [];

  @override
  void initState() {
    super.initState();

    repositorioDeFilmes.getItemLista().then((value) {
      setState(() {
        itens = value;
      });
    });
  }

  adicionarItem(
    String filme,
    String diretor,
    DateTime anoLancamento,
    String produtora,
    String sinopse,
    String genero,
    int nota,
  ) {
    final novoItem = Item(
        id: Random().nextDouble().toString(),
        titulo: filme,
        autorDiretor: diretor,
        anoDeLancamentoPublicacao: anoLancamento,
        produtoraEditora: produtora,
        sinopse: sinopse,
        generoDoItem: genero,
        notaDoUsuario: nota);
    setState(() {
      itens.add(novoItem);
    });
    repositorioDeFilmes.salvarListaDeItem(itens);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Meus Filmes'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const Expanded(
              child: SizedBox(
                height: 80,
                width: 200,
                child: Center(child: Text('Nome do Filme')),
              ),
            ),
            const Divider(
              color: Colors.blue,
            ),
            Container(
              height: 400,
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.grey[100]),
              child: ListView.builder(
                itemCount: itens.length,
                itemBuilder: (context, index) {
                  return ItemDaLista(
                    item: itens[index],
                    removerItem: removerItem,
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: FloatingActionButton(
                backgroundColor: Colors.blue[100],
                child: const Icon(Icons.add),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return PaginaAddFilme(aoSubimeter: adicionarItem);
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void removerItem(Item item) {
    setState(() {
      itens.remove(item);
    });
  }
}
