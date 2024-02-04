import 'package:flutter/material.dart';

class ContinueWithGoogleButton extends StatelessWidget {
  final VoidCallback onPressed;

  const ContinueWithGoogleButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(
          'assets/images/google-button.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
