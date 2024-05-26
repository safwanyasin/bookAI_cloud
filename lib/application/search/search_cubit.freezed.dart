// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SearchState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(SearchQuery searchQuery, bool isSubmitting,
            Option<Either<SearchFailure, Unit>> searchFailureOrSuccessOption)
        $default, {
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            SearchQuery searchQuery,
            Option<Either<SearchFailure, Unit>> searchFailureOrSuccessOption,
            bool isSubmitting)
        searching,
    required TResult Function(SearchFailure failure) searchFailure,
    required TResult Function(List<Book> books) searchSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(SearchQuery searchQuery, bool isSubmitting,
            Option<Either<SearchFailure, Unit>> searchFailureOrSuccessOption)?
        $default, {
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            SearchQuery searchQuery,
            Option<Either<SearchFailure, Unit>> searchFailureOrSuccessOption,
            bool isSubmitting)?
        searching,
    TResult? Function(SearchFailure failure)? searchFailure,
    TResult? Function(List<Book> books)? searchSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(SearchQuery searchQuery, bool isSubmitting,
            Option<Either<SearchFailure, Unit>> searchFailureOrSuccessOption)?
        $default, {
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            SearchQuery searchQuery,
            Option<Either<SearchFailure, Unit>> searchFailureOrSuccessOption,
            bool isSubmitting)?
        searching,
    TResult Function(SearchFailure failure)? searchFailure,
    TResult Function(List<Book> books)? searchSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_SearchState value) $default, {
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Searching value) searching,
    required TResult Function(_SearchFailure value) searchFailure,
    required TResult Function(_SearchSuccess value) searchSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_SearchState value)? $default, {
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Searching value)? searching,
    TResult? Function(_SearchFailure value)? searchFailure,
    TResult? Function(_SearchSuccess value)? searchSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_SearchState value)? $default, {
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Searching value)? searching,
    TResult Function(_SearchFailure value)? searchFailure,
    TResult Function(_SearchSuccess value)? searchSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchStateCopyWith<$Res> {
  factory $SearchStateCopyWith(
          SearchState value, $Res Function(SearchState) then) =
      _$SearchStateCopyWithImpl<$Res, SearchState>;
}

/// @nodoc
class _$SearchStateCopyWithImpl<$Res, $Val extends SearchState>
    implements $SearchStateCopyWith<$Res> {
  _$SearchStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SearchStateImplCopyWith<$Res> {
  factory _$$SearchStateImplCopyWith(
          _$SearchStateImpl value, $Res Function(_$SearchStateImpl) then) =
      __$$SearchStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {SearchQuery searchQuery,
      bool isSubmitting,
      Option<Either<SearchFailure, Unit>> searchFailureOrSuccessOption});
}

/// @nodoc
class __$$SearchStateImplCopyWithImpl<$Res>
    extends _$SearchStateCopyWithImpl<$Res, _$SearchStateImpl>
    implements _$$SearchStateImplCopyWith<$Res> {
  __$$SearchStateImplCopyWithImpl(
      _$SearchStateImpl _value, $Res Function(_$SearchStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchQuery = null,
    Object? isSubmitting = null,
    Object? searchFailureOrSuccessOption = null,
  }) {
    return _then(_$SearchStateImpl(
      searchQuery: null == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as SearchQuery,
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      searchFailureOrSuccessOption: null == searchFailureOrSuccessOption
          ? _value.searchFailureOrSuccessOption
          : searchFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<SearchFailure, Unit>>,
    ));
  }
}

/// @nodoc

class _$SearchStateImpl extends _SearchState {
  const _$SearchStateImpl(
      {required this.searchQuery,
      required this.isSubmitting,
      required this.searchFailureOrSuccessOption})
      : super._();

  @override
  final SearchQuery searchQuery;
  @override
  final bool isSubmitting;
  @override
  final Option<Either<SearchFailure, Unit>> searchFailureOrSuccessOption;

