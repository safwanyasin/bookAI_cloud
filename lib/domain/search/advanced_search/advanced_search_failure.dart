import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'advanced_search_failure.freezed.dart';

@freezed
abstract class AdvancedSearchFailure with _$AdvancedSearchFailure {
  const factory AdvancedSearchFailure.unexpected() = Unexcpected;
  // Serves as a "catch all" failure if we don't know what exactly went wrong
  const factory AdvancedSearchFailure.unableToUpdate() = UnableToUpdate;
  // const factory AiGenerateFailure.emailAlreadyInUse() = EmailAlreadyInUse;
  const factory AdvancedSearchFailure.insufficientPermissions() =
      InsufficientPermissions;
  const factory AdvancedSearchFailure.otherFailure(String failureMessage) = OtherFailure;
}
