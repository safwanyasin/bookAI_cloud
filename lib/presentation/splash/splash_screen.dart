import 'package:auto_route/auto_route.dart';
import 'package:book_ai/application/auth/auth_cubit.dart';
import 'package:book_ai/presentation/reusable_components/backgrounds/animatied_background.dart';
import 'package:book_ai/presentation/routing/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        state.map(
          initial: (_) {},
          authenticated: (_) {
            print(state.toString());
            AutoRouter.of(context).replace(
              const NavRoute(),
            );
          },
          unauthenticated: (_) {
            AutoRouter.of(context).replace(
              const LoginRoute(),
            );
          },
        );
      },
      child: Scaffold(
        body: Stack(
          children: [
            const AnimatedBackground(),
            Center(
                child: Text(
              'Tale Tuner',
              style: Theme.of(context).textTheme.headlineLarge,
            )),
          ],
        ),
      ),
    );
  }
}