  @override
  String toString() {
    return 'SearchState(searchQuery: $searchQuery, isSubmitting: $isSubmitting, searchFailureOrSuccessOption: $searchFailureOrSuccessOption)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchStateImpl &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery) &&
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting) &&
            (identical(other.searchFailureOrSuccessOption,
                    searchFailureOrSuccessOption) ||
                other.searchFailureOrSuccessOption ==
                    searchFailureOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, searchQuery, isSubmitting, searchFailureOrSuccessOption);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchStateImplCopyWith<_$SearchStateImpl> get copyWith =>
      __$$SearchStateImplCopyWithImpl<_$SearchStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(SearchQuery searchQuery, bool isSubmitting,
            Option<Either<SearchFailure, Unit>> searchFailureOrSuccessOption)
        $default, {
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            SearchQuery searchQuery,
            Option<Either<SearchFailure, Unit>> searchFailureOrSuccessOption,
            bool isSubmitting)
        searching,
    required TResult Function(SearchFailure failure) searchFailure,
    required TResult Function(List<Book> books) searchSuccess,
  }) {
    return $default(searchQuery, isSubmitting, searchFailureOrSuccessOption);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(SearchQuery searchQuery, bool isSubmitting,
            Option<Either<SearchFailure, Unit>> searchFailureOrSuccessOption)?
        $default, {
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            SearchQuery searchQuery,
            Option<Either<SearchFailure, Unit>> searchFailureOrSuccessOption,
            bool isSubmitting)?
        searching,
    TResult? Function(SearchFailure failure)? searchFailure,
    TResult? Function(List<Book> books)? searchSuccess,
  }) {
    return $default?.call(
        searchQuery, isSubmitting, searchFailureOrSuccessOption);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(SearchQuery searchQuery, bool isSubmitting,
            Option<Either<SearchFailure, Unit>> searchFailureOrSuccessOption)?
        $default, {
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            SearchQuery searchQuery,
            Option<Either<SearchFailure, Unit>> searchFailureOrSuccessOption,
            bool isSubmitting)?
        searching,
    TResult Function(SearchFailure failure)? searchFailure,
    TResult Function(List<Book> books)? searchSuccess,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(searchQuery, isSubmitting, searchFailureOrSuccessOption);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_SearchState value) $default, {
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Searching value) searching,
    required TResult Function(_SearchFailure value) searchFailure,
    required TResult Function(_SearchSuccess value) searchSuccess,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_SearchState value)? $default, {
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Searching value)? searching,
    TResult? Function(_SearchFailure value)? searchFailure,
    TResult? Function(_SearchSuccess value)? searchSuccess,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_SearchState value)? $default, {
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Searching value)? searching,
    TResult Function(_SearchFailure value)? searchFailure,
    TResult Function(_SearchSuccess value)? searchSuccess,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _SearchState extends SearchState {
  const factory _SearchState(
      {required final SearchQuery searchQuery,
      required final bool isSubmitting,
      required final Option<Either<SearchFailure, Unit>>
          searchFailureOrSuccessOption}) = _$SearchStateImpl;
  const _SearchState._() : super._();

  SearchQuery get searchQuery;
  bool get isSubmitting;
  Option<Either<SearchFailure, Unit>> get searchFailureOrSuccessOption;
  @JsonKey(ignore: true)
  _$$SearchStateImplCopyWith<_$SearchStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$SearchStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl extends _Initial {
  const _$InitialImpl() : super._();

  @override
  String toString() {
    return 'SearchState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(SearchQuery searchQuery, bool isSubmitting,
            Option<Either<SearchFailure, Unit>> searchFailureOrSuccessOption)
        $default, {
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            SearchQuery searchQuery,
            Option<Either<SearchFailure, Unit>> searchFailureOrSuccessOption,
            bool isSubmitting)
        searching,
    required TResult Function(SearchFailure failure) searchFailure,
    required TResult Function(List<Book> books) searchSuccess,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(SearchQuery searchQuery, bool isSubmitting,
            Option<Either<SearchFailure, Unit>> searchFailureOrSuccessOption)?
        $default, {
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            SearchQuery searchQuery,
            Option<Either<SearchFailure, Unit>> searchFailureOrSuccessOption,
            bool isSubmitting)?
        searching,
    TResult? Function(SearchFailure failure)? searchFailure,
    TResult? Function(List<Book> books)? searchSuccess,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(SearchQuery searchQuery, bool isSubmitting,
            Option<Either<SearchFailure, Unit>> searchFailureOrSuccessOption)?
        $default, {
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            SearchQuery searchQuery,
            Option<Either<SearchFailure, Unit>> searchFailureOrSuccessOption,
            bool isSubmitting)?
        searching,
    TResult Function(SearchFailure failure)? searchFailure,
    TResult Function(List<Book> books)? searchSuccess,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_SearchState value) $default, {
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Searching value) searching,
    required TResult Function(_SearchFailure value) searchFailure,
    required TResult Function(_SearchSuccess value) searchSuccess,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_SearchState value)? $default, {
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Searching value)? searching,
    TResult? Function(_SearchFailure value)? searchFailure,
    TResult? Function(_SearchSuccess value)? searchSuccess,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_SearchState value)? $default, {
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Searching value)? searching,
    TResult Function(_SearchFailure value)? searchFailure,
    TResult Function(_SearchSuccess value)? searchSuccess,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial extends SearchState {
  const factory _Initial() = _$InitialImpl;
  const _Initial._() : super._();
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$SearchStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingImpl extends _Loading {
  const _$LoadingImpl() : super._();

  @override
  String toString() {
    return 'SearchState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(SearchQuery searchQuery, bool isSubmitting,
            Option<Either<SearchFailure, Unit>> searchFailureOrSuccessOption)
        $default, {
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            SearchQuery searchQuery,
            Option<Either<SearchFailure, Unit>> searchFailureOrSuccessOption,
            bool isSubmitting)
        searching,
    required TResult Function(SearchFailure failure) searchFailure,
    required TResult Function(List<Book> books) searchSuccess,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(SearchQuery searchQuery, bool isSubmitting,
            Option<Either<SearchFailure, Unit>> searchFailureOrSuccessOption)?
        $default, {
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            SearchQuery searchQuery,
            Option<Either<SearchFailure, Unit>> searchFailureOrSuccessOption,
            bool isSubmitting)?
        searching,
    TResult? Function(SearchFailure failure)? searchFailure,
    TResult? Function(List<Book> books)? searchSuccess,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(SearchQuery searchQuery, bool isSubmitting,
            Option<Either<SearchFailure, Unit>> searchFailureOrSuccessOption)?
        $default, {
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            SearchQuery searchQuery,
            Option<Either<SearchFailure, Unit>> searchFailureOrSuccessOption,
            bool isSubmitting)?
        searching,
    TResult Function(SearchFailure failure)? searchFailure,
    TResult Function(List<Book> books)? searchSuccess,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_SearchState value) $default, {
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Searching value) searching,
    required TResult Function(_SearchFailure value) searchFailure,
    required TResult Function(_SearchSuccess value) searchSuccess,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_SearchState value)? $default, {
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Searching value)? searching,
    TResult? Function(_SearchFailure value)? searchFailure,
    TResult? Function(_SearchSuccess value)? searchSuccess,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_SearchState value)? $default, {
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Searching value)? searching,
    TResult Function(_SearchFailure value)? searchFailure,
    TResult Function(_SearchSuccess value)? searchSuccess,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading extends SearchState {
  const factory _Loading() = _$LoadingImpl;
  const _Loading._() : super._();
}

