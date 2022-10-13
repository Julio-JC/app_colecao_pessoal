// import 'dart:async';
// import 'dart:io';
// import '../models/item.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:sqflite/sqflite.dart';

// class AjudaDoBancoDeDados {
//   static AjudaDoBancoDeDados? _ajudaDoBancoDeDados;
//   static Database? _database;

//   String itemTabela = 'item';
//   String colunaId = 'id';
//   String colunaTitulo = 'titulo';
//   String colunaAutorDiretor = 'autorDiretor';
//   String colunaAnoDeLancamentoPublicacao = 'anoDeLancamentoPublicacao';
//   String colunaProdutoraEditora = 'produtoraEditora';
//   String colunaSinopse = 'sinopse';
//   String colunaGeneroDoItem = 'generoDoItem';
//   String colunaNotaDoUsuario = 'notaDoUsuario';

//   AjudaDoBancoDeDados._criarInstancia();

//   factory AjudaDoBancoDeDados() {
//     // ignore: prefer_conditional_assignment
//     if (_ajudaDoBancoDeDados == null) {
//       _ajudaDoBancoDeDados = AjudaDoBancoDeDados._criarInstancia();
//     }
//     return _ajudaDoBancoDeDados!;
//   }

//   Future<Database> get database async {
//     // ignore: prefer_conditional_assignment
//     if (_database == null) {
//       _database = await inicializarDatabase();
//     }
//     return _database!;
//   }

//   Future<Database> inicializarDatabase() async {
//     Directory directory = await getApplicationDocumentsDirectory();
//     // ignore: prefer_interpolation_to_compose_strings
//     String path = directory.path + 'itemDB.db';

//     var itensDatabase =
//         await openDatabase(path, version: 1, onCreate: _criarDb);
//     return itensDatabase;
//   }

//   void _criarDb(Database db, int novaVersao) async {
//     await db.execute(
//         'CREATE TABEL $itemTabela($colunaId INTEGER PRIMARY KEY AUTOINCREMENT,'
//         '$colunaTitulo TEXT,'
//         '$colunaAutorDiretor TEXT, '
//         '$colunaAnoDeLancamentoPublicacao TEXT, '
//         '$colunaProdutoraEditora TEXT, '
//         '$colunaSinopse TEXT,'
//         '$colunaGeneroDoItem TEXT, '
//         '$colunaNotaDoUsuario INTEGER ) ');
//   }

//   Future<int> insertItem(Item item) async {
//     Database db = await database;

//     var resultado = await db.insert(itemTabela, item.toMap());

//     return resultado;
//   }

//   Future<Item?> getItem(int id) async {
//     Database db = await database;

//     List<Map> maps = await db.query(itemTabela,
//         columns: [
//           colunaId,
//           colunaTitulo,
//           colunaAutorDiretor,
//           colunaAnoDeLancamentoPublicacao,
//           colunaProdutoraEditora,
//           colunaSinopse,
//           colunaGeneroDoItem,
//           colunaNotaDoUsuario,
//         ],
//         where: "$colunaId = ?",
//         whereArgs: [id]);

//     if (maps.isNotEmpty) {
//       return Item.fromMap(maps.first as Map<String, dynamic>);
//     } else {
//       return null;
//     }
//   }

//   Future<List<Item>> getItens() async {
//     Database db = await database;

//     var resultado = await db.query(itemTabela);

//     List<Item> lista = resultado.isNotEmpty
//         ? resultado.map((c) => Item.fromMap(c)).toList()
//         : [];

//     return lista;
//   }

//   Future<int> updateItem(Item item) async {
//     var db = await database;

//     var resultado = await db.update(
//       itemTabela,
//       item.toMap(),
//       where: '$colunaId = ?',
//       whereArgs: [item.id],
//     );

//     return resultado;
//   }

//   Future<int> deleteItem(int id) async {
//     var db = await database;

//     int resultado = await db.delete(
//       itemTabela,
//       where: '$colunaId = ?',
//       whereArgs: [id],
//     );
//     return resultado;
//   }

//   Future<int> getQuantidade() async {
//     Database db = await database;

//     List<Map<String, dynamic>> x =
//         await db.rawQuery('SELECT COUNT (*) from $itemTabela');

//     int? resultado = Sqflite.firstIntValue(x);
//     return resultado!;
//   }

//   Future close() async {
//     Database db = await database;
//     db.close();
//   }
// }
