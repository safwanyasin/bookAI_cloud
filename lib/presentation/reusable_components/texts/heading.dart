import 'package:flutter/material.dart';

class Heading extends StatelessWidget {
  final String content;
  const Heading({required this.content, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      style: Theme.of(context).textTheme.headlineLarge,
    );
  }
}
