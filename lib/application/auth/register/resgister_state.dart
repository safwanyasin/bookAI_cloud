// import 'package:book_ai/domain/auth/value_objects.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';

part of 'register_cubit.dart';

@freezed
class RegisterState with _$RegisterState {
  const factory RegisterState({
    required EmailAddress emailAddress,
    required Password password,
    required ConfirmPassword confirmPassword,
    required bool showErrorMessages,
    required bool isSubmitting,
    required Option<Either<RegisterFailure, Unit>>
        registerFailureOrSuccessOption,
    // can add a userdialog over here to show the error messages
  }) = _RegisterState;

  const RegisterState._();

  factory RegisterState.initial() => RegisterState(
        emailAddress: EmailAddress(''),
        password: Password(''),
        confirmPassword: ConfirmPassword('', ''),
        showErrorMessages: false,
        isSubmitting: false,
        registerFailureOrSuccessOption: none(),
      );
}
