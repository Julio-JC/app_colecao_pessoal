//mudança de tema (estado)
import 'package:flutter/material.dart';

class AppController extends ChangeNotifier {
  static AppController instance = AppController();

  bool isDark = true;

  changeTheme() {
    isDark = !isDark;
    notifyListeners();
  }
}
