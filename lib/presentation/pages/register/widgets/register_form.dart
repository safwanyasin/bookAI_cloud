import 'package:another_flushbar/flushbar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:book_ai/application/auth/register/register_cubit.dart';
import 'package:book_ai/presentation/reusable_components/buttons/continue_with_google.dart';
import 'package:book_ai/presentation/reusable_components/buttons/plain_button_small.dart';
import 'package:book_ai/presentation/reusable_components/buttons/primary_button.dart';
import 'package:book_ai/presentation/reusable_components/input/input_fields.dart';
import 'package:book_ai/presentation/routing/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        state.registerFailureOrSuccessOption.fold(
          () {},
          (either) => either.fold(
            (failure) {
              Flushbar(
                message: failure.map(
                  cancelledByUser: (_) => 'Cancelled',
                  serverError: (_) => 'Server error',
                  emailAlreadyInUse: (_) => 'This email is already in use',
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
                    context.read<RegisterCubit>().updateEmail(email),
                validator: (_) =>
                    context.read<RegisterCubit>().state.emailAddress.value.fold(
                          (f) => f.maybeMap(
                            invalidEmail: (_) {
                              return 'Invalid Email';
                            },
                            emailAlreadyInUse: (_) {
                              return 'Email already in use';
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
                    context.read<RegisterCubit>().updatePassword(password),
                validator: (_) =>
                    context.read<RegisterCubit>().state.password.value.fold(
                        (f) => f.maybeMap(
                              shortPassword: (_) =>
                                  'Password should be at least 6 characters long!',
                              noLowercase: (_) =>
                                  'Password should contain at least one lowercase letter',
                              noUppercase: (_) =>
                                  'Password should contain at least one uppercase letter',
                              noNumeric: (_) =>
                                  'Password should contain at least one numeric character',
                              noSpecialCharacter: (_) =>
                                  'Password should contain at least one special character',
                              orElse: () => null,
                            ),
                        (_) => null),
              ),
              SizedBox(height: 10.h),
              InputField(
                // controller: TextEditingController(),
                showError: state.isSubmitting,
                labelText: 'Confirm Password',
                obscureText: true,
                onChanged: (cPassword) => context
                    .read<RegisterCubit>()
                    .updateConfirmPassword(cPassword),
                validator: (_) => context
                    .read<RegisterCubit>()
                    .state
                    .confirmPassword
                    .value
                    .fold(
                        (f) => f.maybeMap(
                              passwordMismatch: (_) =>
                                  'The passwords do not match!',
                              orElse: () => null,
                            ),
                        (_) => null),
              ),
              SizedBox(height: 15.h),
              PrimaryButton(
                onPressed: () {
                  context.read<RegisterCubit>().register(true);
                  //AutoRouter.of(context).popAndPush(const NavRoute());
                },
                text: 'Sign Up',
              ),
              SizedBox(height: 15.h),
              ContinueWithGoogleButton(
                onPressed: () {
                  context.read<RegisterCubit>().register(false);
                },
              ),
              SizedBox(height: 15.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  SizedBox(width: 2.w),
                  PlainButtonSmall(
                    onPressed: () {
                      AutoRouter.of(context).popAndPush(const LoginRoute());
                    },
                    buttonText: 'Login',
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