/// @nodoc
abstract class _$$SearchingImplCopyWith<$Res> {
  factory _$$SearchingImplCopyWith(
          _$SearchingImpl value, $Res Function(_$SearchingImpl) then) =
      __$$SearchingImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {SearchQuery searchQuery,
      Option<Either<SearchFailure, Unit>> searchFailureOrSuccessOption,
      bool isSubmitting});
}

/// @nodoc
class __$$SearchingImplCopyWithImpl<$Res>
    extends _$SearchStateCopyWithImpl<$Res, _$SearchingImpl>
    implements _$$SearchingImplCopyWith<$Res> {
  __$$SearchingImplCopyWithImpl(
      _$SearchingImpl _value, $Res Function(_$SearchingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchQuery = null,
    Object? searchFailureOrSuccessOption = null,
    Object? isSubmitting = null,
  }) {
    return _then(_$SearchingImpl(
      searchQuery: null == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as SearchQuery,
      searchFailureOrSuccessOption: null == searchFailureOrSuccessOption
          ? _value.searchFailureOrSuccessOption
          : searchFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<SearchFailure, Unit>>,
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$SearchingImpl extends _Searching {
  const _$SearchingImpl(
      {required this.searchQuery,
      required this.searchFailureOrSuccessOption,
      this.isSubmitting = false})
      : super._();

  @override
  final SearchQuery searchQuery;
  @override
  final Option<Either<SearchFailure, Unit>> searchFailureOrSuccessOption;
  @override
  @JsonKey()
  final bool isSubmitting;

  @override
  String toString() {
    return 'SearchState.searching(searchQuery: $searchQuery, searchFailureOrSuccessOption: $searchFailureOrSuccessOption, isSubmitting: $isSubmitting)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchingImpl &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery) &&
            (identical(other.searchFailureOrSuccessOption,
                    searchFailureOrSuccessOption) ||
                other.searchFailureOrSuccessOption ==
                    searchFailureOrSuccessOption) &&
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, searchQuery, searchFailureOrSuccessOption, isSubmitting);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchingImplCopyWith<_$SearchingImpl> get copyWith =>
      __$$SearchingImplCopyWithImpl<_$SearchingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(SearchQuery searchQuery, bool isSubmitting,
            Option<Either<SearchFailure, Unit>> searchFailureOrSuccessOption)
        $default, {
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            SearchQuery searchQuery,
            Option<Either<SearchFailure, Unit>> searchFailureOrSuccessOption,
            bool isSubmitting)
        searching,
    required TResult Function(SearchFailure failure) searchFailure,
    required TResult Function(List<Book> books) searchSuccess,
  }) {
    return searching(searchQuery, searchFailureOrSuccessOption, isSubmitting);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(SearchQuery searchQuery, bool isSubmitting,
            Option<Either<SearchFailure, Unit>> searchFailureOrSuccessOption)?
        $default, {
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            SearchQuery searchQuery,
            Option<Either<SearchFailure, Unit>> searchFailureOrSuccessOption,
            bool isSubmitting)?
        searching,
    TResult? Function(SearchFailure failure)? searchFailure,
    TResult? Function(List<Book> books)? searchSuccess,
  }) {
    return searching?.call(
        searchQuery, searchFailureOrSuccessOption, isSubmitting);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(SearchQuery searchQuery, bool isSubmitting,
            Option<Either<SearchFailure, Unit>> searchFailureOrSuccessOption)?
        $default, {
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            SearchQuery searchQuery,
            Option<Either<SearchFailure, Unit>> searchFailureOrSuccessOption,
            bool isSubmitting)?
        searching,
    TResult Function(SearchFailure failure)? searchFailure,
    TResult Function(List<Book> books)? searchSuccess,
    required TResult orElse(),
  }) {
    if (searching != null) {
      return searching(searchQuery, searchFailureOrSuccessOption, isSubmitting);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_SearchState value) $default, {
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Searching value) searching,
    required TResult Function(_SearchFailure value) searchFailure,
    required TResult Function(_SearchSuccess value) searchSuccess,
  }) {
    return searching(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_SearchState value)? $default, {
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Searching value)? searching,
    TResult? Function(_SearchFailure value)? searchFailure,
    TResult? Function(_SearchSuccess value)? searchSuccess,
  }) {
    return searching?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_SearchState value)? $default, {
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Searching value)? searching,
    TResult Function(_SearchFailure value)? searchFailure,
    TResult Function(_SearchSuccess value)? searchSuccess,
    required TResult orElse(),
  }) {
    if (searching != null) {
      return searching(this);
    }
    return orElse();
  }
}

