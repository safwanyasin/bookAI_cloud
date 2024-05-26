import 'dart:convert';

import 'package:book_ai/domain/book/book.dart';
import 'package:book_ai/domain/book/book_failure.dart';
import 'package:book_ai/infrastructure/book/book_dtos.dart';
// import 'package:book_ai/infrastructure/core/firestore_helpers.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:book_ai/domain/book/i_book_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  final String apiUrl = 'https://europe-west3-taletuner-cloud.cloudfunctions.net';

  Future<List<Book>> fetchReadingList(String token) async {
    final response = await http.get(
      Uri.parse('$apiUrl/reading-list/get'),
      headers: {
        'Authorization': token,
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body)['data'];
      return data.map((item) => BookDto.fromJson(item).toDomain()).toList();
    } else {
      throw Exception('Failed to load reading list');
    }
  }

  Future<List<Book>> fetchWishlist(String token) async {
    final response = await http.get(
      Uri.parse('$apiUrl/wishlist/get'),
      headers: {
        'Authorization': token,
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body)['data'];
      return data.map((item) => BookDto.fromJson(item).toDomain()).toList();
    } else {
      throw Exception('Failed to load wishlist');
    }
  }

  Future<bool> findInReadingList(String bookId, String token) async {
    final response = await http.get(
      Uri.parse('$apiUrl/reading-list/find/$bookId'),
      headers: {
        'Authorization': token,
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final value = jsonDecode(response.body)['found'];
      return value;
    } else {
      throw Exception('Failed to load reading list');
    }
  }

  Future<bool> findInWishlist(String bookId, String token) async {
    final response = await http.get(
      Uri.parse('$apiUrl/wishlist/find/$bookId'),
      headers: {
        'Authorization': token,
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final value = jsonDecode(response.body)['found'];
      return value;
    } else {
      throw Exception('Failed to load wishlist');
    }
  }  

  Future<void> add(BookDto bookDto, String token, bool toWishlist) async {
    final String completeUrl = toWishlist ? '$apiUrl/wishlist/add' : '$apiUrl/reading-list/add';
    final response = await http.post(
      Uri.parse(completeUrl), 
      headers: {
        'Authorization': token,
        'Content-Type': 'application/json',
      },
      body: jsonEncode(bookDto.toJson()),
    );

    if (response.statusCode != 200) {
      toWishlist ? throw Exception('Failed to add book to wishlist') : throw Exception('Failed to add book to reading list');
    }
  }

  Future<void> delete(String bookId, String token, bool fromWishlist) async {
    final String completeUrl = fromWishlist ? '$apiUrl/wishlist/delete' : '$apiUrl/reading-list/delete';
    final response = await http.delete(
      Uri.parse(completeUrl),
      headers: {
        'Authorization': token,
      },
    );

    if (response.statusCode != 200) {
      fromWishlist ? throw Exception('Failed to delete book from wishlist') : throw Exception('Failed to delete book from reading list');
    }
  }
}

@lazySingleton
class BookRepository implements IBookRepository {
  //final FirebaseFirestore _firestore;
  final ApiService _apiService;
  BookRepository(this._apiService);

  // the async* means that it is an asynchronous generator. we use it since we are not using a future function but a stream
  @override
  Stream<Either<BookFailure, List<Book>>> watchReadingList() async* {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    if (token == null) {
      yield left(const BookFailure.unexpected());
      return;
    }

    // users/{user ID}/reading_list/{book ID}
    try {
      final List<Book> readingList = await _apiService.fetchReadingList(token);
      yield right<BookFailure, List<Book>>(readingList);
    } catch (e) {
      yield left(BookFailure.unexpected());
    }
  }

  @override
  Stream<Either<BookFailure, List<Book>>> watchWishList() async* {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    if (token == null) {
      yield left(const BookFailure.unexpected());
      return;
    }

    // users/{user ID}/reading_list/{book ID}
    try {
      final List<Book> readingList = await _apiService.fetchWishlist(token);
      yield right<BookFailure, List<Book>>(readingList);
    } catch (e) {
      yield left(BookFailure.unexpected());
    }
  }

  @override
  Future<Either<BookFailure, bool>> findInWishlist(Book book) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    if (token == null) {
      return left(const BookFailure.unexpected());
    }
    try {
      final bookId = book.bookId.getOrCrash();
      final isInWishList = await _apiService.findInWishlist(bookId, token);
      return right(isInWishList);
    } on Exception catch (e) {
      return left(const BookFailure.unexpected());
    }
  }

  @override
  Future<Either<BookFailure, bool>> findInReadingList(Book book) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    if (token == null) {
      return left(const BookFailure.unexpected());
    }
    try {
      final bookId = book.bookId.getOrCrash();
      final isInReadingList = await _apiService.findInReadingList(bookId, token);
      return right(isInReadingList);
    } on Exception catch (e) {
      return left(const BookFailure.unexpected());
    }
  }

  // makes an api call to google books
  @override
  Future<Either<BookFailure, List<Book>>> get(String searchTerm) async {
    try {
      searchTerm = searchTerm.trim();
      searchTerm = searchTerm.replaceAll(RegExp(r'\s+'), ' ');
      searchTerm = searchTerm.replaceAll(' ', '+');
      final dio = Dio();
      // final response = await dio
      //     .get("https://www.googleapis.com/books/v1/volumes?q=$searchTerm");
      final Response response = await dio.get(
        "https://europe-west3-taletuner-cloud.cloudfunctions.net/search?query=$searchTerm",
        // queryParameters: {
        //   'q': searchTerm,
        //   'maxResults': 40, // Set maxResults to 40
        // },
      );
      final bookList = response.data != null
          ? (response.data as List)
          : [];
      final List<Book> books =
          bookList.map((item) => Book.fromGoogleBooksApi(item)).toList();
      // print(books);
      return right(books);
    } on PlatformException catch (e) {
      return left(const BookFailure.unexpected());
    }
  }

  // adds a book to the the wishlist or reading list
  @override
  Future<Either<BookFailure, Unit>> create(Book book, bool toWishlist) async {
   try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');

      if (token == null) {
        return left(const BookFailure.unexpected());
      }
      final bookDto = BookDto.fromDomain(book);
      await _apiService.add(bookDto, token, toWishlist);
      return right(unit);
    } catch (e) {
      if (e is PlatformException && e.message!.contains('PERMISSION_DENIED')) {
        return left(const BookFailure.insufficientPermissions());
      } else {
        return left(const BookFailure.unexpected());
      }
    }
  }

  // updates the book details on the wishlist or reading list
  @override
  Future<Either<BookFailure, Unit>> update(Book book, bool toWishlist) async {
   try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');

      if (token == null) {
        return left(const BookFailure.unexpected());
      }
      final bookDto = BookDto.fromDomain(book);
      await _apiService.add(bookDto, token, toWishlist);
      return right(unit);
    } catch (e) {
      if (e is PlatformException && e.message!.contains('PERMISSION_DENIED')) {
        return left(const BookFailure.insufficientPermissions());
      } else {
        return left(const BookFailure.unexpected());
      }
    }
  }

  // removes a book from the wishlist or reading list
  @override
  Future<Either<BookFailure, Unit>> delete(Book book, bool fromWishlist) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');

      if (token == null) {
        return left(const BookFailure.unexpected());
      }

      final bookId = book.bookId.getOrCrash();

      await _apiService.delete(bookId, token, fromWishlist);
      

      return right(unit);
    } catch (e) {
      if (e is PlatformException && e.message!.contains('PERMISSION_DENIED')) {
        return left(const BookFailure.insufficientPermissions());
      } else if (e is PlatformException && e.message!.contains('NOT_FOUND')) {
        return left(const BookFailure.unableToUpdate());
      } else {
        return left(const BookFailure.unexpected());
      }
    }
  }
}
