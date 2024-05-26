import 'package:another_flushbar/flushbar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:book_ai/application/auth/auth_cubit.dart';
import 'package:book_ai/application/auth/register/register_cubit.dart';
import 'package:book_ai/presentation/reusable_components/buttons/continue_with_google.dart';
import 'package:book_ai/presentation/reusable_components/buttons/plain_button_small.dart';
import 'package:book_ai/presentation/reusable_components/buttons/primary_button.dart';
import 'package:book_ai/presentation/reusable_components/input/input_fields.dart';
import 'package:book_ai/presentation/routing/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class RegisterForm extends StatelessWidget {
  RegisterForm({super.key});
  bool withGoogle = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        state.registerFailureOrSuccessOption.fold(
          () {},
          (either) => either.fold(
            (failure) {
              Flushbar(
                messageText: failure.map(
                  cancelledByUser: (_) => Text('Operation cancelled',
                      style: Theme.of(context).textTheme.titleSmall),
                  serverError: (_) => Text('Server error',
                      style: Theme.of(context).textTheme.titleSmall),
                  emailAlreadyInUse: (_) => Text('This email is already in use',
                      style: Theme.of(context).textTheme.titleSmall),
                  otherFailure: (_) => Text('An unexpected error occurred!',
                      style: Theme.of(context).textTheme.titleSmall),
                ),
              ).show(context);
            },
            (_) {
              // print('hello');
              // navigate to another page
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
                labelText: 'Nickname',
                onChanged: (nickName) =>
                    context.read<RegisterCubit>().updateNickName(nickName),
                validator: (_) =>
                    context.read<RegisterCubit>().state.nickName.value.fold(
                          (f) => f.maybeMap(
                            empty: (_) => "Nickname cannot be empty",
                            shortLength: (_) {
                              return 'Nickname should have at least 3 characters';
                            },
                            invalidCharacters: (_) {
                              return 'Nickname can only contain alphabets';
                            },
                            orElse: () => null,
                          ),
                          (_) => null,
                        ),
              ),
              SizedBox(
                height: 10.h,
              ),
              InputField(
                // controller: TextEditingController(),
                showError: state.isSubmitting && !withGoogle,
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
                showError: state.isSubmitting && !withGoogle,
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
                showError: state.isSubmitting && !withGoogle,
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
                  withGoogle = false;
                  context.read<RegisterCubit>().register(true);
                  //AutoRouter.of(context).popAndPush(const NavRoute());
                },
                text: 'Sign Up',
              ),
              SizedBox(height: 15.h),
              // ContinueWithGoogleButton(
              //   onPressed: () {
              //     withGoogle = true;
              //     context.read<RegisterCubit>().register(false);
              //   },
              // ),
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
