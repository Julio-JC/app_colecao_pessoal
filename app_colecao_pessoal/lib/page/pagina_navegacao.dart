import 'package:app_colecao_pessoal/page/pagina_add_usuario.dart';
import 'package:app_colecao_pessoal/page/pagina_inicial.dart';
import 'package:app_colecao_pessoal/page/pagina_novo_usuario.dart';
import 'package:flutter/material.dart';

class PaginaNavegacao extends StatefulWidget {
  const PaginaNavegacao({
    super.key,
  });

  @override
  State<PaginaNavegacao> createState() => _PaginaNavegacaoState();
}

class _PaginaNavegacaoState extends State<PaginaNavegacao> {
  final List<Widget> pagina = [const PaginaInicial(), const PaginaAddUsuario()];
  int selecaoIdex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: selecaoIdex,
        children: pagina,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selecaoIdex,
        onTap: alterarGuia,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          )
        ],
      ),
    );
  }

  void alterarGuia(int index) {
    setState(() {
      selecaoIdex = index;
    });
  }
}
