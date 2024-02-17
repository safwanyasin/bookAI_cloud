import 'dart:async';

import 'package:book_ai/domain/book/book.dart';
import 'package:book_ai/domain/book/book_failure.dart';
import 'package:book_ai/domain/book/i_book_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'book_watcher_cubit.freezed.dart';
part 'book_watcher_state.dart';

// the watcher cubit will only be used to get the items from firestore
@injectable
class BookWatcherCubit extends Cubit<BookWatcherState> {
  final IBookRepository _bookRepository;
  StreamSubscription<Either<BookFailure, List<Book>>>? _bookStreamSubscription;

  BookWatcherCubit(this._bookRepository)
      : super(const BookWatcherState.initial()) {
    // watchReadingListStarted();
    watchWishListStarted();
  }

  void watchWishListStarted() async {
    emit(const BookWatcherState.loading());
    await _bookStreamSubscription?.cancel();
    _bookStreamSubscription = _bookRepository.watchWishList().listen(
          (failureOrBook) => _onBookReceived(failureOrBook),
        );
  }

  void watchReadingListStarted() async {
    emit(const BookWatcherState.loading());
    await _bookStreamSubscription?.cancel();
    _bookStreamSubscription = _bookRepository.watchReadingList().listen(
          (failureOrBook) => _onBookReceived(failureOrBook),
        );
  }

  void _onBookReceived(Either<BookFailure, List<Book>> failureOrBook) {
    emit(
      failureOrBook.fold(
        (f) => BookWatcherState.loadFailure(f),
        (books) => BookWatcherState.loadSuccess(books),
      ),
    );
  }

  @override
  Future<void> close() async {
    await _bookStreamSubscription?.cancel();
    return super.close();
  }

  // BookWatcherCubit() : super(const BookWatcherState.initial());

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
