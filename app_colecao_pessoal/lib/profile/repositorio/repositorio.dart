import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/filme.dart';

const chaveFilmeLista = 'filme_list';
const chaveLivroLista = 'Livro_list';

class Repositorio {
  late SharedPreferences sharedPreferences;

  Future<List<Filme>> getFilmeLista() async {
    sharedPreferences = await SharedPreferences.getInstance();
    final String jsonString =
        sharedPreferences.getString(chaveFilmeLista) ?? '[]';
    final List jsonDecode = json.decode(jsonString) as List;
    return jsonDecode.map((e) => Filme.fromJson(e)).toList();
  }

  void salvarListaDeFilme(List<Filme> filmes) {
    final String jsonString = json.encode(filmes);
    sharedPreferences.setString(chaveFilmeLista, jsonString);
  }
}
