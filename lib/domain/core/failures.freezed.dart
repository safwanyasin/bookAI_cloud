// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'failures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ValueFailure<T> {
  T get failedValue => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T failedValue) invalidEmail,
    required TResult Function(T failedValue) emailAlreadyInUse,
    required TResult Function(T failedValue) shortPassword,
    required TResult Function(T failedValue) noUppercase,
    required TResult Function(T failedValue) noLowercase,
    required TResult Function(T failedValue) noNumeric,
    required TResult Function(T failedValue) noSpecialCharacter,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T failedValue)? invalidEmail,
    TResult? Function(T failedValue)? emailAlreadyInUse,
    TResult? Function(T failedValue)? shortPassword,
    TResult? Function(T failedValue)? noUppercase,
    TResult? Function(T failedValue)? noLowercase,
    TResult? Function(T failedValue)? noNumeric,
    TResult? Function(T failedValue)? noSpecialCharacter,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T failedValue)? invalidEmail,
    TResult Function(T failedValue)? emailAlreadyInUse,
    TResult Function(T failedValue)? shortPassword,
    TResult Function(T failedValue)? noUppercase,
    TResult Function(T failedValue)? noLowercase,
    TResult Function(T failedValue)? noNumeric,
    TResult Function(T failedValue)? noSpecialCharacter,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidEmail<T> value) invalidEmail,
    required TResult Function(EmailAlreadyInUse<T> value) emailAlreadyInUse,
    required TResult Function(ShortPassword<T> value) shortPassword,
    required TResult Function(NoUppercase<T> value) noUppercase,
    required TResult Function(NoLowercase<T> value) noLowercase,
    required TResult Function(NoNumeric<T> value) noNumeric,
    required TResult Function(NoSpecialCharacter<T> value) noSpecialCharacter,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InvalidEmail<T> value)? invalidEmail,
    TResult? Function(EmailAlreadyInUse<T> value)? emailAlreadyInUse,
    TResult? Function(ShortPassword<T> value)? shortPassword,
    TResult? Function(NoUppercase<T> value)? noUppercase,
    TResult? Function(NoLowercase<T> value)? noLowercase,
    TResult? Function(NoNumeric<T> value)? noNumeric,
    TResult? Function(NoSpecialCharacter<T> value)? noSpecialCharacter,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidEmail<T> value)? invalidEmail,
    TResult Function(EmailAlreadyInUse<T> value)? emailAlreadyInUse,
    TResult Function(ShortPassword<T> value)? shortPassword,
    TResult Function(NoUppercase<T> value)? noUppercase,
    TResult Function(NoLowercase<T> value)? noLowercase,
    TResult Function(NoNumeric<T> value)? noNumeric,
    TResult Function(NoSpecialCharacter<T> value)? noSpecialCharacter,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ValueFailureCopyWith<T, ValueFailure<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ValueFailureCopyWith<T, $Res> {
  factory $ValueFailureCopyWith(
          ValueFailure<T> value, $Res Function(ValueFailure<T>) then) =
      _$ValueFailureCopyWithImpl<T, $Res, ValueFailure<T>>;
  @useResult
  $Res call({T failedValue});
}