abstract class _Searching extends SearchState {
  const factory _Searching(
      {required final SearchQuery searchQuery,
      required final Option<Either<SearchFailure, Unit>>
          searchFailureOrSuccessOption,
      final bool isSubmitting}) = _$SearchingImpl;
  const _Searching._() : super._();

  SearchQuery get searchQuery;
  Option<Either<SearchFailure, Unit>> get searchFailureOrSuccessOption;
  bool get isSubmitting;
  @JsonKey(ignore: true)
  _$$SearchingImplCopyWith<_$SearchingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SearchFailureImplCopyWith<$Res> {
  factory _$$SearchFailureImplCopyWith(
          _$SearchFailureImpl value, $Res Function(_$SearchFailureImpl) then) =
      __$$SearchFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({SearchFailure failure});

  $SearchFailureCopyWith<$Res> get failure;
}

/// @nodoc
class __$$SearchFailureImplCopyWithImpl<$Res>
    extends _$SearchStateCopyWithImpl<$Res, _$SearchFailureImpl>
    implements _$$SearchFailureImplCopyWith<$Res> {
  __$$SearchFailureImplCopyWithImpl(
      _$SearchFailureImpl _value, $Res Function(_$SearchFailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failure = null,
  }) {
    return _then(_$SearchFailureImpl(
      null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as SearchFailure,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $SearchFailureCopyWith<$Res> get failure {
    return $SearchFailureCopyWith<$Res>(_value.failure, (value) {
      return _then(_value.copyWith(failure: value));
    });
  }
}

/// @nodoc

class _$SearchFailureImpl extends _SearchFailure {
  const _$SearchFailureImpl(this.failure) : super._();

  @override
  final SearchFailure failure;

  @override
  String toString() {
    return 'SearchState.searchFailure(failure: $failure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchFailureImpl &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchFailureImplCopyWith<_$SearchFailureImpl> get copyWith =>
      __$$SearchFailureImplCopyWithImpl<_$SearchFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(SearchQuery searchQuery, bool isSubmitting,
            Option<Either<SearchFailure, Unit>> searchFailureOrSuccessOption)
        $default, {
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            SearchQuery searchQuery,
            Option<Either<SearchFailure, Unit>> searchFailureOrSuccessOption,
            bool isSubmitting)
        searching,
    required TResult Function(SearchFailure failure) searchFailure,
    required TResult Function(List<Book> books) searchSuccess,
  }) {
    return searchFailure(failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(SearchQuery searchQuery, bool isSubmitting,
            Option<Either<SearchFailure, Unit>> searchFailureOrSuccessOption)?
        $default, {
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            SearchQuery searchQuery,
            Option<Either<SearchFailure, Unit>> searchFailureOrSuccessOption,
            bool isSubmitting)?
        searching,
    TResult? Function(SearchFailure failure)? searchFailure,
    TResult? Function(List<Book> books)? searchSuccess,
  }) {
    return searchFailure?.call(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(SearchQuery searchQuery, bool isSubmitting,
            Option<Either<SearchFailure, Unit>> searchFailureOrSuccessOption)?
        $default, {
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            SearchQuery searchQuery,
            Option<Either<SearchFailure, Unit>> searchFailureOrSuccessOption,
            bool isSubmitting)?
        searching,
    TResult Function(SearchFailure failure)? searchFailure,
    TResult Function(List<Book> books)? searchSuccess,
    required TResult orElse(),
  }) {
    if (searchFailure != null) {
      return searchFailure(failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_SearchState value) $default, {
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Searching value) searching,
    required TResult Function(_SearchFailure value) searchFailure,
    required TResult Function(_SearchSuccess value) searchSuccess,
  }) {
    return searchFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_SearchState value)? $default, {
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Searching value)? searching,
    TResult? Function(_SearchFailure value)? searchFailure,
    TResult? Function(_SearchSuccess value)? searchSuccess,
  }) {
    return searchFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_SearchState value)? $default, {
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Searching value)? searching,
    TResult Function(_SearchFailure value)? searchFailure,
    TResult Function(_SearchSuccess value)? searchSuccess,
    required TResult orElse(),
  }) {
    if (searchFailure != null) {
      return searchFailure(this);
    }
    return orElse();
  }
}

