import 'package:book_ai/domain/auth/value_objects.dart';
import 'package:book_ai/domain/core/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
abstract class AppUser with _$AppUser {
  const factory AppUser({
    required UniqueId id,
    required NickName nickname,
    required EmailAddress email,
  }) = _AppUser;
}
