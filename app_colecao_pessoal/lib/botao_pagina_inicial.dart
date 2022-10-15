import 'package:flutter/material.dart';

class BotaoPaginaInicial extends StatelessWidget {
  const BotaoPaginaInicial({
    super.key,
    required this.icon,
    required this.image,
  });

  final Widget? icon;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Container(
          margin: const EdgeInsets.all(10),
          height: 200,
          width: 180,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          height: 200,
          width: 180,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: const Color.fromARGB(129, 144, 202, 249),
          ),
        ),
        Container(
          height: 200,
          width: 180,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
          ),
          child: icon,
        ),
      ],
    );
  }
}
