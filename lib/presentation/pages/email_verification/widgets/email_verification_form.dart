import 'package:another_flushbar/flushbar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:book_ai/application/api_input/api_input_cubit.dart';
import 'package:book_ai/application/auth/auth_cubit.dart';
import 'package:book_ai/application/auth/email_verification/email_verification_cubit.dart';
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
class EmailVerificationForm extends StatelessWidget {
  EmailVerificationForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EmailVerificationCubit, EmailVerificationState>(
      listener: (context, state) {
        state.verificationFailureOrSuccessOption.fold(
          () {},
          (either) => either.fold(
            (failure) {
              Flushbar(
                messageText: failure.map(
                  cancelledByUser: (_) => Text(
                      'The operation was cancelled by the user',
                      style: Theme.of(context).textTheme.titleSmall),
                  serverError: (_) => Text('An unexpected error occurred',
                      style: Theme.of(context).textTheme.titleSmall),
                  couldntVerify: (_) => Text('Could not verify',
                      style: Theme.of(context).textTheme.titleSmall),
                  otherFailure: (_) => Text('An unexpected error occurred',
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
              AutoRouter.of(context).replace(const ApiInputRoute());
              context.read<AuthCubit>().authCheckRequested();
            },
          ),
        );
      },
      builder: (context, state) {
        return Form(
          child: Column(
            children: [
              SizedBox(height: 15.h),
              PrimaryButton(
                onPressed: () {
                  context.read<EmailVerificationCubit>().checkIfVerified();
                  // AutoRouter.of(context).popAndPush(const NavRoute());
                },
                text: 'Continue',
              ),

              SizedBox(height: 15.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Didn't receive the email? ",
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  // SizedBox(width: 2.w),
                  PlainButtonSmall(
                    onPressed: () async {},
                    buttonText: "Resend",
                  ),
                ],
              ),

              // Expanded(
              //   child: Container(),
              // ),

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
