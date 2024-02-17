import 'package:auto_route/auto_route.dart';
import 'package:book_ai/presentation/pages/wishlist/wishlist_screen.dart';
import 'package:book_ai/presentation/reusable_components/backgrounds/animatied_background.dart';
import 'package:flutter/material.dart';

@RoutePage()
class FullWishlistScreen extends StatelessWidget {
  const FullWishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor:
            Colors.transparent, // Set AppBar background to transparent
        elevation: 0, // Remove AppBar elevation

        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black,
                Color.fromARGB(209, 0, 0, 0),
                Colors.transparent
              ],
            ),
          ),
        ),
      ),
      body: const Stack(
        children: [
          AnimatedBackground(),
          WishlistScreen(),
        ],
      ),
    );
  }
}