/// @nodoc
class _$ValueFailureCopyWithImpl<T, $Res, $Val extends ValueFailure<T>>
    implements $ValueFailureCopyWith<T, $Res> {
  _$ValueFailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failedValue = freezed,
  }) {
    return _then(_value.copyWith(
      failedValue: freezed == failedValue
          ? _value.failedValue
          : failedValue // ignore: cast_nullable_to_non_nullable
              as T,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InvalidEmailImplCopyWith<T, $Res>
    implements $ValueFailureCopyWith<T, $Res> {
  factory _$$InvalidEmailImplCopyWith(_$InvalidEmailImpl<T> value,
          $Res Function(_$InvalidEmailImpl<T>) then) =
      __$$InvalidEmailImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({T failedValue});
}

/// @nodoc
class __$$InvalidEmailImplCopyWithImpl<T, $Res>
    extends _$ValueFailureCopyWithImpl<T, $Res, _$InvalidEmailImpl<T>>
    implements _$$InvalidEmailImplCopyWith<T, $Res> {
  __$$InvalidEmailImplCopyWithImpl(
      _$InvalidEmailImpl<T> _value, $Res Function(_$InvalidEmailImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failedValue = freezed,
  }) {
    return _then(_$InvalidEmailImpl<T>(
      failedValue: freezed == failedValue
          ? _value.failedValue
          : failedValue // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$InvalidEmailImpl<T>
    with DiagnosticableTreeMixin
    implements InvalidEmail<T> {
  const _$InvalidEmailImpl({required this.failedValue});

  @override
  final T failedValue;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ValueFailure<$T>.invalidEmail(failedValue: $failedValue)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ValueFailure<$T>.invalidEmail'))
      ..add(DiagnosticsProperty('failedValue', failedValue));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvalidEmailImpl<T> &&
            const DeepCollectionEquality()
                .equals(other.failedValue, failedValue));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(failedValue));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InvalidEmailImplCopyWith<T, _$InvalidEmailImpl<T>> get copyWith =>
      __$$InvalidEmailImplCopyWithImpl<T, _$InvalidEmailImpl<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T failedValue) invalidEmail,
    required TResult Function(T failedValue) emailAlreadyInUse,
    required TResult Function(T failedValue) shortPassword,
    required TResult Function(T failedValue) noUppercase,
    required TResult Function(T failedValue) noLowercase,
    required TResult Function(T failedValue) noNumeric,
    required TResult Function(T failedValue) noSpecialCharacter,
  }) {
    return invalidEmail(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T failedValue)? invalidEmail,
    TResult? Function(T failedValue)? emailAlreadyInUse,
    TResult? Function(T failedValue)? shortPassword,
    TResult? Function(T failedValue)? noUppercase,
    TResult? Function(T failedValue)? noLowercase,
    TResult? Function(T failedValue)? noNumeric,
    TResult? Function(T failedValue)? noSpecialCharacter,
  }) {
    return invalidEmail?.call(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T failedValue)? invalidEmail,
    TResult Function(T failedValue)? emailAlreadyInUse,
    TResult Function(T failedValue)? shortPassword,
    TResult Function(T failedValue)? noUppercase,
    TResult Function(T failedValue)? noLowercase,
    TResult Function(T failedValue)? noNumeric,
    TResult Function(T failedValue)? noSpecialCharacter,
    required TResult orElse(),
  }) {
    if (invalidEmail != null) {
      return invalidEmail(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidEmail<T> value) invalidEmail,
    required TResult Function(EmailAlreadyInUse<T> value) emailAlreadyInUse,
    required TResult Function(ShortPassword<T> value) shortPassword,
    required TResult Function(NoUppercase<T> value) noUppercase,
    required TResult Function(NoLowercase<T> value) noLowercase,
    required TResult Function(NoNumeric<T> value) noNumeric,
    required TResult Function(NoSpecialCharacter<T> value) noSpecialCharacter,
  }) {
    return invalidEmail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InvalidEmail<T> value)? invalidEmail,
    TResult? Function(EmailAlreadyInUse<T> value)? emailAlreadyInUse,
    TResult? Function(ShortPassword<T> value)? shortPassword,
    TResult? Function(NoUppercase<T> value)? noUppercase,
    TResult? Function(NoLowercase<T> value)? noLowercase,
    TResult? Function(NoNumeric<T> value)? noNumeric,
    TResult? Function(NoSpecialCharacter<T> value)? noSpecialCharacter,
  }) {
    return invalidEmail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidEmail<T> value)? invalidEmail,
    TResult Function(EmailAlreadyInUse<T> value)? emailAlreadyInUse,
    TResult Function(ShortPassword<T> value)? shortPassword,
    TResult Function(NoUppercase<T> value)? noUppercase,
    TResult Function(NoLowercase<T> value)? noLowercase,
    TResult Function(NoNumeric<T> value)? noNumeric,
    TResult Function(NoSpecialCharacter<T> value)? noSpecialCharacter,
    required TResult orElse(),
  }) {
    if (invalidEmail != null) {
      return invalidEmail(this);
    }
    return orElse();
  }
}

abstract class InvalidEmail<T> implements ValueFailure<T> {
  const factory InvalidEmail({required final T failedValue}) =
      _$InvalidEmailImpl<T>;

