import 'package:book_ai/domain/book/book.dart';
import 'package:book_ai/domain/book/book_failure.dart';
import 'package:dartz/dartz.dart';

abstract class IBookRepository {
  Stream<Either<BookFailure, Book>> watchReadingList();
  Stream<Either<BookFailure, Book>> watchWishList();
  Future<Either<BookFailure, Unit>> create(Book note);
  Future<Either<BookFailure, Unit>> delete(Book note);
}
