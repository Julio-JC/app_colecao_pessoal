// import 'dart:math';

// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';

// const String filmeTable = 'filmeTable';
// const String idColumn = 'idColumn';
// const String tituloColumn = 'tituloColumn';
// const String diretorColumn = 'diretorColumn';
// const String anoDeLancamentoColumn = 'anoDeLancamentoColumn';
// const String produtoraColumn = 'produtoraColumn';
// const String sinopseColumn = 'sinopseColumn';
// const String generoDoFilmeColumn = 'generoDoFilmeColumn';
// const String notaDoUsuarioColumn = 'notaDoUsuarioColumn';

// class FilmeHelper {
//   static final FilmeHelper _instance = FilmeHelper.internal();

//   factory FilmeHelper() => _instance;

//   FilmeHelper.internal();

//   late Database _db;

//   Future<Database> get db async {
//     // ignore: unnecessary_null_comparison
//     if (_db != null) {
//       return _db;
//     } else {
//       _db = await initDb();
//       return _db;
//     }
//   }

//   Future<Database> initDb() async {
//     final databasesPath = await getDatabasesPath();
//     final path = join(databasesPath, 'filmes.db');

//     return await openDatabase(path, version: 1,
//         onCreate: (Database db, int newerVersion) async {
//       await db.execute(
//           "CREATE TABLE $filmeTable ($idColumn INTEGER PRIMARY KEY, $tituloColumn TEXT, $diretorColumn TEXT,"
//           "$anoDeLancamentoColumn TEXT, $produtoraColumn TEXT, $sinopseColumn TEXT, $generoDoFilmeColumn TEXT,"
//           "$notaDoUsuarioColumn INTERAGE )");
//     });
//   }

//   Future<FilmeDb> saveFilme(FilmeDb filme) async {
//     Database dbFilme = await db;
//     filme.id =
//         await dbFilme.insert(filmeTable, filme.toMap() as Map<String, dynamic>);
//     return filme;
//   }

//   Future<FilmeDb> getFilme(int id) async {
//     Database dbFilme = await db;
//     List<Map> maps = await dbFilme.query(filmeTable,
//         columns: [
//           idColumn,
//           tituloColumn,
//           diretorColumn,
//           anoDeLancamentoColumn,
//           produtoraColumn,
//           sinopseColumn,
//           generoDoFilmeColumn,
//           notaDoUsuarioColumn
//         ],
//         where: "$idColumn = ?",
//         whereArgs: [id]);
//     // ignore: prefer_is_empty
//     if (maps.length > 0) {
//       return FilmeDb.fromMap(maps.first);
//     } else {
//       return FilmeDb();
//     }
//   }

//   Future<int> deleteFilme(int id) async {
//     Database dbFilme = await db;
//     return await dbFilme
//         .delete(filmeTable, where: "$idColumn = ?", whereArgs: [id]);
//   }

//   Future<int> updateFilme(FilmeDb filme) async {
//     Database dbFilme = await db;
//     return await dbFilme.update(
//         filmeTable, filme.toMap() as Map<String, dynamic>,
//         where: "$idColumn = ?", whereArgs: [filme.id]);
//   }

//   Future<List> getAllFilmes() async {
//     Database dbFilme = await db;
//     List listMap = await dbFilme.rawQuery("SELECT * FROM $filmeTable");
//     List<FilmeDb> listFilme = [];
//     for (Map m in listMap) {
//       listFilme.add(FilmeDb.fromMap(m));
//     }
//     return listFilme;
//   }

//   Future<int> getNumero() async {
//     Database dbFilme = await db;
//     return Sqflite.firstIntValue(
//         await dbFilme.rawQuery("SELECT COUNT(*) FROM $filmeTable"));
//   }

//   Future cluse() async {
//     Database dbFilme = await db;
//     dbFilme.close();
//   }
// }

// class FilmeDb {
//   late int id;
//   late String titulo;
//   late String diretor;
//   late DateTime anoDeLancamento;
//   late String produtora;
//   late String sinopse;
//   late String generoDoFilme;
//   late int notaDoUsuario;

//   FilmeDb();

//   FilmeDb.fromMap(Map map) {
//     id = map[idColumn];
//     titulo = map[tituloColumn];
//     diretor = map[diretorColumn];
//     anoDeLancamento = map[anoDeLancamentoColumn];
//     produtora = map[produtoraColumn];
//     sinopse = map[sinopseColumn];
//     generoDoFilme = map[generoDoFilmeColumn];
//     notaDoUsuario = map[notaDoUsuarioColumn];
//   }

//   Map toMap() {
//     Map<String, dynamic> map = {
//       tituloColumn: titulo,
//       diretorColumn: diretor,
//       anoDeLancamentoColumn: anoDeLancamento,
//       produtoraColumn: produtora,
//       sinopseColumn: sinopse,
//       generoDoFilmeColumn: generoDoFilme,
//       notaDoUsuarioColumn: notaDoUsuario
//     };
//     if (id != null) {
//       map[idColumn] = id;
//     }
//     return map;
//   }

//   @override
//   String toString() {
//     return 'FilmeDb(id: $id, titulo: $titulo, diretor $diretor, anoLancamento: $anoDeLancamento, produtora: $produtora, sinopse: $sinopse, generoDoFilme: $generoDoFilme, nota $notaDoUsuario)';
//   }
// }