  @override
  T get failedValue;
  @override
  @JsonKey(ignore: true)
  _$$InvalidEmailImplCopyWith<T, _$InvalidEmailImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EmailAlreadyInUseImplCopyWith<T, $Res>
    implements $ValueFailureCopyWith<T, $Res> {
  factory _$$EmailAlreadyInUseImplCopyWith(_$EmailAlreadyInUseImpl<T> value,
          $Res Function(_$EmailAlreadyInUseImpl<T>) then) =
      __$$EmailAlreadyInUseImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({T failedValue});
}

/// @nodoc
class __$$EmailAlreadyInUseImplCopyWithImpl<T, $Res>
    extends _$ValueFailureCopyWithImpl<T, $Res, _$EmailAlreadyInUseImpl<T>>
    implements _$$EmailAlreadyInUseImplCopyWith<T, $Res> {
  __$$EmailAlreadyInUseImplCopyWithImpl(_$EmailAlreadyInUseImpl<T> _value,
      $Res Function(_$EmailAlreadyInUseImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failedValue = freezed,
  }) {
    return _then(_$EmailAlreadyInUseImpl<T>(
      failedValue: freezed == failedValue
          ? _value.failedValue
          : failedValue // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$EmailAlreadyInUseImpl<T>
    with DiagnosticableTreeMixin
    implements EmailAlreadyInUse<T> {
  const _$EmailAlreadyInUseImpl({required this.failedValue});

  @override
  final T failedValue;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ValueFailure<$T>.emailAlreadyInUse(failedValue: $failedValue)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ValueFailure<$T>.emailAlreadyInUse'))
      ..add(DiagnosticsProperty('failedValue', failedValue));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmailAlreadyInUseImpl<T> &&
            const DeepCollectionEquality()
                .equals(other.failedValue, failedValue));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(failedValue));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EmailAlreadyInUseImplCopyWith<T, _$EmailAlreadyInUseImpl<T>>
      get copyWith =>
          __$$EmailAlreadyInUseImplCopyWithImpl<T, _$EmailAlreadyInUseImpl<T>>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T failedValue) invalidEmail,
    required TResult Function(T failedValue) emailAlreadyInUse,
    required TResult Function(T failedValue) shortPassword,
    required TResult Function(T failedValue) noUppercase,
    required TResult Function(T failedValue) noLowercase,
    required TResult Function(T failedValue) noNumeric,
    required TResult Function(T failedValue) noSpecialCharacter,
  }) {
    return emailAlreadyInUse(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T failedValue)? invalidEmail,
    TResult? Function(T failedValue)? emailAlreadyInUse,
    TResult? Function(T failedValue)? shortPassword,
    TResult? Function(T failedValue)? noUppercase,
    TResult? Function(T failedValue)? noLowercase,
    TResult? Function(T failedValue)? noNumeric,
    TResult? Function(T failedValue)? noSpecialCharacter,
  }) {
    return emailAlreadyInUse?.call(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T failedValue)? invalidEmail,
    TResult Function(T failedValue)? emailAlreadyInUse,
    TResult Function(T failedValue)? shortPassword,
    TResult Function(T failedValue)? noUppercase,
    TResult Function(T failedValue)? noLowercase,
    TResult Function(T failedValue)? noNumeric,
    TResult Function(T failedValue)? noSpecialCharacter,
    required TResult orElse(),
  }) {
    if (emailAlreadyInUse != null) {
      return emailAlreadyInUse(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidEmail<T> value) invalidEmail,
    required TResult Function(EmailAlreadyInUse<T> value) emailAlreadyInUse,
    required TResult Function(ShortPassword<T> value) shortPassword,
    required TResult Function(NoUppercase<T> value) noUppercase,
    required TResult Function(NoLowercase<T> value) noLowercase,
    required TResult Function(NoNumeric<T> value) noNumeric,
    required TResult Function(NoSpecialCharacter<T> value) noSpecialCharacter,
  }) {
    return emailAlreadyInUse(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InvalidEmail<T> value)? invalidEmail,
    TResult? Function(EmailAlreadyInUse<T> value)? emailAlreadyInUse,
    TResult? Function(ShortPassword<T> value)? shortPassword,
    TResult? Function(NoUppercase<T> value)? noUppercase,
    TResult? Function(NoLowercase<T> value)? noLowercase,
    TResult? Function(NoNumeric<T> value)? noNumeric,
    TResult? Function(NoSpecialCharacter<T> value)? noSpecialCharacter,
  }) {
    return emailAlreadyInUse?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidEmail<T> value)? invalidEmail,
    TResult Function(EmailAlreadyInUse<T> value)? emailAlreadyInUse,
    TResult Function(ShortPassword<T> value)? shortPassword,
    TResult Function(NoUppercase<T> value)? noUppercase,
    TResult Function(NoLowercase<T> value)? noLowercase,
    TResult Function(NoNumeric<T> value)? noNumeric,
    TResult Function(NoSpecialCharacter<T> value)? noSpecialCharacter,
    required TResult orElse(),
  }) {
    if (emailAlreadyInUse != null) {
      return emailAlreadyInUse(this);
    }
    return orElse();
  }
}

abstract class EmailAlreadyInUse<T> implements ValueFailure<T> {
  const factory EmailAlreadyInUse({required final T failedValue}) =
      _$EmailAlreadyInUseImpl<T>;

