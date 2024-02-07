import 'package:book_ai/domain/book/i_book_repository.dart';
import 'package:book_ai/infrastructure/book/book_repository.dart';
import 'package:book_ai/injection.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:book_ai/infrastructure/auth/login/firebase_login_facade.dart';
import 'package:book_ai/domain/auth/login/i_login_facade.dart';

@module
abstract class InjectableModule {
  @lazySingleton
  FirebaseAuth get firebaseAuth => FirebaseAuth.instance;

  @lazySingleton
  GoogleSignIn get googleSignIn => GoogleSignIn();

  @lazySingleton
  ILoginFacade get loginFacade => FirebaseLoginFacade(
        getIt<FirebaseAuth>(),
        getIt<GoogleSignIn>(),
      );

  @lazySingleton
  IBookRepository get bookRepository => BookRepository();
}
