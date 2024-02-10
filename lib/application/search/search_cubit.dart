import 'package:book_ai/domain/book/book.dart';
import 'package:book_ai/domain/book/i_book_repository.dart';
import 'package:book_ai/domain/search/search_failure.dart';
import 'package:book_ai/domain/search/value_objects.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'search_cubit.freezed.dart';
part 'search_state.dart';

@injectable
class SearchCubit extends Cubit<SearchState> {
  final IBookRepository _bookRepository;

  SearchCubit(this._bookRepository) : super(const SearchState.initial());

  void updateSearchQuery(String typedQuery) async {
    // if (state is _Searching) {
    //   emit(
    //     (state as _Searching).copyWith(
    //       searchQuery: SearchQuery(typedQuery),
    //       searchFailureOrSuccessOption: none(),
    //     ),
    //   );
    // }
    if (typedQuery.length % 2 == 0 && typedQuery.isNotEmpty) {
      await search();
    } else if (typedQuery.isEmpty) {
      emit(const SearchState.initial());
    } else {
      emit(SearchState.searching(
        searchQuery: SearchQuery(typedQuery),
        searchFailureOrSuccessOption: none(),
        isSubmitting: false,
      ));
    }
  }

  Future<void> search() async {
    // emit((state as _Searching).copyWith(isSubmitting: true));
    // emit(SearchState.searching(
    //   searchQuery: state.searchQuery,
    //   searchFailureOrSuccessOption: none(),
    //   isSubmitting: true,
    // ));
    // emit(SearchState.loading());

    final possibleFailure =
        await _bookRepository.get(state.searchQuery.getOrCrash());

    emit(possibleFailure.fold(
      (f) => const SearchState.searchFailure(SearchFailure.otherFailure(
          "An unexpected error occurred. Couldn't get results")),
      (books) => SearchState.searchSuccess(books),
    ));

    // emit(state.copyWith(
    //   isSubmitting: false,
    //   searchFailureOrSuccessOption: optionOf(result),
    // ));
  }
}
