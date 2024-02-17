import 'package:book_ai/domain/auth/value_objects.dart';
import 'package:book_ai/domain/book/book.dart';
import 'package:book_ai/domain/book/i_book_repository.dart';
import 'package:book_ai/domain/search/advanced_search/advanced_search_failure.dart';
import 'package:book_ai/domain/search/advanced_search/value_objects.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// import 'package:book_ai/application/auth/login/login_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'profile_page_cubit.freezed.dart';
part 'profile_page_state.dart';

@injectable
class ProfilePageCubit extends Cubit<ProfilePageState> {
  ProfilePageCubit() : super(ProfilePageState.initial()) {}

  void updateApiKey(String typedApiKey) {
    emit(
      state.copyWith(
        apiKey: ApiKey(typedApiKey),
      ),
    );
  }

  void update() async {
    emit(state.copyWith(
      isSubmitting: true,
    ));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('apiKey', state.apiKey.getOrCrash());
    emit(
      state.copyWith(
        isSubmitting: false,
      ),
    );
  }

  // Future<void> search() async {
  //   emit(
  //     state.copyWith(
  //       isSubmitting: true,
  //     ),
  //   );
  //   String searchQuery = state.generalSearchTerm.getOrCrash();
  //   final titleParameter = state.title.getOrCrash().isNotEmpty
  //       ? '+intitle:${state.title.getOrCrash()}'
  //       : '';
  //   final authorParameter = state.author.getOrCrash().isNotEmpty
  //       ? '+inauthor:${state.author.getOrCrash()}'
  //       : '';
  //   final publisherParameter = state.publisher.getOrCrash().isNotEmpty
  //       ? '+inpublisher:${state.publisher.getOrCrash()}'
  //       : '';
  //   final subjectParameter = state.subject.getOrCrash().isNotEmpty
  //       ? '+subject:${state.subject.getOrCrash()}'
  //       : '';
  //   final isbnParameter = state.isbn.getOrCrash().isNotEmpty
  //       ? '+isbn:${state.isbn.getOrCrash()}'
  //       : '';
  //   final printTypeParameter = state.printType.getOrCrash().isNotEmpty
  //       ? '&printType=${state.printType.getOrCrash()}'
  //       : '';
  //   print(state.orderBy.getOrCrash());
  //   String orderByParameter = state.orderBy.getOrCrash() == 'publish date'
  //       ? 'newest'
  //       : state.orderBy.getOrCrash();
  //   orderByParameter =
  //       orderByParameter != 'none' ? '&orderBy=$orderByParameter' : '';
  //   print(orderByParameter);
  //   String filters = titleParameter +
  //       authorParameter +
  //       publisherParameter +
  //       subjectParameter +
  //       isbnParameter +
  //       printTypeParameter +
  //       orderByParameter;
  //   if (state.generalSearchTerm.getOrCrash().isEmpty) {
  //     filters = filters.substring(1, filters.length);
  //   }
  //   searchQuery = searchQuery + filters;
  //   print('the search query $searchQuery');
  //   final possibleFailure = await _bookRepository.get(searchQuery);
  //   // emit(possibleFailure.fold(
  //   //   (f) => const SearchState.searchFailure(SearchFailure.otherFailure(
  //   //       "An unexpected error occurred. Couldn't get results")),
  //   //   (books) => SearchState.searchSuccess(books),
  //   // ));

  //   if (possibleFailure.isLeft()) {
  //     return possibleFailure.fold((failure) {
  //       failure.maybeWhen(
  //         unexpected: () => emit(
  //           state.copyWith(
  //               isSubmitting: false,
  //               searchFailureOrSuccessOption: some(
  //                 left(const AdvancedSearchFailure.unexpected()),
  //               )),
  //         ),
  //         unableToUpdate: () => emit(
  //           state.copyWith(
  //               isSubmitting: false,
  //               searchFailureOrSuccessOption: some(
  //                 left(const AdvancedSearchFailure.unableToUpdate()),
  //               )),
  //         ),
  //         insufficientPermissions: () => emit(
  //           state.copyWith(
  //               isSubmitting: false,
  //               searchFailureOrSuccessOption: some(
  //                 left(const AdvancedSearchFailure.insufficientPermissions()),
  //               )),
  //         ),
  //         orElse: () => emit(
  //           state.copyWith(
  //               isSubmitting: false,
  //               searchFailureOrSuccessOption: some(
  //                 left(const AdvancedSearchFailure.otherFailure(
  //                     'An unexpected error occurred')),
  //               )),
  //         ),
  //       );
  //     }, (books) {});
  //   } else {
  //     possibleFailure.fold((_) {}, (books) {
  //       print(books);
  //       emit(state.copyWith(
  //         isSubmitting: false,
  //         searchFailureOrSuccessOption: some(right(books)),
  //       ));
  //       print(state.isSubmitting);
  //       print(state.searchFailureOrSuccessOption);
  //     });
  //   }
  // }
}
