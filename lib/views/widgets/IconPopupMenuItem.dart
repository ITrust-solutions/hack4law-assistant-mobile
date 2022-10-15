import 'package:flutter/material.dart';

enum Menu { itemOne, itemTwo, itemThree, itemFour }

class IconPopupMenuItem extends StatelessWidget {
  final Function function;
  final IconData icon;
  final String text;

  const IconPopupMenuItem({required this.function, required this.icon, required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        const SizedBox(
          width: 8.0,
        ),
        Text(text),
      ],
    );
  }
}