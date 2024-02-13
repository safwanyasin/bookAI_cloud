// import 'package:book_ai/domain/auth/value_objects.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';

part of 'api_input_cubit.dart';

@freezed
class ApiInputState with _$ApiInputState {
  const factory ApiInputState({
    required ApiInput apiKey,
    required bool isSubmitting,
    required Option<Either<ApiInputFailure, Unit>> submitFailureOrSuccessOption,
    // can add a userdialog over here to show the error messages
  }) = _ApiInputState;

  const ApiInputState._();

  factory ApiInputState.initial() => ApiInputState(
        apiKey: ApiInput(''),
        isSubmitting: false,
        submitFailureOrSuccessOption: none(),
      );
}
