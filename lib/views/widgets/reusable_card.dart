import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final VoidCallback function;
  final Icon leadingIcon;
  final Icon trailingIcon;
  final String text;

  const ReusableCard({
    super.key,
    required this.function, required this.leadingIcon,
    required this.trailingIcon, required this.text
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        margin: const EdgeInsets.all(15.0),
        padding: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.grey[300]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                leadingIcon,
                const SizedBox(
                  width: 8.0,
                ),
                Text(text),
              ],
            ),
            trailingIcon,
          ],
        ),
      ),
    );
  }
}