abstract class _SearchFailure extends SearchState {
  const factory _SearchFailure(final SearchFailure failure) =
      _$SearchFailureImpl;
  const _SearchFailure._() : super._();

  SearchFailure get failure;
  @JsonKey(ignore: true)
  _$$SearchFailureImplCopyWith<_$SearchFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SearchSuccessImplCopyWith<$Res> {
  factory _$$SearchSuccessImplCopyWith(
          _$SearchSuccessImpl value, $Res Function(_$SearchSuccessImpl) then) =
      __$$SearchSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Book> books});
}

/// @nodoc
class __$$SearchSuccessImplCopyWithImpl<$Res>
    extends _$SearchStateCopyWithImpl<$Res, _$SearchSuccessImpl>
    implements _$$SearchSuccessImplCopyWith<$Res> {
  __$$SearchSuccessImplCopyWithImpl(
      _$SearchSuccessImpl _value, $Res Function(_$SearchSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? books = null,
  }) {
    return _then(_$SearchSuccessImpl(
      null == books
          ? _value._books
          : books // ignore: cast_nullable_to_non_nullable
              as List<Book>,
    ));
  }
}

/// @nodoc

class _$SearchSuccessImpl extends _SearchSuccess {
  const _$SearchSuccessImpl(final List<Book> books)
      : _books = books,
        super._();

