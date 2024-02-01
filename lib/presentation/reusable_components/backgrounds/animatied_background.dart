import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class AnimatedBackground extends StatelessWidget {
  const AnimatedBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return const RiveAnimation.asset(
      'assets/animations/background.riv',
      fit: BoxFit.cover,
    );
  }
}
