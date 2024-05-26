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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StoryDto _$StoryDtoFromJson(Map<String, dynamic> json) {
  return _StoryDto.fromJson(json);
}

/// @nodoc
mixin _$StoryDto {
// @JsonKey(includeToJson: true) String bookId, // check if this is needed
  String get story_id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
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
  $Res call({String story_id, String title, String content});
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
    Object? story_id = null,
    Object? title = null,
    Object? content = null,
  }) {
    return _then(_value.copyWith(
      story_id: null == story_id
          ? _value.story_id
          : story_id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
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
  $Res call({String story_id, String title, String content});
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
    Object? story_id = null,
    Object? title = null,
    Object? content = null,
  }) {
    return _then(_$StoryDtoImpl(
      story_id: null == story_id
          ? _value.story_id
          : story_id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
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
      {required this.story_id, required this.title, required this.content})
      : super._();

  factory _$StoryDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$StoryDtoImplFromJson(json);

// @JsonKey(includeToJson: true) String bookId, // check if this is needed
  @override
  final String story_id;
  @override
  final String title;
  @override
  final String content;

  @override
  String toString() {
    return 'StoryDto(story_id: $story_id, title: $title, content: $content)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoryDtoImpl &&
            (identical(other.story_id, story_id) ||
                other.story_id == story_id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, story_id, title, content);

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
      {required final String story_id,
      required final String title,
      required final String content}) = _$StoryDtoImpl;
  const _StoryDto._() : super._();

  factory _StoryDto.fromJson(Map<String, dynamic> json) =
      _$StoryDtoImpl.fromJson;

  @override // @JsonKey(includeToJson: true) String bookId, // check if this is needed
  String get story_id;
  @override
  String get title;
  @override
  String get content;
  @override
  @JsonKey(ignore: true)
  _$$StoryDtoImplCopyWith<_$StoryDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
