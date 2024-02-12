import 'package:book_ai/presentation/reusable_components/models/nav_item_model.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    final icon = bottomNavItems[2];
    return RiveAnimation.asset(
      icon.rive.src,
      stateMachines: [icon.rive.stateMachineName],
      artboard: icon.rive.artboard,
    );
  }
}
