import 'dart:async';

import 'package:book_ai/domain/book/book.dart';
import 'package:book_ai/domain/book/book_failure.dart';
import 'package:book_ai/domain/book/i_book_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'reading_list_cubit.freezed.dart';
part 'reading_list_state.dart';

// the watcher cubit will only be used to get the items from firestore
@injectable
class ReadingListCubit extends Cubit<ReadingListState> {
  final IBookRepository _bookRepository;
  StreamSubscription<Either<BookFailure, List<Book>>>? _bookStreamSubscription;

  ReadingListCubit(this._bookRepository)
      : super(const ReadingListState.initial()) {
    watchWishListStarted();
  }

  void watchWishListStarted() async {
    emit(const ReadingListState.loading());
    await _bookStreamSubscription?.cancel();
    _bookStreamSubscription = _bookRepository.watchWishList().listen(
          (failureOrBook) => _onBookReceived(failureOrBook),
        );
  }

  void _onBookReceived(Either<BookFailure, List<Book>> failureOrBook) {
    emit(
      failureOrBook.fold(
        (f) => ReadingListState.loadFailure(f),
        (books) => ReadingListState.loadSuccess(books),
      ),
    );
  }

  @override
  Future<void> close() async {
    await _bookStreamSubscription?.cancel();
    return super.close();
  }

  // ReadingListCubit() : super(const ReadingListState.initial());

  // void updateEmail(String typedEmail) {
  //   emit(
  //     state.copyWith(
  //       emailAddress: EmailAddress(typedEmail),
  //       loginFailureOrSuccessOption: none(),
  //     ),
  //   );
  // }

  // login successful
  // can build user session here
}
