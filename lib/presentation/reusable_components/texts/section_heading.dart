import 'package:flutter/material.dart';

class SectionHeading extends StatelessWidget {
  const SectionHeading({Key? key, required this.content}) : super(key: key);

  final String content;
  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      style: Theme.of(context).textTheme.headlineMedium,
      overflow: TextOverflow.ellipsis,
    );
  }
}
