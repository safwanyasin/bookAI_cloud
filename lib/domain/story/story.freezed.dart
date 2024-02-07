// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'story.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$StoryItem {
  UniqueId get storyId => throw _privateConstructorUsedError;
  StoryTitle get storyTitle => throw _privateConstructorUsedError;
  Content get content => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StoryItemCopyWith<StoryItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoryItemCopyWith<$Res> {
  factory $StoryItemCopyWith(StoryItem value, $Res Function(StoryItem) then) =
      _$StoryItemCopyWithImpl<$Res, StoryItem>;
  @useResult
  $Res call({UniqueId storyId, StoryTitle storyTitle, Content content});
}

/// @nodoc
class _$StoryItemCopyWithImpl<$Res, $Val extends StoryItem>
    implements $StoryItemCopyWith<$Res> {
  _$StoryItemCopyWithImpl(this._value, this._then);

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
              as UniqueId,
      storyTitle: null == storyTitle
          ? _value.storyTitle
          : storyTitle // ignore: cast_nullable_to_non_nullable
              as StoryTitle,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as Content,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StoryItemImplCopyWith<$Res>
    implements $StoryItemCopyWith<$Res> {
  factory _$$StoryItemImplCopyWith(
          _$StoryItemImpl value, $Res Function(_$StoryItemImpl) then) =
      __$$StoryItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({UniqueId storyId, StoryTitle storyTitle, Content content});
}

/// @nodoc
class __$$StoryItemImplCopyWithImpl<$Res>
    extends _$StoryItemCopyWithImpl<$Res, _$StoryItemImpl>
    implements _$$StoryItemImplCopyWith<$Res> {
  __$$StoryItemImplCopyWithImpl(
      _$StoryItemImpl _value, $Res Function(_$StoryItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? storyId = null,
    Object? storyTitle = null,
    Object? content = null,
  }) {
    return _then(_$StoryItemImpl(
      storyId: null == storyId
          ? _value.storyId
          : storyId // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      storyTitle: null == storyTitle
          ? _value.storyTitle
          : storyTitle // ignore: cast_nullable_to_non_nullable
              as StoryTitle,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as Content,
    ));
  }
}

/// @nodoc

class _$StoryItemImpl extends _StoryItem {
  const _$StoryItemImpl(
      {required this.storyId, required this.storyTitle, required this.content})
      : super._();

  @override
  final UniqueId storyId;
  @override
  final StoryTitle storyTitle;
  @override
  final Content content;

  @override
  String toString() {
    return 'StoryItem(storyId: $storyId, storyTitle: $storyTitle, content: $content)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoryItemImpl &&
            (identical(other.storyId, storyId) || other.storyId == storyId) &&
            (identical(other.storyTitle, storyTitle) ||
                other.storyTitle == storyTitle) &&
            (identical(other.content, content) || other.content == content));
  }

  @override
  int get hashCode => Object.hash(runtimeType, storyId, storyTitle, content);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StoryItemImplCopyWith<_$StoryItemImpl> get copyWith =>
      __$$StoryItemImplCopyWithImpl<_$StoryItemImpl>(this, _$identity);
}

abstract class _StoryItem extends StoryItem {
  const factory _StoryItem(
      {required final UniqueId storyId,
      required final StoryTitle storyTitle,
      required final Content content}) = _$StoryItemImpl;
  const _StoryItem._() : super._();

  @override
  UniqueId get storyId;
  @override
  StoryTitle get storyTitle;
  @override
  Content get content;
  @override
  @JsonKey(ignore: true)
  _$$StoryItemImplCopyWith<_$StoryItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
