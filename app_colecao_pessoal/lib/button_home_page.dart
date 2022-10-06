import 'package:flutter/material.dart';

class ButtonHomePage extends StatelessWidget {
  const ButtonHomePage({
    super.key,
    required this.icon,
    required this.image,
  });

  final Widget? icon;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.all(10),
          height: 200,
          width: 180,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
          ),
        ),
        Container(
          height: 200,
          width: 180,
          child: icon,
        ),
      ],
    );
  }
}
