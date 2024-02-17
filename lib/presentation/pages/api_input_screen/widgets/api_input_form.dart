import 'package:another_flushbar/flushbar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:book_ai/application/api_input/api_input_cubit.dart';
import 'package:book_ai/application/auth/auth_cubit.dart';
import 'package:book_ai/presentation/reusable_components/buttons/filter_button.dart';
import 'package:book_ai/presentation/reusable_components/buttons/plain_button_small.dart';
import 'package:book_ai/presentation/reusable_components/buttons/primary_button.dart';
import 'package:book_ai/presentation/reusable_components/input/input_fields.dart';
import 'package:book_ai/presentation/routing/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class ApiInputForm extends StatelessWidget {
  ApiInputForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ApiInputCubit, ApiInputState>(
      listener: (context, state) {
        state.submitFailureOrSuccessOption.fold(
          () {},
          (either) => either.fold(
            (failure) {
              Flushbar(
                messageText: failure.map(
                  unexpected: (_) => Text('An unexpected error occurred',
                      style: Theme.of(context).textTheme.titleSmall),
                  unableToUpdate: (_) => Text('Unable to add API key',
                      style: Theme.of(context).textTheme.titleSmall),
                  insufficientPermissions: (_) => Text(
                      'You do not have permissions to perform this action',
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
              print('hello');
              AutoRouter.of(context).replace(const NavRoute());
              context.read<AuthCubit>().authCheckRequested();
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
                labelText: '',
                onChanged: (apikey) =>
                    context.read<ApiInputCubit>().updateApi(apikey),
                validator: (_) =>
                    context.read<ApiInputCubit>().state.apiKey.value.fold(
                          (f) => f.maybeMap(
                            empty: (_) {
                              return 'API Key cannot be empty';
                            },
                            incorrectLength: (_) {
                              print('invalid character');
                              return 'Your API key should be 51 characters long';
                            },
                            orElse: () => null,
                          ),
                          (_) => null,
                        ),
              ),

              SizedBox(height: 15.h),
              PrimaryButton(
                onPressed: () {
                  context.read<ApiInputCubit>().addApi(false);
                  // AutoRouter.of(context).popAndPush(const NavRoute());
                },
                text: 'Continue',
              ),

              SizedBox(height: 15.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an OpenAI API key? Here's ",
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  // SizedBox(width: 2.w),
                  PlainButtonSmall(
                    onPressed: () async {
                      const url =
                          'https://ai.google.dev/tutorials/setup'; // Replace with your URL
                      Uri uri = Uri.parse(url);
                      try {
                        await launchUrl(uri);
                      } catch (e) {
                        throw 'Could not launch $url';
                      }
                    },
                    buttonText: "how ",
                  ),
                  SizedBox(width: 2.w),
                  Text(
                    "to get one",
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              FilterButton(
                text: 'Add later',
                active: false,
                onPressed: () {
                  context.read<ApiInputCubit>().addApi(true);
                },
              ),
              // Expanded(
              //   child: Container(),
              // ),
              Text(
                  "Note: Your API key would be stored in your device's local storage for privacy purposes",
                  style: Theme.of(context).textTheme.labelSmall),
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
