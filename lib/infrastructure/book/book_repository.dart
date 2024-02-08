import 'package:book_ai/domain/book/book.dart';
import 'package:book_ai/domain/book/book_failure.dart';
import 'package:book_ai/infrastructure/book/book_dtos.dart';
import 'package:book_ai/infrastructure/core/firestore_helpers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:book_ai/domain/book/i_book_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import  'package:rxdart/rxdart.dart';

@lazySingleton
class BookRepository implements IBookRepository {
  final FirebaseFirestore _firestore;

  BookRepository(this._firestore);

  // the async* means that it is an asynchronous generator. we use it since we are not using a future function but a stream
  @override
  Stream<Either<BookFailure, List<Book>>> watchReadingList() async* {
    // users/{user ID}/reading_list/{book ID}
    final userDoc = await _firestore.userDocument();
    yield* userDoc.readingListCollection
        .orderBy('serverTimestamp', descending: true)
        .snapshots()
        .map((snapshot) => right<BookFailure, List<Book>>(snapshot.docs
            .map((doc) => BookDto.fromFirestore(doc).toDomain())
            .toList())).onErrorReturnWith((e, stackTrace) {
              if (e is PlatformException && e.message!.contains('PERMISSION_DENIED')) {
                return left(const BookFailure.insufficientPermissions());
              } else {
                return left(const BookFailure.unexpected());
              }
            });
  }

  @override
  Stream<Either<BookFailure, List<Book>>> watchWishList() async* {
    final userDoc = await _firestore.userDocument();
    yield* userDoc.wishListCollection
        .orderBy('serverTimestamp', descending: true)
        .snapshots()
        .map((snapshot) => right<BookFailure, List<Book>>(snapshot.docs
            .map((doc) => BookDto.fromFirestore(doc).toDomain())
            .toList())).onErrorReturnWith((e, stackTrace) {
              if (e is PlatformException && e.message!.contains('PERMISSION_DENIED')) {
                return left(const BookFailure.insufficientPermissions());
              } else {
                return left(const BookFailure.unexpected());
              }
            });
  }

  @override
  Future<Either<BookFailure, Unit>> create(Book note) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<Either<BookFailure, Unit>> delete(Book note) {
    // TODO: implement delete
    throw UnimplementedError();
  }
}
