import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'ai_generate_failure.freezed.dart';

@freezed
abstract class AiGenerateFailure with _$AiGenerateFailure {
  const factory AiGenerateFailure.cancelledByUser() = CancelledByUser;
  // Serves as a "catch all" failure if we don't know what exactly went wrong
  const factory AiGenerateFailure.serverError() = ServerError;
  // const factory AiGenerateFailure.emailAlreadyInUse() = EmailAlreadyInUse;
  const factory AiGenerateFailure.otherFailure(String failureMessage) =
      OtherFailure;
}
