import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_input_failure.freezed.dart';

@freezed
abstract class ApiInputFailure with _$ApiInputFailure {
  const factory ApiInputFailure.unexpected() = _Unexpected;
  const factory ApiInputFailure.unableToUpdate() = _UnableToUpdate;
  const factory ApiInputFailure.insufficientPermissions() = _InsufficientPermissions;
}
