import 'package:flutter/material.dart';

class Subheading extends StatelessWidget {
  const Subheading({Key? key, required this.content}) : super(key: key);

  final String content;
  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      style: Theme.of(context).textTheme.bodyLarge,
    );
  }
}
