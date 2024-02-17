// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'email_verification_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EmailVerificationState {
  bool get isSending => throw _privateConstructorUsedError;
  Option<Either<EmailVerificationFailure, Unit>>
      get verificationFailureOrSuccessOption =>
          throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EmailVerificationStateCopyWith<EmailVerificationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmailVerificationStateCopyWith<$Res> {
  factory $EmailVerificationStateCopyWith(EmailVerificationState value,
          $Res Function(EmailVerificationState) then) =
      _$EmailVerificationStateCopyWithImpl<$Res, EmailVerificationState>;
  @useResult
  $Res call(
      {bool isSending,
      Option<Either<EmailVerificationFailure, Unit>>
          verificationFailureOrSuccessOption});
}

/// @nodoc
class _$EmailVerificationStateCopyWithImpl<$Res,
        $Val extends EmailVerificationState>
    implements $EmailVerificationStateCopyWith<$Res> {
  _$EmailVerificationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSending = null,
    Object? verificationFailureOrSuccessOption = null,
  }) {
    return _then(_value.copyWith(
      isSending: null == isSending
          ? _value.isSending
          : isSending // ignore: cast_nullable_to_non_nullable
              as bool,
      verificationFailureOrSuccessOption: null ==
              verificationFailureOrSuccessOption
          ? _value.verificationFailureOrSuccessOption
          : verificationFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<EmailVerificationFailure, Unit>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EmailVerificationStateImplCopyWith<$Res>
    implements $EmailVerificationStateCopyWith<$Res> {
  factory _$$EmailVerificationStateImplCopyWith(
          _$EmailVerificationStateImpl value,
          $Res Function(_$EmailVerificationStateImpl) then) =
      __$$EmailVerificationStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isSending,
      Option<Either<EmailVerificationFailure, Unit>>
          verificationFailureOrSuccessOption});
}

/// @nodoc
class __$$EmailVerificationStateImplCopyWithImpl<$Res>
    extends _$EmailVerificationStateCopyWithImpl<$Res,
        _$EmailVerificationStateImpl>
    implements _$$EmailVerificationStateImplCopyWith<$Res> {
  __$$EmailVerificationStateImplCopyWithImpl(
      _$EmailVerificationStateImpl _value,
      $Res Function(_$EmailVerificationStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSending = null,
    Object? verificationFailureOrSuccessOption = null,
  }) {
    return _then(_$EmailVerificationStateImpl(
      isSending: null == isSending
          ? _value.isSending
          : isSending // ignore: cast_nullable_to_non_nullable
              as bool,
      verificationFailureOrSuccessOption: null ==
              verificationFailureOrSuccessOption
          ? _value.verificationFailureOrSuccessOption
          : verificationFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<EmailVerificationFailure, Unit>>,
    ));
  }
}

/// @nodoc

class _$EmailVerificationStateImpl extends _EmailVerificationState {
  const _$EmailVerificationStateImpl(
      {required this.isSending,
      required this.verificationFailureOrSuccessOption})
      : super._();

  @override
  final bool isSending;
  @override
  final Option<Either<EmailVerificationFailure, Unit>>
      verificationFailureOrSuccessOption;

  @override
  String toString() {
    return 'EmailVerificationState(isSending: $isSending, verificationFailureOrSuccessOption: $verificationFailureOrSuccessOption)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmailVerificationStateImpl &&
            (identical(other.isSending, isSending) ||
                other.isSending == isSending) &&
            (identical(other.verificationFailureOrSuccessOption,
                    verificationFailureOrSuccessOption) ||
                other.verificationFailureOrSuccessOption ==
                    verificationFailureOrSuccessOption));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isSending, verificationFailureOrSuccessOption);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EmailVerificationStateImplCopyWith<_$EmailVerificationStateImpl>
      get copyWith => __$$EmailVerificationStateImplCopyWithImpl<
          _$EmailVerificationStateImpl>(this, _$identity);
}

abstract class _EmailVerificationState extends EmailVerificationState {
  const factory _EmailVerificationState(
      {required final bool isSending,
      required final Option<Either<EmailVerificationFailure, Unit>>
          verificationFailureOrSuccessOption}) = _$EmailVerificationStateImpl;
  const _EmailVerificationState._() : super._();

  @override
  bool get isSending;
  @override
  Option<Either<EmailVerificationFailure, Unit>>
      get verificationFailureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$$EmailVerificationStateImplCopyWith<_$EmailVerificationStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
