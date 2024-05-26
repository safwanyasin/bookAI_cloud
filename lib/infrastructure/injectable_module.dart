import 'package:book_ai/domain/api_input/i_api_input_repository.dart';
import 'package:book_ai/domain/book/i_book_repository.dart';
import 'package:book_ai/domain/story/i_story_repository.dart';
import 'package:book_ai/infrastructure/api_input/api_input_repository.dart';
import 'package:book_ai/infrastructure/book/book_repository.dart';
import 'package:book_ai/infrastructure/story/story_repository.dart';
import 'package:book_ai/injection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:book_ai/infrastructure/auth/login/cloud_login_facade.dart';
import 'package:book_ai/domain/auth/login/i_login_facade.dart';

@module
abstract class InjectableModule {
  // @lazySingleton
  // FirebaseAuth get firebaseAuth => FirebaseAuth.instance;

  @lazySingleton
  GoogleSignIn get googleSignIn => GoogleSignIn();

  @lazySingleton
  Dio get dio => Dio();

  // @lazySingleton
  // FirebaseFirestore get firebaseFirestore => FirebaseFirestore.instance;

  @lazySingleton
  ILoginFacade get loginFacade => CloudLoginFacade(
      // getIt<FirebaseAuth>(),
      // getIt<GoogleSignIn>(),
      );

  @lazySingleton
  IBookRepository get bookRepository => BookRepository(
        getIt<ApiService>(),
      );

  @lazySingleton
  IStoryRepository get storyRepository => StoryRepository(
        getIt<FirebaseFirestore>(),
        getIt<IApiInputRepository>(),
      );
  @lazySingleton
  IApiInputRepository get apiInputRepository => ApiInputRepository();
}
