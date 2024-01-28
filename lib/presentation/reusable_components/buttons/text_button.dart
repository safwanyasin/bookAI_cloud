import 'package:flutter/material.dart';

class PlainButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;

  const PlainButton({required this.onPressed, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        buttonText,
        style: TextStyle(
          color: Theme.of(context).focusColor,
          fontSize: 16.0,
        ),
      ),
    );
  }
}
