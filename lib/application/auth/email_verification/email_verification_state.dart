// // import 'package:book_ai/domain/auth/value_objects.dart';
// // import 'package:freezed_annotation/freezed_annotation.dart';

// part of 'email_verification_cubit.dart';

// @freezed
// class EmailVerificationState with _$EmailVerificationState {
//   const factory EmailVerificationState({
//     required bool isSending,
//     required Option<Either<EmailVerificationFailure, Unit>>
//         verificationFailureOrSuccessOption,
//     // can add a userdialog over here to show the error messages
//   }) = _EmailVerificationState;

//   const EmailVerificationState._();

//   factory EmailVerificationState.initial() => EmailVerificationState(
//         isSending: false,
//         verificationFailureOrSuccessOption: none(),
//       );
// }
