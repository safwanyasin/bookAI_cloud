import 'package:book_ai/domain/auth/email_verification/email_verification_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// import 'package:book_ai/application/auth/login/login_state.dart';
import 'package:book_ai/domain/auth/login/i_login_facade.dart';
import 'package:book_ai/domain/auth/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'email_verification_cubit.freezed.dart';
part 'email_verification_state.dart';

@injectable
class EmailVerificationCubit extends Cubit<EmailVerificationState> {
  late final ILoginFacade _loginFacade;

  EmailVerificationCubit(
    this._loginFacade,
  ) : super(EmailVerificationState.initial()) {
    _performVerification();
  }

  Future<void> verify() async {
    await _performVerification();
  }

  Future<void> checkIfVerified() async {
    final isVerified = await _loginFacade.checkIfVerified();
    print(isVerified);
    if (isVerified == true) {
      emit(state.copyWith(
        verificationFailureOrSuccessOption: some(right(unit)),
      ));
    } else {
      some(left(const EmailVerificationFailure.couldntVerify()));
    }
  }

  Future<void> _performVerification() async {
    emit(
      state.copyWith(
        isSending: true,
      ),
    );

    final verificationResult = await _loginFacade.sendEmailverification();
    verificationResult.fold(
      (failure) {
        failure.maybeMap(
          orElse: () => emit(
            state.copyWith(
              isSending: false,
              verificationFailureOrSuccessOption: some(
                left(
                  const EmailVerificationFailure.serverError(),
                ),
              ),
            ),
          ),
        );
      },
      (s) {
        emit(state.copyWith(
          isSending: false,
        ));
        checkIfVerified();
      },
    );

    // final email = state.otp;
    // emit(
    //   state.copyWith(
    //     isSubmitting: true,
    //   ),
    // );

    // final registerResult = withEmail
    //     ? await _loginFacade.registerWithEmailAndPassword(
    //         nickName: nickName,
    //         emailAddress: email,
    //         password: password,
    //         confirmPassword: confirmPassword)
    //     : await _loginFacade.registerWithGoogle();

    // if (registerResult.isLeft()) {
    //   return registerResult.fold((failure) {
    //     failure.maybeWhen(
    //         cancelledByUser: () => emit(
    //               state.copyWith(
    //                 isSubmitting: false,
    //                 registerFailureOrSuccessOption:
    //                     some(left(const RegisterFailure.cancelledByUser())),
    //               ),
    //             ),
    //         serverError: () => emit(
    //               state.copyWith(
    //                 isSubmitting: false,
    //                 registerFailureOrSuccessOption:
    //                     some(left(const RegisterFailure.serverError())),
    //               ),
    //             ),
    //         emailAlreadyInUse: () => emit(
    //               state.copyWith(
    //                 isSubmitting: false,
    //                 registerFailureOrSuccessOption:
    //                     some(left(const RegisterFailure.emailAlreadyInUse())),
    //               ),
    //             ),
    //         otherFailure: (m) => emit(
    //               state.copyWith(
    //                 isSubmitting: false,
    //                 registerFailureOrSuccessOption:
    //                     some(left(RegisterFailure.otherFailure(m))),
    //               ),
    //             ),
    //         orElse: () => print("some unknown error occurred"));
    //   }, (_) => {});
    // } else {
    //   emit(
    //     state.copyWith(
    //       isSubmitting: false,
    //       registerFailureOrSuccessOption: some(right(unit)),
    //     ),
    //   );
    // }

    // login successful
    // can build user session here
  }
}
