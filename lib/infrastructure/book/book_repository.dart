import 'package:book_ai/domain/book/book.dart';
import 'package:book_ai/domain/book/book_failure.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:book_ai/domain/book/i_book_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class BookRepository implements IBookRepository {
  final FirebaseFirestore _firestore;

  BookRepository(this._firestore);

  @override
  Stream<Either<BookFailure, Book>> watchReadingList() {
    // users/{user ID}/reading_list/{book ID}
    
  }
}
