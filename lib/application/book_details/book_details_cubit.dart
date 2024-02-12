import 'dart:async';

import 'package:book_ai/domain/book/book.dart';
import 'package:book_ai/domain/book/book_failure.dart';
import 'package:book_ai/domain/book/i_book_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'book_details_cubit.freezed.dart';
part 'book_details_state.dart';

// the watcher cubit will only be used to get the items from firestore
@injectable
class BookDetailsCubit extends Cubit<BookDetailsState> {
  final IBookRepository _bookRepository;
  late bool isInWishlist, isInReadingList;

  BookDetailsCubit(this._bookRepository)
      : super(const BookDetailsState.initial());

  Future<void> findInLists(Book book) async {
    emit(const BookDetailsState.loading());
    // await _bookStreamSubscription?.cancel();
    // _bookStreamSubscription = _bookRepository.watchReadingList().listen(
    //       (failureOrBook) => _onBookReceived(failureOrBook),
    //     );
    Either<BookFailure, bool> checkIfExistsInReading =
        await _bookRepository.findInReadingList(book);
    Either<BookFailure, bool> checkIfExistsInWish =
        await _bookRepository.findInWishlist(book);
    print(checkIfExistsInWish);
    print(checkIfExistsInReading);
    emit(
      checkIfExistsInReading.fold(
          (f) => BookDetailsState.loadFailure(f),
          (inReading) => checkIfExistsInWish.fold(
                (fail) => BookDetailsState.loadFailure(fail),
                (inWish) => BookDetailsState.loadSuccess(inReading, inWish),
              )),
    );
  }

  void addToWishlist(Book book) async {
    emit(const BookDetailsState.loading());
    Either<BookFailure, Unit> add = await _bookRepository.create(book, true);
    emit(
      add.fold(
        (f) => BookDetailsState.loadFailure(f),
        (success) {
          return BookDetailsState.initial();
        },
      ),
    );
  }

  void addToReadingList(Book book) async {
    emit(const BookDetailsState.loading());
    Either<BookFailure, Unit> add = await _bookRepository.create(book, false);
    emit(
      add.fold(
        (f) => BookDetailsState.loadFailure(f),
        (success) => BookDetailsState.initial(),
      ),
    );
  }

  void removeFromWishlist(Book book) async {
    emit(const BookDetailsState.loading());
    Either<BookFailure, Unit> remove = await _bookRepository.delete(book, true);
    emit(
      remove.fold(
        (f) => BookDetailsState.loadFailure(f),
        (success) => BookDetailsState.initial(),
      ),
    );
  }

  void removeFromReadingList(Book book) async {
    emit(const BookDetailsState.loading());
    Either<BookFailure, Unit> remove =
        await _bookRepository.delete(book, false);
    emit(
      remove.fold(
        (f) => BookDetailsState.loadFailure(f),
        (success) => BookDetailsState.initial(),
      ),
    );
  }

  // BookDetailsCubit() : super(const BookDetailsState.initial());

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
