import 'package:book_ai/domain/book/book.dart';
import 'package:book_ai/domain/book/book_failure.dart';
import 'package:dartz/dartz.dart';

abstract class IBookRepository {
  Stream<Either<BookFailure, List<Book>>> watchReadingList();
  Stream<Either<BookFailure, List<Book>>> watchWishList();
  Future<Either<BookFailure, List<Book>>> get(String searchTerms);
  Future<Either<BookFailure, Unit>> create(Book note, bool toWishlist);
  Future<Either<BookFailure, Unit>> update(Book note, bool toWishlist);
  Future<Either<BookFailure, Unit>> delete(Book note, bool fromWishlist);
}
