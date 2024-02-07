// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'story_dtos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StoryDto _$StoryDtoFromJson(Map<String, dynamic> json) {
  return _StoryDto.fromJson(json);
}

/// @nodoc
mixin _$StoryDto {
// @JsonKey(includeToJson: true) String bookId, // check if this is needed
  String get storyId => throw _privateConstructorUsedError;
  String get storyTitle => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StoryDtoCopyWith<StoryDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoryDtoCopyWith<$Res> {
  factory $StoryDtoCopyWith(StoryDto value, $Res Function(StoryDto) then) =
      _$StoryDtoCopyWithImpl<$Res, StoryDto>;
  @useResult
  $Res call({String storyId, String storyTitle, String content});
}

/// @nodoc
class _$StoryDtoCopyWithImpl<$Res, $Val extends StoryDto>
    implements $StoryDtoCopyWith<$Res> {
  _$StoryDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? storyId = null,
    Object? storyTitle = null,
    Object? content = null,
  }) {
    return _then(_value.copyWith(
      storyId: null == storyId
          ? _value.storyId
          : storyId // ignore: cast_nullable_to_non_nullable
              as String,
      storyTitle: null == storyTitle
          ? _value.storyTitle
          : storyTitle // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StoryDtoImplCopyWith<$Res>
    implements $StoryDtoCopyWith<$Res> {
  factory _$$StoryDtoImplCopyWith(
          _$StoryDtoImpl value, $Res Function(_$StoryDtoImpl) then) =
      __$$StoryDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String storyId, String storyTitle, String content});
}

/// @nodoc
class __$$StoryDtoImplCopyWithImpl<$Res>
    extends _$StoryDtoCopyWithImpl<$Res, _$StoryDtoImpl>
    implements _$$StoryDtoImplCopyWith<$Res> {
  __$$StoryDtoImplCopyWithImpl(
      _$StoryDtoImpl _value, $Res Function(_$StoryDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? storyId = null,
    Object? storyTitle = null,
    Object? content = null,
  }) {
    return _then(_$StoryDtoImpl(
      storyId: null == storyId
          ? _value.storyId
          : storyId // ignore: cast_nullable_to_non_nullable
              as String,
      storyTitle: null == storyTitle
          ? _value.storyTitle
          : storyTitle // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StoryDtoImpl extends _StoryDto {
  const _$StoryDtoImpl(
      {required this.storyId, required this.storyTitle, required this.content})
      : super._();

  factory _$StoryDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$StoryDtoImplFromJson(json);

// @JsonKey(includeToJson: true) String bookId, // check if this is needed
  @override
  final String storyId;
  @override
  final String storyTitle;
  @override
  final String content;

  @override
  String toString() {
    return 'StoryDto(storyId: $storyId, storyTitle: $storyTitle, content: $content)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoryDtoImpl &&
            (identical(other.storyId, storyId) || other.storyId == storyId) &&
            (identical(other.storyTitle, storyTitle) ||
                other.storyTitle == storyTitle) &&
            (identical(other.content, content) || other.content == content));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, storyId, storyTitle, content);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StoryDtoImplCopyWith<_$StoryDtoImpl> get copyWith =>
      __$$StoryDtoImplCopyWithImpl<_$StoryDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StoryDtoImplToJson(
      this,
    );
  }
}

abstract class _StoryDto extends StoryDto {
  const factory _StoryDto(
      {required final String storyId,
      required final String storyTitle,
      required final String content}) = _$StoryDtoImpl;
  const _StoryDto._() : super._();

  factory _StoryDto.fromJson(Map<String, dynamic> json) =
      _$StoryDtoImpl.fromJson;

  @override // @JsonKey(includeToJson: true) String bookId, // check if this is needed
  String get storyId;
  @override
  String get storyTitle;
  @override
  String get content;
  @override
  @JsonKey(ignore: true)
  _$$StoryDtoImplCopyWith<_$StoryDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
