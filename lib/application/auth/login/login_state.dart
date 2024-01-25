// import 'package:book_ai/domain/auth/value_objects.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';

part of 'login_cubit.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    required EmailAddress emailAddress,
    required Password password,
    required bool showErrorMessages,
    required bool isSubmitting,
    required Option<Either<LoginFailure, Unit>> loginFailureOrSuccessOption,
    // can add a userdialog over here to show the error messages
  }) = _LoginState;

  const LoginState._();

  factory LoginState.initial() => LoginState(
        emailAddress: EmailAddress(''),
        password: Password(''),
        showErrorMessages: false,
        isSubmitting: false,
        loginFailureOrSuccessOption: none(),
      );
}
