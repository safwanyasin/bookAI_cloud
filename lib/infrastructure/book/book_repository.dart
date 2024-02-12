import 'package:book_ai/domain/book/book.dart';
import 'package:book_ai/domain/book/book_failure.dart';
import 'package:book_ai/infrastructure/book/book_dtos.dart';
import 'package:book_ai/infrastructure/core/firestore_helpers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:book_ai/domain/book/i_book_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

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
        // .orderBy('serverTimestamp', descending: true)
        .snapshots()
        .map((snapshot) => right<BookFailure, List<Book>>(snapshot.docs
            .map((doc) => BookDto.fromFirestore(doc).toDomain())
            .toList()))
        .onErrorReturnWith((e, stackTrace) {
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
        // .orderBy('serverTimestamp', descending: true)
        .snapshots()
        .map((snapshot) => right<BookFailure, List<Book>>(snapshot.docs
            .map((doc) => BookDto.fromFirestore(doc).toDomain())
            .toList()))
        .onErrorReturnWith((e, stackTrace) {
      if (e is PlatformException && e.message!.contains('PERMISSION_DENIED')) {
        return left(const BookFailure.insufficientPermissions());
      } else {
        return left(const BookFailure.unexpected());
      }
    });
  }

  @override
  Future<Either<BookFailure, bool>> findInWishlist(Book book) async {
    try {
      final bookId = book.bookId.getOrCrash();
      final userDoc = await _firestore.userDocument();
      final wishListSnapshot = await userDoc.wishListCollection.get();
      final isInWishList = wishListSnapshot.docs.any((doc) => doc.id == bookId);
      return right(isInWishList);
    } on PlatformException catch (e) {
      if (e.message!.contains('PERMISSION_DENIED')) {
        return left(const BookFailure.insufficientPermissions());
      } else {
        return left(const BookFailure.unexpected());
      }
    }
  }

  @override
  Future<Either<BookFailure, bool>> findInReadingList(Book book) async {
    try {
      final bookId = book.bookId.getOrCrash();
      final userDoc = await _firestore.userDocument();
      final readingListSnapshot = await userDoc.readingListCollection.get();
      final isInReadingList =
          readingListSnapshot.docs.any((doc) => doc.id == bookId);
      return right(isInReadingList);
    } on PlatformException catch (e) {
      if (e.message!.contains('PERMISSION_DENIED')) {
        return left(const BookFailure.insufficientPermissions());
      } else {
        return left(const BookFailure.unexpected());
      }
    }
  }

  @override
  Future<Either<BookFailure, List<Book>>> get(String searchTerm) async {
    try {
      searchTerm = searchTerm.trim();
      searchTerm = searchTerm.replaceAll(RegExp(r'\s+'), ' ');
      searchTerm = searchTerm.replaceAll(' ', '+');
      final dio = Dio();
      // final response = await dio
      //     .get("https://www.googleapis.com/books/v1/volumes?q=$searchTerm");
      final Response response = await Dio().get(
        "https://www.googleapis.com/books/v1/volumes",
        queryParameters: {
          'q': searchTerm,
          'maxResults': 40, // Set maxResults to 40
        },
      );
      // print(response);
      final List<Book> books = (response.data['items'] as List)
          .map((item) => Book.fromGoogleBooksApi(item))
          .toList();
      // print(books);
      return right(books);
    } on PlatformException catch (e) {
      print(e.message);
      return left(const BookFailure.unexpected());
    }
  }

  @override
  Future<Either<BookFailure, Unit>> create(Book book, bool toWishlist) async {
    try {
      final userDoc = await _firestore.userDocument();
      final bookDto = BookDto.fromDomain(book);

      toWishlist
          ? await userDoc.wishListCollection
              .doc(bookDto.bookId)
              .set(bookDto.toJson())
          : await userDoc.readingListCollection
              .doc(bookDto.bookId)
              .set(bookDto.toJson());
      return right(unit);
    } on PlatformException catch (e) {
      if (e.message!.contains('PERMISSION_DENIED')) {
        return left(const BookFailure.insufficientPermissions());
      } else {
        return left(const BookFailure.unexpected());
      }
    }
  }

  @override
  Future<Either<BookFailure, Unit>> update(Book book, bool toWishlist) async {
    try {
      final userDoc = await _firestore.userDocument();
      final bookDto = BookDto.fromDomain(book);

      toWishlist
          ? await userDoc.wishListCollection
              .doc(bookDto.bookId)
              .set(bookDto.toJson())
          : await userDoc.readingListCollection
              .doc(bookDto.bookId)
              .update(bookDto.toJson());
      return right(unit);
    } on PlatformException catch (e) {
      if (e.message!.contains('PERMISSION_DENIED')) {
        return left(const BookFailure.insufficientPermissions());
      } else if (e.message!.contains('NOT_FOUND')) {
        return left(const BookFailure.unableToUpdate());
      } else {
        return left(const BookFailure.unexpected());
      }
    }
  }

  @override
  Future<Either<BookFailure, Unit>> delete(Book book, bool fromWishlist) async {
    try {
      final userDoc = await _firestore.userDocument();
      final bookId = book.bookId.getOrCrash();

      fromWishlist
          ? await userDoc.wishListCollection.doc(bookId).delete()
          : await userDoc.readingListCollection.doc(bookId).delete();
      return right(unit);
    } on PlatformException catch (e) {
      if (e.message!.contains('PERMISSION_DENIED')) {
        return left(const BookFailure.insufficientPermissions());
      } else if (e.message!.contains('NOT_FOUND')) {
        return left(const BookFailure.unableToUpdate());
      } else {
        return left(const BookFailure.unexpected());
      }
    }
  }
}