  final List<Book> _books;
  @override
  List<Book> get books {
    if (_books is EqualUnmodifiableListView) return _books;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_books);
  }

  @override
  String toString() {
    return 'SearchState.searchSuccess(books: $books)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchSuccessImpl &&
            const DeepCollectionEquality().equals(other._books, _books));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_books));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchSuccessImplCopyWith<_$SearchSuccessImpl> get copyWith =>
      __$$SearchSuccessImplCopyWithImpl<_$SearchSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(SearchQuery searchQuery, bool isSubmitting,
            Option<Either<SearchFailure, Unit>> searchFailureOrSuccessOption)
        $default, {
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            SearchQuery searchQuery,
            Option<Either<SearchFailure, Unit>> searchFailureOrSuccessOption,
            bool isSubmitting)
        searching,
    required TResult Function(SearchFailure failure) searchFailure,
    required TResult Function(List<Book> books) searchSuccess,
  }) {
    return searchSuccess(books);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(SearchQuery searchQuery, bool isSubmitting,
            Option<Either<SearchFailure, Unit>> searchFailureOrSuccessOption)?
        $default, {
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            SearchQuery searchQuery,
            Option<Either<SearchFailure, Unit>> searchFailureOrSuccessOption,
            bool isSubmitting)?
        searching,
    TResult? Function(SearchFailure failure)? searchFailure,
    TResult? Function(List<Book> books)? searchSuccess,
  }) {
    return searchSuccess?.call(books);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(SearchQuery searchQuery, bool isSubmitting,
            Option<Either<SearchFailure, Unit>> searchFailureOrSuccessOption)?
        $default, {
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            SearchQuery searchQuery,
            Option<Either<SearchFailure, Unit>> searchFailureOrSuccessOption,
            bool isSubmitting)?
        searching,
    TResult Function(SearchFailure failure)? searchFailure,
    TResult Function(List<Book> books)? searchSuccess,
    required TResult orElse(),
  }) {
    if (searchSuccess != null) {
      return searchSuccess(books);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_SearchState value) $default, {
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Searching value) searching,
    required TResult Function(_SearchFailure value) searchFailure,
    required TResult Function(_SearchSuccess value) searchSuccess,
  }) {
    return searchSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_SearchState value)? $default, {
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Searching value)? searching,
    TResult? Function(_SearchFailure value)? searchFailure,
    TResult? Function(_SearchSuccess value)? searchSuccess,
  }) {
    return searchSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_SearchState value)? $default, {
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Searching value)? searching,
    TResult Function(_SearchFailure value)? searchFailure,
    TResult Function(_SearchSuccess value)? searchSuccess,
    required TResult orElse(),
  }) {
    if (searchSuccess != null) {
      return searchSuccess(this);
    }
    return orElse();
  }
}

abstract class _SearchSuccess extends SearchState {
  const factory _SearchSuccess(final List<Book> books) = _$SearchSuccessImpl;
  const _SearchSuccess._() : super._();

  List<Book> get books;
  @JsonKey(ignore: true)
  _$$SearchSuccessImplCopyWith<_$SearchSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
