part of 'advanced_search_cubit.dart';

@freezed
class AdvancedSearchState with _$AdvancedSearchState {
  const factory AdvancedSearchState({
    required GeneralSearchTerm generalSearchTerm,
    required Title title,
    required Author author,
    required Subject subject,
    required Isbn isbn,
    required Publisher publisher,
    required OrderBy orderBy,
    required PrintType printType,
    required bool isSubmitting,
    required Option<Either<AdvancedSearchFailure, List<Book>>>
        searchFailureOrSuccessOption,
    // can add a userdialog over here to show the error messages
  }) = _AdvancedSearchState;

  const AdvancedSearchState._();

  factory AdvancedSearchState.initial() => AdvancedSearchState(
        generalSearchTerm: GeneralSearchTerm(''),
        title: Title(''),
        author: Author(''),
        subject: Subject(''),
        isbn: Isbn(''),
        publisher: Publisher(''),
        orderBy: OrderBy('None'),
        printType: PrintType('All'),
        isSubmitting: false,
        searchFailureOrSuccessOption: none(),
      );
}
