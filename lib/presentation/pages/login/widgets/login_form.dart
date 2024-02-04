import 'dart:ffi';

import 'package:book_ai/application/auth/login/login_cubit.dart';
import 'package:book_ai/domain/auth/value_objects.dart';
import 'package:book_ai/presentation/reusable_components/buttons/continue_with_google.dart';
import 'package:book_ai/presentation/reusable_components/buttons/plain_button.dart';
import 'package:book_ai/presentation/reusable_components/buttons/primary_button.dart';
import 'package:book_ai/presentation/reusable_components/input/input_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Form(
          child: ListView(
            children: [
              InputField(
                controller: TextEditingController(),
                hintText: 'someone@example.com',
                labelText: 'Email',
                onChanged: (email) =>
                    context.read<LoginCubit>().updateEmail(email),
                validator: (_) =>
                    context.read<LoginCubit>().state.emailAddress.value.fold(
                        (f) => f.maybeMap(
                              invalidEmail: (_) => 'Invalid Email',
                              orElse: () => null,
                            ),
                        (_) => null),
              ),
              SizedBox(height: 15.h),
              InputField(
                controller: TextEditingController(),
                hintText: '',
                labelText: 'Password',
                obscureText: true,
                onChanged: (password) =>
                    context.read<LoginCubit>().updateEmail(password),
                validator: (_) =>
                    context.read<LoginCubit>().state.password.value.fold(
                        (f) => f.maybeMap(
                              shortPassword: (_) =>
                                  'Passowrd should be at least 6 characters long!',
                              orElse: () => null,
                            ),
                        (_) => null),
              ),
              SizedBox(height: 15.h),
              PrimaryButton(
                onPressed: () {
                  context.read<LoginCubit>().login(true);
                },
                text: 'Login',
              ),
              ContinueWithGoogleButton(
                onPressed: () {
                  context.read<LoginCubit>().login(false);
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Don't have an account?",
                      style: Theme.of(context).textTheme.bodyLarge),
                  PlainButton(onPressed: () {}, buttonText: 'Sign Up')
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