  @override
  T get failedValue;
  @override
  @JsonKey(ignore: true)
  _$$EmailAlreadyInUseImplCopyWith<T, _$EmailAlreadyInUseImpl<T>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ShortPasswordImplCopyWith<T, $Res>
    implements $ValueFailureCopyWith<T, $Res> {
  factory _$$ShortPasswordImplCopyWith(_$ShortPasswordImpl<T> value,
          $Res Function(_$ShortPasswordImpl<T>) then) =
      __$$ShortPasswordImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({T failedValue});
}

/// @nodoc
class __$$ShortPasswordImplCopyWithImpl<T, $Res>
    extends _$ValueFailureCopyWithImpl<T, $Res, _$ShortPasswordImpl<T>>
    implements _$$ShortPasswordImplCopyWith<T, $Res> {
  __$$ShortPasswordImplCopyWithImpl(_$ShortPasswordImpl<T> _value,
      $Res Function(_$ShortPasswordImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failedValue = freezed,
  }) {
    return _then(_$ShortPasswordImpl<T>(
      failedValue: freezed == failedValue
          ? _value.failedValue
          : failedValue // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$ShortPasswordImpl<T>
    with DiagnosticableTreeMixin
    implements ShortPassword<T> {
  const _$ShortPasswordImpl({required this.failedValue});

  @override
  final T failedValue;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ValueFailure<$T>.shortPassword(failedValue: $failedValue)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ValueFailure<$T>.shortPassword'))
      ..add(DiagnosticsProperty('failedValue', failedValue));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShortPasswordImpl<T> &&
            const DeepCollectionEquality()
                .equals(other.failedValue, failedValue));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(failedValue));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ShortPasswordImplCopyWith<T, _$ShortPasswordImpl<T>> get copyWith =>
      __$$ShortPasswordImplCopyWithImpl<T, _$ShortPasswordImpl<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T failedValue) invalidEmail,
    required TResult Function(T failedValue) emailAlreadyInUse,
    required TResult Function(T failedValue) shortPassword,
    required TResult Function(T failedValue) noUppercase,
    required TResult Function(T failedValue) noLowercase,
    required TResult Function(T failedValue) noNumeric,
    required TResult Function(T failedValue) noSpecialCharacter,
  }) {
    return shortPassword(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T failedValue)? invalidEmail,
    TResult? Function(T failedValue)? emailAlreadyInUse,
    TResult? Function(T failedValue)? shortPassword,
    TResult? Function(T failedValue)? noUppercase,
    TResult? Function(T failedValue)? noLowercase,
    TResult? Function(T failedValue)? noNumeric,
    TResult? Function(T failedValue)? noSpecialCharacter,
  }) {
    return shortPassword?.call(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T failedValue)? invalidEmail,
    TResult Function(T failedValue)? emailAlreadyInUse,
    TResult Function(T failedValue)? shortPassword,
    TResult Function(T failedValue)? noUppercase,
    TResult Function(T failedValue)? noLowercase,
    TResult Function(T failedValue)? noNumeric,
    TResult Function(T failedValue)? noSpecialCharacter,
    required TResult orElse(),
  }) {
    if (shortPassword != null) {
      return shortPassword(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidEmail<T> value) invalidEmail,
    required TResult Function(EmailAlreadyInUse<T> value) emailAlreadyInUse,
    required TResult Function(ShortPassword<T> value) shortPassword,
    required TResult Function(NoUppercase<T> value) noUppercase,
    required TResult Function(NoLowercase<T> value) noLowercase,
    required TResult Function(NoNumeric<T> value) noNumeric,
    required TResult Function(NoSpecialCharacter<T> value) noSpecialCharacter,
  }) {
    return shortPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InvalidEmail<T> value)? invalidEmail,
    TResult? Function(EmailAlreadyInUse<T> value)? emailAlreadyInUse,
    TResult? Function(ShortPassword<T> value)? shortPassword,
    TResult? Function(NoUppercase<T> value)? noUppercase,
    TResult? Function(NoLowercase<T> value)? noLowercase,
    TResult? Function(NoNumeric<T> value)? noNumeric,
    TResult? Function(NoSpecialCharacter<T> value)? noSpecialCharacter,
  }) {
    return shortPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidEmail<T> value)? invalidEmail,
    TResult Function(EmailAlreadyInUse<T> value)? emailAlreadyInUse,
    TResult Function(ShortPassword<T> value)? shortPassword,
    TResult Function(NoUppercase<T> value)? noUppercase,
    TResult Function(NoLowercase<T> value)? noLowercase,
    TResult Function(NoNumeric<T> value)? noNumeric,
    TResult Function(NoSpecialCharacter<T> value)? noSpecialCharacter,
    required TResult orElse(),
  }) {
    if (shortPassword != null) {
      return shortPassword(this);
    }
    return orElse();
  }
}

abstract class ShortPassword<T> implements ValueFailure<T> {
  const factory ShortPassword({required final T failedValue}) =
      _$ShortPasswordImpl<T>;

