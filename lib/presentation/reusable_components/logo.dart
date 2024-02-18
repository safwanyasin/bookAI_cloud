import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return const RiveAnimation.asset(
      "assets/animations/logo.riv",
      stateMachines: ["logo_state"],
      artboard: "logo",
    );
  }
}
