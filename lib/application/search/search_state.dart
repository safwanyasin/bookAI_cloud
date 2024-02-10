// advanced_search_state.dart
part of 'search_cubit.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState({
    required SearchQuery searchQuery,
    required bool isSubmitting,
    required Option<Either<SearchFailure, Unit>> searchFailureOrSuccessOption,
  }) = _SearchState;

  const SearchState._();

  SearchQuery get searchQuery {
    return this.searchQuery;
  }

  const factory SearchState.initial() = _Initial;
  const factory SearchState.loading() = _Loading;
  const factory SearchState.searching({
    required SearchQuery searchQuery,
    required Option<Either<SearchFailure, Unit>> searchFailureOrSuccessOption,
    @Default(false) bool isSubmitting,
  }) = _Searching;
  const factory SearchState.searchFailure(SearchFailure failure) =
      _SearchFailure;
  const factory SearchState.searchSuccess(List<Book> books) = _SearchSuccess;
}