  @override
  T get failedValue;
  @override
  @JsonKey(ignore: true)
  _$$ShortPasswordImplCopyWith<T, _$ShortPasswordImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NoUppercaseImplCopyWith<T, $Res>
    implements $ValueFailureCopyWith<T, $Res> {
  factory _$$NoUppercaseImplCopyWith(_$NoUppercaseImpl<T> value,
          $Res Function(_$NoUppercaseImpl<T>) then) =
      __$$NoUppercaseImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({T failedValue});
}

/// @nodoc
class __$$NoUppercaseImplCopyWithImpl<T, $Res>
    extends _$ValueFailureCopyWithImpl<T, $Res, _$NoUppercaseImpl<T>>
    implements _$$NoUppercaseImplCopyWith<T, $Res> {
  __$$NoUppercaseImplCopyWithImpl(
      _$NoUppercaseImpl<T> _value, $Res Function(_$NoUppercaseImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failedValue = freezed,
  }) {
    return _then(_$NoUppercaseImpl<T>(
      failedValue: freezed == failedValue
          ? _value.failedValue
          : failedValue // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$NoUppercaseImpl<T>
    with DiagnosticableTreeMixin
    implements NoUppercase<T> {
  const _$NoUppercaseImpl({required this.failedValue});

  @override
  final T failedValue;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ValueFailure<$T>.noUppercase(failedValue: $failedValue)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ValueFailure<$T>.noUppercase'))
      ..add(DiagnosticsProperty('failedValue', failedValue));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NoUppercaseImpl<T> &&
            const DeepCollectionEquality()
                .equals(other.failedValue, failedValue));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(failedValue));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NoUppercaseImplCopyWith<T, _$NoUppercaseImpl<T>> get copyWith =>
      __$$NoUppercaseImplCopyWithImpl<T, _$NoUppercaseImpl<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T failedValue) invalidEmail,
    required TResult Function(T failedValue) emailAlreadyInUse,
    required TResult Function(T failedValue) shortPassword,
    required TResult Function(T failedValue) noUppercase,
    required TResult Function(T failedValue) noLowercase,
    required TResult Function(T failedValue) noNumeric,
    required TResult Function(T failedValue) noSpecialCharacter,
  }) {
    return noUppercase(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T failedValue)? invalidEmail,
    TResult? Function(T failedValue)? emailAlreadyInUse,
    TResult? Function(T failedValue)? shortPassword,
    TResult? Function(T failedValue)? noUppercase,
    TResult? Function(T failedValue)? noLowercase,
    TResult? Function(T failedValue)? noNumeric,
    TResult? Function(T failedValue)? noSpecialCharacter,
  }) {
    return noUppercase?.call(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T failedValue)? invalidEmail,
    TResult Function(T failedValue)? emailAlreadyInUse,
    TResult Function(T failedValue)? shortPassword,
    TResult Function(T failedValue)? noUppercase,
    TResult Function(T failedValue)? noLowercase,
    TResult Function(T failedValue)? noNumeric,
    TResult Function(T failedValue)? noSpecialCharacter,
    required TResult orElse(),
  }) {
    if (noUppercase != null) {
      return noUppercase(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidEmail<T> value) invalidEmail,
    required TResult Function(EmailAlreadyInUse<T> value) emailAlreadyInUse,
    required TResult Function(ShortPassword<T> value) shortPassword,
    required TResult Function(NoUppercase<T> value) noUppercase,
    required TResult Function(NoLowercase<T> value) noLowercase,
    required TResult Function(NoNumeric<T> value) noNumeric,
    required TResult Function(NoSpecialCharacter<T> value) noSpecialCharacter,
  }) {
    return noUppercase(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InvalidEmail<T> value)? invalidEmail,
    TResult? Function(EmailAlreadyInUse<T> value)? emailAlreadyInUse,
    TResult? Function(ShortPassword<T> value)? shortPassword,
    TResult? Function(NoUppercase<T> value)? noUppercase,
    TResult? Function(NoLowercase<T> value)? noLowercase,
    TResult? Function(NoNumeric<T> value)? noNumeric,
    TResult? Function(NoSpecialCharacter<T> value)? noSpecialCharacter,
  }) {
    return noUppercase?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidEmail<T> value)? invalidEmail,
    TResult Function(EmailAlreadyInUse<T> value)? emailAlreadyInUse,
    TResult Function(ShortPassword<T> value)? shortPassword,
    TResult Function(NoUppercase<T> value)? noUppercase,
    TResult Function(NoLowercase<T> value)? noLowercase,
    TResult Function(NoNumeric<T> value)? noNumeric,
    TResult Function(NoSpecialCharacter<T> value)? noSpecialCharacter,
    required TResult orElse(),
  }) {
    if (noUppercase != null) {
      return noUppercase(this);
    }
    return orElse();
  }
}

abstract class NoUppercase<T> implements ValueFailure<T> {
  const factory NoUppercase({required final T failedValue}) =
      _$NoUppercaseImpl<T>;

