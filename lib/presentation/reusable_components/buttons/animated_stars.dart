import 'package:book_ai/presentation/reusable_components/models/nav_item_model.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

// ignore: must_be_immutable
class AnimatedStars extends StatefulWidget {
  bool active;

  AnimatedStars({super.key, required this.active});

  @override
  State<AnimatedStars> createState() => _AnimatedStarsState();
}

class _AnimatedStarsState extends State<AnimatedStars> {
  late RiveAnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        widget.active ? SimpleAnimation('active') : SimpleAnimation('inactive');
  }

  @override
  Widget build(BuildContext context) {
    return RiveAnimation.asset(
      bottomNavItems[0].rive.src,
      artboard: bottomNavItems[0].rive.artboard,
      // controllers: [_controller],
      fit: BoxFit.cover,
      onInit: (artboard) {
        artboard.addController(_controller);
      },
    );
  }
}
