import 'package:book_ai/domain/book/book.dart';
import 'package:book_ai/domain/book/book_failure.dart';
import 'package:book_ai/infrastructure/core/firestore_helpers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:book_ai/domain/book/i_book_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class BookRepository implements IBookRepository {
  final FirebaseFirestore _firestore;

  BookRepository(this._firestore);

  // the async* means that it is an asynchronous generator. we use it since we are not using a future function but a stream
  @override
  Stream<Either<BookFailure, Book>> watchReadingList() async* {
    // users/{user ID}/reading_list/{book ID}
    final userDoc = await _firestore.userDocument();
    userDoc.readingListCollection.snapshots();
  }
}