  @override
  T get failedValue;
  @override
  @JsonKey(ignore: true)
  _$$NoUppercaseImplCopyWith<T, _$NoUppercaseImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NoLowercaseImplCopyWith<T, $Res>
    implements $ValueFailureCopyWith<T, $Res> {
  factory _$$NoLowercaseImplCopyWith(_$NoLowercaseImpl<T> value,
          $Res Function(_$NoLowercaseImpl<T>) then) =
      __$$NoLowercaseImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({T failedValue});
}

/// @nodoc
class __$$NoLowercaseImplCopyWithImpl<T, $Res>
    extends _$ValueFailureCopyWithImpl<T, $Res, _$NoLowercaseImpl<T>>
    implements _$$NoLowercaseImplCopyWith<T, $Res> {
  __$$NoLowercaseImplCopyWithImpl(
      _$NoLowercaseImpl<T> _value, $Res Function(_$NoLowercaseImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failedValue = freezed,
  }) {
    return _then(_$NoLowercaseImpl<T>(
      failedValue: freezed == failedValue
          ? _value.failedValue
          : failedValue // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$NoLowercaseImpl<T>
    with DiagnosticableTreeMixin
    implements NoLowercase<T> {
  const _$NoLowercaseImpl({required this.failedValue});

  @override
  final T failedValue;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ValueFailure<$T>.noLowercase(failedValue: $failedValue)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ValueFailure<$T>.noLowercase'))
      ..add(DiagnosticsProperty('failedValue', failedValue));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NoLowercaseImpl<T> &&
            const DeepCollectionEquality()
                .equals(other.failedValue, failedValue));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(failedValue));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NoLowercaseImplCopyWith<T, _$NoLowercaseImpl<T>> get copyWith =>
      __$$NoLowercaseImplCopyWithImpl<T, _$NoLowercaseImpl<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T failedValue) invalidEmail,
    required TResult Function(T failedValue) emailAlreadyInUse,
    required TResult Function(T failedValue) shortPassword,
    required TResult Function(T failedValue) noUppercase,
    required TResult Function(T failedValue) noLowercase,
    required TResult Function(T failedValue) noNumeric,
    required TResult Function(T failedValue) noSpecialCharacter,
  }) {
    return noLowercase(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T failedValue)? invalidEmail,
    TResult? Function(T failedValue)? emailAlreadyInUse,
    TResult? Function(T failedValue)? shortPassword,
    TResult? Function(T failedValue)? noUppercase,
    TResult? Function(T failedValue)? noLowercase,
    TResult? Function(T failedValue)? noNumeric,
    TResult? Function(T failedValue)? noSpecialCharacter,
  }) {
    return noLowercase?.call(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T failedValue)? invalidEmail,
    TResult Function(T failedValue)? emailAlreadyInUse,
    TResult Function(T failedValue)? shortPassword,
    TResult Function(T failedValue)? noUppercase,
    TResult Function(T failedValue)? noLowercase,
    TResult Function(T failedValue)? noNumeric,
    TResult Function(T failedValue)? noSpecialCharacter,
    required TResult orElse(),
  }) {
    if (noLowercase != null) {
      return noLowercase(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidEmail<T> value) invalidEmail,
    required TResult Function(EmailAlreadyInUse<T> value) emailAlreadyInUse,
    required TResult Function(ShortPassword<T> value) shortPassword,
    required TResult Function(NoUppercase<T> value) noUppercase,
    required TResult Function(NoLowercase<T> value) noLowercase,
    required TResult Function(NoNumeric<T> value) noNumeric,
    required TResult Function(NoSpecialCharacter<T> value) noSpecialCharacter,
  }) {
    return noLowercase(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InvalidEmail<T> value)? invalidEmail,
    TResult? Function(EmailAlreadyInUse<T> value)? emailAlreadyInUse,
    TResult? Function(ShortPassword<T> value)? shortPassword,
    TResult? Function(NoUppercase<T> value)? noUppercase,
    TResult? Function(NoLowercase<T> value)? noLowercase,
    TResult? Function(NoNumeric<T> value)? noNumeric,
    TResult? Function(NoSpecialCharacter<T> value)? noSpecialCharacter,
  }) {
    return noLowercase?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidEmail<T> value)? invalidEmail,
    TResult Function(EmailAlreadyInUse<T> value)? emailAlreadyInUse,
    TResult Function(ShortPassword<T> value)? shortPassword,
    TResult Function(NoUppercase<T> value)? noUppercase,
    TResult Function(NoLowercase<T> value)? noLowercase,
    TResult Function(NoNumeric<T> value)? noNumeric,
    TResult Function(NoSpecialCharacter<T> value)? noSpecialCharacter,
    required TResult orElse(),
  }) {
    if (noLowercase != null) {
      return noLowercase(this);
    }
    return orElse();
  }
}

abstract class NoLowercase<T> implements ValueFailure<T> {
  const factory NoLowercase({required final T failedValue}) =
      _$NoLowercaseImpl<T>;

