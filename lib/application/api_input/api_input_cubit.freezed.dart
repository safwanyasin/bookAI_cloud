// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_input_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ApiInputState {
  ApiInput get apiKey => throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  Option<Either<ApiInputFailure, Unit>> get submitFailureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ApiInputStateCopyWith<ApiInputState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiInputStateCopyWith<$Res> {
  factory $ApiInputStateCopyWith(
          ApiInputState value, $Res Function(ApiInputState) then) =
      _$ApiInputStateCopyWithImpl<$Res, ApiInputState>;
  @useResult
  $Res call(
      {ApiInput apiKey,
      bool isSubmitting,
      Option<Either<ApiInputFailure, Unit>> submitFailureOrSuccessOption});
}

/// @nodoc
class _$ApiInputStateCopyWithImpl<$Res, $Val extends ApiInputState>
    implements $ApiInputStateCopyWith<$Res> {
  _$ApiInputStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? apiKey = null,
    Object? isSubmitting = null,
    Object? submitFailureOrSuccessOption = null,
  }) {
    return _then(_value.copyWith(
      apiKey: null == apiKey
          ? _value.apiKey
          : apiKey // ignore: cast_nullable_to_non_nullable
              as ApiInput,
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      submitFailureOrSuccessOption: null == submitFailureOrSuccessOption
          ? _value.submitFailureOrSuccessOption
          : submitFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiInputFailure, Unit>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ApiInputStateImplCopyWith<$Res>
    implements $ApiInputStateCopyWith<$Res> {
  factory _$$ApiInputStateImplCopyWith(
          _$ApiInputStateImpl value, $Res Function(_$ApiInputStateImpl) then) =
      __$$ApiInputStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ApiInput apiKey,
      bool isSubmitting,
      Option<Either<ApiInputFailure, Unit>> submitFailureOrSuccessOption});
}

/// @nodoc
class __$$ApiInputStateImplCopyWithImpl<$Res>
    extends _$ApiInputStateCopyWithImpl<$Res, _$ApiInputStateImpl>
    implements _$$ApiInputStateImplCopyWith<$Res> {
  __$$ApiInputStateImplCopyWithImpl(
      _$ApiInputStateImpl _value, $Res Function(_$ApiInputStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? apiKey = null,
    Object? isSubmitting = null,
    Object? submitFailureOrSuccessOption = null,
  }) {
    return _then(_$ApiInputStateImpl(
      apiKey: null == apiKey
          ? _value.apiKey
          : apiKey // ignore: cast_nullable_to_non_nullable
              as ApiInput,
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      submitFailureOrSuccessOption: null == submitFailureOrSuccessOption
          ? _value.submitFailureOrSuccessOption
          : submitFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiInputFailure, Unit>>,
    ));
  }
}

/// @nodoc

class _$ApiInputStateImpl extends _ApiInputState {
  const _$ApiInputStateImpl(
      {required this.apiKey,
      required this.isSubmitting,
      required this.submitFailureOrSuccessOption})
      : super._();

  @override
  final ApiInput apiKey;
  @override
  final bool isSubmitting;
  @override
  final Option<Either<ApiInputFailure, Unit>> submitFailureOrSuccessOption;

  @override
  String toString() {
    return 'ApiInputState(apiKey: $apiKey, isSubmitting: $isSubmitting, submitFailureOrSuccessOption: $submitFailureOrSuccessOption)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiInputStateImpl &&
            (identical(other.apiKey, apiKey) || other.apiKey == apiKey) &&
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting) &&
            (identical(other.submitFailureOrSuccessOption,
                    submitFailureOrSuccessOption) ||
                other.submitFailureOrSuccessOption ==
                    submitFailureOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, apiKey, isSubmitting, submitFailureOrSuccessOption);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiInputStateImplCopyWith<_$ApiInputStateImpl> get copyWith =>
      __$$ApiInputStateImplCopyWithImpl<_$ApiInputStateImpl>(this, _$identity);
}

abstract class _ApiInputState extends ApiInputState {
  const factory _ApiInputState(
      {required final ApiInput apiKey,
      required final bool isSubmitting,
      required final Option<Either<ApiInputFailure, Unit>>
          submitFailureOrSuccessOption}) = _$ApiInputStateImpl;
  const _ApiInputState._() : super._();

  @override
  ApiInput get apiKey;
  @override
  bool get isSubmitting;
  @override
  Option<Either<ApiInputFailure, Unit>> get submitFailureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$$ApiInputStateImplCopyWith<_$ApiInputStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
