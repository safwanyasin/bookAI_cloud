import 'package:another_flushbar/flushbar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:book_ai/application/auth/login/login_cubit.dart';
import 'package:book_ai/presentation/reusable_components/buttons/continue_with_google.dart';
import 'package:book_ai/presentation/reusable_components/buttons/plain_button_small.dart';
import 'package:book_ai/presentation/reusable_components/buttons/primary_button.dart';
import 'package:book_ai/presentation/reusable_components/input/input_fields.dart';
import 'package:book_ai/presentation/routing/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        state.loginFailureOrSuccessOption.fold(
          () {},
          (either) => either.fold(
            (failure) {
              Flushbar(
                message: failure.map(
                  cancelledByUser: (_) => 'Cancelled',
                  serverError: (_) => 'Server error',
                  invalidEmailAndPasswordCombination: (_) =>
                      'Email or password are incorrect!',
                  otherFailure: (_) => 'An unexpected error occurred',
                ),
              );
            },
            (_) {
              // navigate to another page
            },
          ),
        );
      },
      builder: (context, state) {
        return Form(
          child: Column(
            children: [
              InputField(
                // controller: TextEditingController(),
                showError: state.isSubmitting,
                labelText: 'Email',
                onChanged: (email) =>
                    context.read<LoginCubit>().updateEmail(email),
                validator: (_) =>
                    context.read<LoginCubit>().state.emailAddress.value.fold(
                          (f) => f.maybeMap(
                            invalidEmail: (_) {
                              return 'Invalid Email';
                            },
                            orElse: () => null,
                          ),
                          (_) => null,
                        ),
              ),
              SizedBox(height: 10.h),
              InputField(
                // controller: TextEditingController(),
                showError: state.isSubmitting,
                labelText: 'Password',
                obscureText: true,
                onChanged: (password) =>
                    context.read<LoginCubit>().updatePassword(password),
                validator: (_) =>
                    context.read<LoginCubit>().state.password.value.fold(
                        (f) => f.maybeMap(
                              shortPassword: (_) =>
                                  'Password should be at least 6 characters long!',
                              orElse: () => null,
                            ),
                        (_) => null),
              ),
              SizedBox(height: 15.h),
              PrimaryButton(
                onPressed: () {
                  context.read<LoginCubit>().login(true);
                  // AutoRouter.of(context).popAndPush(const NavRoute());
                },
                text: 'Login',
              ),
              SizedBox(height: 15.h),
              ContinueWithGoogleButton(
                onPressed: () {
                  context.read<LoginCubit>().login(false);
                },
              ),
              SizedBox(height: 15.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  SizedBox(width: 2.w),
                  PlainButtonSmall(
                      onPressed: () {
                        AutoRouter.of(context)
                            .popAndPush(const RegisterRoute());
                      },
                      buttonText: 'Sign Up')
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