  @override
  T get failedValue;
  @override
  @JsonKey(ignore: true)
  _$$NoLowercaseImplCopyWith<T, _$NoLowercaseImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NoNumericImplCopyWith<T, $Res>
    implements $ValueFailureCopyWith<T, $Res> {
  factory _$$NoNumericImplCopyWith(
          _$NoNumericImpl<T> value, $Res Function(_$NoNumericImpl<T>) then) =
      __$$NoNumericImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({T failedValue});
}

/// @nodoc
class __$$NoNumericImplCopyWithImpl<T, $Res>
    extends _$ValueFailureCopyWithImpl<T, $Res, _$NoNumericImpl<T>>
    implements _$$NoNumericImplCopyWith<T, $Res> {
  __$$NoNumericImplCopyWithImpl(
      _$NoNumericImpl<T> _value, $Res Function(_$NoNumericImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failedValue = freezed,
  }) {
    return _then(_$NoNumericImpl<T>(
      failedValue: freezed == failedValue
          ? _value.failedValue
          : failedValue // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$NoNumericImpl<T> with DiagnosticableTreeMixin implements NoNumeric<T> {
  const _$NoNumericImpl({required this.failedValue});

  @override
  final T failedValue;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ValueFailure<$T>.noNumeric(failedValue: $failedValue)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ValueFailure<$T>.noNumeric'))
      ..add(DiagnosticsProperty('failedValue', failedValue));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NoNumericImpl<T> &&
            const DeepCollectionEquality()
                .equals(other.failedValue, failedValue));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(failedValue));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NoNumericImplCopyWith<T, _$NoNumericImpl<T>> get copyWith =>
      __$$NoNumericImplCopyWithImpl<T, _$NoNumericImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T failedValue) invalidEmail,
    required TResult Function(T failedValue) emailAlreadyInUse,
    required TResult Function(T failedValue) shortPassword,
    required TResult Function(T failedValue) noUppercase,
    required TResult Function(T failedValue) noLowercase,
    required TResult Function(T failedValue) noNumeric,
    required TResult Function(T failedValue) noSpecialCharacter,
  }) {
    return noNumeric(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T failedValue)? invalidEmail,
    TResult? Function(T failedValue)? emailAlreadyInUse,
    TResult? Function(T failedValue)? shortPassword,
    TResult? Function(T failedValue)? noUppercase,
    TResult? Function(T failedValue)? noLowercase,
    TResult? Function(T failedValue)? noNumeric,
    TResult? Function(T failedValue)? noSpecialCharacter,
  }) {
    return noNumeric?.call(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T failedValue)? invalidEmail,
    TResult Function(T failedValue)? emailAlreadyInUse,
    TResult Function(T failedValue)? shortPassword,
    TResult Function(T failedValue)? noUppercase,
    TResult Function(T failedValue)? noLowercase,
    TResult Function(T failedValue)? noNumeric,
    TResult Function(T failedValue)? noSpecialCharacter,
    required TResult orElse(),
  }) {
    if (noNumeric != null) {
      return noNumeric(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidEmail<T> value) invalidEmail,
    required TResult Function(EmailAlreadyInUse<T> value) emailAlreadyInUse,
    required TResult Function(ShortPassword<T> value) shortPassword,
    required TResult Function(NoUppercase<T> value) noUppercase,
    required TResult Function(NoLowercase<T> value) noLowercase,
    required TResult Function(NoNumeric<T> value) noNumeric,
    required TResult Function(NoSpecialCharacter<T> value) noSpecialCharacter,
  }) {
    return noNumeric(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InvalidEmail<T> value)? invalidEmail,
    TResult? Function(EmailAlreadyInUse<T> value)? emailAlreadyInUse,
    TResult? Function(ShortPassword<T> value)? shortPassword,
    TResult? Function(NoUppercase<T> value)? noUppercase,
    TResult? Function(NoLowercase<T> value)? noLowercase,
    TResult? Function(NoNumeric<T> value)? noNumeric,
    TResult? Function(NoSpecialCharacter<T> value)? noSpecialCharacter,
  }) {
    return noNumeric?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidEmail<T> value)? invalidEmail,
    TResult Function(EmailAlreadyInUse<T> value)? emailAlreadyInUse,
    TResult Function(ShortPassword<T> value)? shortPassword,
    TResult Function(NoUppercase<T> value)? noUppercase,
    TResult Function(NoLowercase<T> value)? noLowercase,
    TResult Function(NoNumeric<T> value)? noNumeric,
    TResult Function(NoSpecialCharacter<T> value)? noSpecialCharacter,
    required TResult orElse(),
  }) {
    if (noNumeric != null) {
      return noNumeric(this);
    }
    return orElse();
  }
}

abstract class NoNumeric<T> implements ValueFailure<T> {
  const factory NoNumeric({required final T failedValue}) = _$NoNumericImpl<T>;

