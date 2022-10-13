import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/item.dart';

const chaveItemLista = 'item_list';

class RepositorioDeFilmes {
  late SharedPreferences sharedPreferences;

  Future<List<Item>> getItemLista() async {
    sharedPreferences = await SharedPreferences.getInstance();
    final String jsonString =
        sharedPreferences.getString(chaveItemLista) ?? '[]';
    final List jsonDecode = json.decode(jsonString) as List;
    return jsonDecode.map((e) => Item.fromJson(e)).toList();
  }

  void salvarListaDeItem(List<Item> itens) {
    final String jsonString = json.encode(itens);
    sharedPreferences.setString(chaveItemLista, jsonString);
  }
}
