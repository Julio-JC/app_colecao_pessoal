import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'meu_app.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MeuApp());
}
