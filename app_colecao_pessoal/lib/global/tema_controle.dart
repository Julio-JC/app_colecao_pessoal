import 'package:flutter/material.dart';

class TemaController extends ChangeNotifier {
  static TemaController instancia = TemaController();

  bool temas = false;
  mudancaTema() {
    temas = !temas;
    notifyListeners();
  }
}
