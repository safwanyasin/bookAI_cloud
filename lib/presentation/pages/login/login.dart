import 'package:auto_route/auto_route.dart';
import 'package:book_ai/application/auth/login/login_cubit.dart';
import 'package:book_ai/injection.dart';
import 'package:book_ai/presentation/pages/login/widgets/login_form.dart';
import 'package:book_ai/presentation/reusable_components/backgrounds/animatied_background.dart';
import 'package:book_ai/presentation/reusable_components/logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      const AnimatedBackground(),
      Center(
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.only(left: 20.w, right: 20.w),
          height: MediaQuery.of(context).size.height,

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 100.h, child: const Logo()),
              SizedBox(height: 10.h,),
              Text(
                'Login to TaleTuner',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              SizedBox(height: 10.h),
              BlocProvider(
                create: (context) => getIt<LoginCubit>(),
                child: LoginForm(),
              )
            ],
          ),
        ),
      ),
    ]));
  }
}
