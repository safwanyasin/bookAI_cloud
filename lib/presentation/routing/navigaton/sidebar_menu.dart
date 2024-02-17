import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:book_ai/application/auth/auth_cubit.dart';
import 'package:book_ai/presentation/routing/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SidebarMenu extends StatelessWidget {
  const SidebarMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        state.maybeMap(
            unauthenticated: (_) => AutoRouter.of(context).popAndPush(
                  const LoginRoute(),
                ),
            orElse: () {});
      },
      child: Drawer(
        backgroundColor: const Color.fromARGB(120, 0, 0, 0),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            color: Theme.of(context).disabledColor,
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 20.w, left: 10.w, bottom:20.w),
                    child:  Text(
                      'TaleTuner',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  ),
                  const Divider(
                    color: Colors.white,
                  ),
                  // Add your menu items here
                  Expanded(
                    child: Column(
                      children: [
                        MenuItem(
                          title: 'About',
                          onPressed: () {AutoRouter.of(context).push(const AboutRoute());},
                        ),
                        MenuItem(
                          title: 'Privacy Policy',
                          onPressed: () { AutoRouter.of(context).push(const PrivacyPolicyRoute());},
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    color: Colors.white,
                  ),
                  // BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
                  //   return MenuItem(
                  //     title: 'Sign Out',
                  //     onPressed: () {
                  //       return context.read<AuthCubit>().signedOut();
                  //     },
                  //   );
                  // })
                  MenuItem(
                    title: 'Sign Out',
                    onPressed: () {
                      context.read<AuthCubit>().signedOut();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  const MenuItem({super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: Theme.of(context).textTheme.headlineMedium,
      ),
      onTap: () {
        // Handle menu item click
        onPressed();
        Navigator.pop(context); // Close the sidebar menu
        // Add logic based on the selected menu item
      },
    );
  }
}
