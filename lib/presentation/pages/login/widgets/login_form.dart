import 'package:another_flushbar/flushbar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:book_ai/application/auth/auth_cubit.dart';
import 'package:book_ai/application/auth/login/login_cubit.dart';
import 'package:book_ai/presentation/reusable_components/buttons/continue_with_google.dart';
import 'package:book_ai/presentation/reusable_components/buttons/plain_button_small.dart';
import 'package:book_ai/presentation/reusable_components/buttons/primary_button.dart';
import 'package:book_ai/presentation/reusable_components/input/input_fields.dart';
import 'package:book_ai/presentation/routing/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class LoginForm extends StatelessWidget {
  LoginForm({super.key});
  bool withGoogle = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        state.loginFailureOrSuccessOption.fold(
          () {},
          (either) => either.fold(
            (failure) {
              Flushbar(
                messageText: failure.map(
                  cancelledByUser: (_) => Text('Operation cancelled',
                      style: Theme.of(context).textTheme.titleSmall),
                  serverError: (_) => Text('Server error',
                      style: Theme.of(context).textTheme.titleSmall),
                  invalidEmailAndPasswordCombination: (_) => Text(
                      'Email or password are incorrect!',
                      style: Theme.of(context).textTheme.titleSmall),
                  otherFailure: (_) => Text('An unexpected error occurred!',
                      style: Theme.of(context).textTheme.titleSmall),
                ),
                barBlur: 20,
                backgroundColor: Theme.of(context).disabledColor,
                duration: const Duration(seconds: 2),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.w),
                    topRight: Radius.circular(20.w)),
              ).show(context);
            },
            (_) {
              // navigate to another page
              // print('hello');
              AutoRouter.of(context).replace(const NavRoute());
              //context.read<AuthCubit>().authCheckRequested();
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
                showError: state.isSubmitting && !withGoogle,
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
                showError: state.isSubmitting && !withGoogle,
                labelText: 'Password',
                obscureText: true,
                onChanged: (password) =>
                    context.read<LoginCubit>().updatePassword(password),
                validator: (_) =>
                    context.read<LoginCubit>().state.password.value.fold(
                        (f) => f.maybeMap(
                              empty: (_) => 'Password cannot be empty!',
                              orElse: () => null,
                            ),
                        (_) => null),
              ),
              SizedBox(height: 15.h),
              PrimaryButton(
                onPressed: () {
                  withGoogle = false;
                  context.read<LoginCubit>().login(true);
                  // AutoRouter.of(context).popAndPush(const NavRoute());
                },
                text: 'Login',
              ),
              SizedBox(height: 15.h),
              // ContinueWithGoogleButton(
              //   onPressed: () {
              //     withGoogle = true;
              //     context.read<LoginCubit>().login(false);
              //   },
              // ),
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
              ),
              // if (state.isSubmitting) ...[
              //   SizedBox(height: 5.h),
              //   const LinearProgressIndicator(),
              // ]
            ],
          ),
        );
      },
    );
  }
}
