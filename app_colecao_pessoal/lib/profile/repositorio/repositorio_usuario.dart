import 'dart:convert';
import 'package:app_colecao_pessoal/profile/models/usuario.dart';
import 'package:shared_preferences/shared_preferences.dart';

const chaveUsuario = 'usuario_dados';

class RepositorioUsuario {
  late SharedPreferences sharedPreferences;

  void salvarUsuario(Usuario usuario) async {
    sharedPreferences = await SharedPreferences.getInstance();
    final String jsonString = json.encode(usuario);
    sharedPreferences.setString(chaveUsuario, jsonString);
  }

  Future<Usuario> getUsiario() async {
    sharedPreferences = await SharedPreferences.getInstance();
    String jsonUsuario = sharedPreferences.getString(chaveUsuario) ?? '';

    Map<String, dynamic> mapUsuario = json.decode(jsonUsuario);
    Usuario usuario = Usuario.fromJson(mapUsuario);
    return usuario;
  }
}
