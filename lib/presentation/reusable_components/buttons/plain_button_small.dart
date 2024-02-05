import 'package:flutter/material.dart';

class PlainButtonSmall extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;

  const PlainButtonSmall({required this.onPressed, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Text(
        buttonText,
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    );
  }
}