  @override
  T get failedValue;
  @override
  @JsonKey(ignore: true)
  _$$NoNumericImplCopyWith<T, _$NoNumericImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NoSpecialCharacterImplCopyWith<T, $Res>
    implements $ValueFailureCopyWith<T, $Res> {
  factory _$$NoSpecialCharacterImplCopyWith(_$NoSpecialCharacterImpl<T> value,
          $Res Function(_$NoSpecialCharacterImpl<T>) then) =
      __$$NoSpecialCharacterImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({T failedValue});
}

/// @nodoc
class __$$NoSpecialCharacterImplCopyWithImpl<T, $Res>
    extends _$ValueFailureCopyWithImpl<T, $Res, _$NoSpecialCharacterImpl<T>>
    implements _$$NoSpecialCharacterImplCopyWith<T, $Res> {
  __$$NoSpecialCharacterImplCopyWithImpl(_$NoSpecialCharacterImpl<T> _value,
      $Res Function(_$NoSpecialCharacterImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failedValue = freezed,
  }) {
    return _then(_$NoSpecialCharacterImpl<T>(
      failedValue: freezed == failedValue
          ? _value.failedValue
          : failedValue // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$NoSpecialCharacterImpl<T>
    with DiagnosticableTreeMixin
    implements NoSpecialCharacter<T> {
  const _$NoSpecialCharacterImpl({required this.failedValue});

  @override
  final T failedValue;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ValueFailure<$T>.noSpecialCharacter(failedValue: $failedValue)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ValueFailure<$T>.noSpecialCharacter'))
      ..add(DiagnosticsProperty('failedValue', failedValue));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NoSpecialCharacterImpl<T> &&
            const DeepCollectionEquality()
                .equals(other.failedValue, failedValue));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(failedValue));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NoSpecialCharacterImplCopyWith<T, _$NoSpecialCharacterImpl<T>>
      get copyWith => __$$NoSpecialCharacterImplCopyWithImpl<T,
          _$NoSpecialCharacterImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T failedValue) invalidEmail,
    required TResult Function(T failedValue) emailAlreadyInUse,
    required TResult Function(T failedValue) shortPassword,
    required TResult Function(T failedValue) noUppercase,
    required TResult Function(T failedValue) noLowercase,
    required TResult Function(T failedValue) noNumeric,
    required TResult Function(T failedValue) noSpecialCharacter,
  }) {
    return noSpecialCharacter(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T failedValue)? invalidEmail,
    TResult? Function(T failedValue)? emailAlreadyInUse,
    TResult? Function(T failedValue)? shortPassword,
    TResult? Function(T failedValue)? noUppercase,
    TResult? Function(T failedValue)? noLowercase,
    TResult? Function(T failedValue)? noNumeric,
    TResult? Function(T failedValue)? noSpecialCharacter,
  }) {
    return noSpecialCharacter?.call(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T failedValue)? invalidEmail,
    TResult Function(T failedValue)? emailAlreadyInUse,
    TResult Function(T failedValue)? shortPassword,
    TResult Function(T failedValue)? noUppercase,
    TResult Function(T failedValue)? noLowercase,
    TResult Function(T failedValue)? noNumeric,
    TResult Function(T failedValue)? noSpecialCharacter,
    required TResult orElse(),
  }) {
    if (noSpecialCharacter != null) {
      return noSpecialCharacter(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidEmail<T> value) invalidEmail,
    required TResult Function(EmailAlreadyInUse<T> value) emailAlreadyInUse,
    required TResult Function(ShortPassword<T> value) shortPassword,
    required TResult Function(NoUppercase<T> value) noUppercase,
    required TResult Function(NoLowercase<T> value) noLowercase,
    required TResult Function(NoNumeric<T> value) noNumeric,
    required TResult Function(NoSpecialCharacter<T> value) noSpecialCharacter,
  }) {
    return noSpecialCharacter(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InvalidEmail<T> value)? invalidEmail,
    TResult? Function(EmailAlreadyInUse<T> value)? emailAlreadyInUse,
    TResult? Function(ShortPassword<T> value)? shortPassword,
    TResult? Function(NoUppercase<T> value)? noUppercase,
    TResult? Function(NoLowercase<T> value)? noLowercase,
    TResult? Function(NoNumeric<T> value)? noNumeric,
    TResult? Function(NoSpecialCharacter<T> value)? noSpecialCharacter,
  }) {
    return noSpecialCharacter?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidEmail<T> value)? invalidEmail,
    TResult Function(EmailAlreadyInUse<T> value)? emailAlreadyInUse,
    TResult Function(ShortPassword<T> value)? shortPassword,
    TResult Function(NoUppercase<T> value)? noUppercase,
    TResult Function(NoLowercase<T> value)? noLowercase,
    TResult Function(NoNumeric<T> value)? noNumeric,
    TResult Function(NoSpecialCharacter<T> value)? noSpecialCharacter,
    required TResult orElse(),
  }) {
    if (noSpecialCharacter != null) {
      return noSpecialCharacter(this);
    }
    return orElse();
  }
}

abstract class NoSpecialCharacter<T> implements ValueFailure<T> {
  const factory NoSpecialCharacter({required final T failedValue}) =
      _$NoSpecialCharacterImpl<T>;

  @override
  T get failedValue;
  @override
  @JsonKey(ignore: true)
  _$$NoSpecialCharacterImplCopyWith<T, _$NoSpecialCharacterImpl<T>>
      get copyWith => throw _privateConstructorUsedError;
}
