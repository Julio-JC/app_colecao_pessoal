import 'package:flutter/material.dart';

class CardDoCarrossel extends StatelessWidget {
  const CardDoCarrossel({Key? key, required this.texto, required this.imagem})
      : super(key: key);

  final String texto;
  final String imagem;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Opacity(
          opacity: 0.60,
          child: Container(
            margin: const EdgeInsets.all(10),
            height: 250,
            width: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                image: AssetImage(imagem),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 250,
          width: 300,
          child: Center(
              child: Text(
            texto,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
            maxLines: 3,
          )),
        )
      ],
    );
  }
}
