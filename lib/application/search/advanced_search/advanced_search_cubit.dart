import 'package:book_ai/domain/book/book.dart';
import 'package:book_ai/domain/book/i_book_repository.dart';
import 'package:book_ai/domain/search/advanced_search/advanced_search_failure.dart';
import 'package:book_ai/domain/search/advanced_search/value_objects.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// import 'package:book_ai/application/auth/login/login_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'advanced_search_cubit.freezed.dart';
part 'advanced_search_state.dart';

@injectable
class AdvancedSearchCubit extends Cubit<AdvancedSearchState> {
  final IBookRepository _bookRepository;
  AdvancedSearchCubit(this._bookRepository)
      : super(AdvancedSearchState.initial());

  void updateGeneralSearchTerm(String typedSearchTerm) {
    emit(
      state.copyWith(
        generalSearchTerm: GeneralSearchTerm(typedSearchTerm),
        searchFailureOrSuccessOption: none(),
      ),
    );
  }

  void updateTitle(String typedTitle) {
    emit(
      state.copyWith(
        title: Title(typedTitle),
        searchFailureOrSuccessOption: none(),
      ),
    );
  }

  void updateAuthor(String typedAuthor) {
    emit(
      state.copyWith(
        author: Author(typedAuthor),
        searchFailureOrSuccessOption: none(),
      ),
    );
  }

  void updatePublisher(String typedPublisher) {
    emit(
      state.copyWith(
        publisher: Publisher(typedPublisher),
        searchFailureOrSuccessOption: none(),
      ),
    );
  }

  void updateSubject(String typedSubject) {
    emit(
      state.copyWith(
        subject: Subject(typedSubject),
        searchFailureOrSuccessOption: none(),
      ),
    );
  }

  void updateIsbn(String typedIsbn) {
    emit(
      state.copyWith(
        isbn: Isbn(typedIsbn),
        searchFailureOrSuccessOption: none(),
      ),
    );
  }

  void updatePrintType(String typedPrintType) {
    emit(
      state.copyWith(
        printType: PrintType(typedPrintType),
        searchFailureOrSuccessOption: none(),
      ),
    );
  }

  void updateOrderBy(String typedOrderBy) {
    emit(
      state.copyWith(
        orderBy: OrderBy(typedOrderBy),
        searchFailureOrSuccessOption: none(),
      ),
    );
  }

  void reset() {
    print('resetting advanced search state');
    emit(AdvancedSearchState.initial());
  }

  Future<void> search() async {
    emit(
      state.copyWith(
        isSubmitting: true,
      ),
    );
    String searchQuery = state.generalSearchTerm.getOrCrash();
    final titleParameter = state.title.getOrCrash().isNotEmpty
        ? '+intitle:${state.title.getOrCrash()}'
        : '';
    final authorParameter = state.author.getOrCrash().isNotEmpty
        ? '+inauthor:${state.author.getOrCrash()}'
        : '';
    final publisherParameter = state.publisher.getOrCrash().isNotEmpty
        ? '+inpublisher:${state.publisher.getOrCrash()}'
        : '';
    final subjectParameter = state.subject.getOrCrash().isNotEmpty
        ? '+subject:${state.subject.getOrCrash()}'
        : '';
    final isbnParameter = state.isbn.getOrCrash().isNotEmpty
        ? '+isbn:${state.isbn.getOrCrash()}'
        : '';
    final printTypeParameter = state.printType.getOrCrash().isNotEmpty
        ? '&printType=${state.printType.getOrCrash()}'
        : '';
        print(state.orderBy.getOrCrash());
    String orderByParameter =
        state.orderBy.getOrCrash() == 'publish date'
            ? 'newest'
            : state.orderBy.getOrCrash();
    orderByParameter = orderByParameter != 'none'
        ? '&orderBy=$orderByParameter'
        : '';
        print(orderByParameter);
    String filters = titleParameter +
        authorParameter +
        publisherParameter +
        subjectParameter +
        isbnParameter +
        printTypeParameter +
        orderByParameter;
    if (state.generalSearchTerm.getOrCrash().isEmpty) {
      filters = filters.substring(1, filters.length);
    }
    searchQuery = searchQuery + filters;
    print('the search query $searchQuery');
    final possibleFailure = await _bookRepository.get(searchQuery);
    // emit(possibleFailure.fold(
    //   (f) => const SearchState.searchFailure(SearchFailure.otherFailure(
    //       "An unexpected error occurred. Couldn't get results")),
    //   (books) => SearchState.searchSuccess(books),
    // ));

    if (possibleFailure.isLeft()) {
      return possibleFailure.fold((failure) {
        failure.maybeWhen(
          unexpected: () => emit(
            state.copyWith(
                isSubmitting: false,
                searchFailureOrSuccessOption: some(
                  left(const AdvancedSearchFailure.unexpected()),
                )),
          ),
          unableToUpdate: () => emit(
            state.copyWith(
                isSubmitting: false,
                searchFailureOrSuccessOption: some(
                  left(const AdvancedSearchFailure.unableToUpdate()),
                )),
          ),
          insufficientPermissions: () => emit(
            state.copyWith(
                isSubmitting: false,
                searchFailureOrSuccessOption: some(
                  left(const AdvancedSearchFailure.insufficientPermissions()),
                )),
          ),
          orElse: () => emit(
            state.copyWith(
                isSubmitting: false,
                searchFailureOrSuccessOption: some(
                  left(const AdvancedSearchFailure.otherFailure(
                      'An unexpected error occurred')),
                )),
          ),
        );
      }, (books) {});
    } else {
      possibleFailure.fold((_) {}, (books) {
        print(books);
        emit(state.copyWith(
          isSubmitting: false,
          searchFailureOrSuccessOption: some(right(books)),
        ));
        print(state.isSubmitting);
        print(state.searchFailureOrSuccessOption);
      });
    }
  }
}
