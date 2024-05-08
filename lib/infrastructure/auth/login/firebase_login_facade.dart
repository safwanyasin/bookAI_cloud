// this facade is in infrastructure layer because it deals with third parties

import 'package:book_ai/domain/auth/email_verification/email_verification_failure.dart';
import 'package:book_ai/domain/auth/login/i_login_facade.dart';
import 'package:book_ai/domain/auth/login/login_failure.dart';
import 'package:book_ai/domain/auth/register/register_failure.dart';
import 'package:book_ai/domain/auth/user.dart';
import 'package:book_ai/domain/auth/value_objects.dart';
import 'package:book_ai/infrastructure/core/firestore_helpers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import './firebase_user_mapper.dart';

@lazySingleton
class FirebaseLoginFacade implements ILoginFacade {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  FirebaseLoginFacade(
    this._firebaseAuth,
    this._googleSignIn,
  );
  // gets the details of the signed in user
  @override
  Future<Option<AppUser>> getSignedInUser() async =>
      optionOf(_firebaseAuth.currentUser?.toDomain());

  // checks if firebase user has done email verification
  @override
  Future<bool> checkIfVerified() async {
    await _firebaseAuth.currentUser?.reload();
    final isVerified = _firebaseAuth.currentUser?.emailVerified;
    // print('from firebase isVerified: $isVerified');
    if (isVerified == true) {
      return true;
    } else {
      return false;
    }
  }

  // handles user registration with email in firebase
  @override
  Future<Either<RegisterFailure, Unit>> registerWithEmailAndPassword(
      {required NickName nickName,
      required EmailAddress emailAddress,
      required Password password,
      required ConfirmPassword confirmPassword}) async {
    // _firebaseAuth.currentUser!().then((value) => value.uid);
    final nickNameStr = nickName.getOrCrash();
    final emailAddressStr = emailAddress.getOrCrash();
    final passwordStr = password.getOrCrash();
    final confirmPasswordStr = confirmPassword.getOrCrash();
    // converting the exceptions to failures
    if (passwordStr != confirmPasswordStr) {
      return left(const RegisterFailure.otherFailure('Passwords do not match'));
    }
    try {
      UserCredential result =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: emailAddressStr,
        password: passwordStr,
      );
      User? user = result.user;
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user!.uid)
          .set({'nickname': nickNameStr});
      return right(unit);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        return left(const RegisterFailure.emailAlreadyInUse());
      } else {
        return left(const RegisterFailure.serverError());
      }
    }
  }

  // handles user login with email in firebase
  @override
  Future<Either<LoginFailure, Unit>> signInWithEmailAndPassword(
      {required EmailAddress emailAddress,
      required LoginPassword password}) async {
    final emailAddressStr = emailAddress.getOrCrash();
    final passwordStr = password.getOrCrash();
    // converting the exceptions to failures
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: emailAddressStr,
        password: passwordStr,
      );
      return right(unit);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-credential' ||
          e.code == 'user-not-found' ||
          e.code == 'wrong-password') {
        return left(const LoginFailure.invalidEmailAndPasswordCombination());
      } else {
        return left(const LoginFailure.serverError());
      }
    }
  }

  // handles user login with google
  @override
  Future<Either<LoginFailure, Unit>> signInWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        return left(const LoginFailure.cancelledByUser());
      }
      final googleAuthentication = await googleUser.authentication;

      final authCredential = GoogleAuthProvider.credential(
        idToken: googleAuthentication.idToken,
        accessToken: googleAuthentication.accessToken,
      );

      return _firebaseAuth
          .signInWithCredential(authCredential)
          .then((r) => right(unit));
    } on FirebaseAuthException catch (_) {
      return left(const LoginFailure.serverError());
    }
  }

  // handles user registration with google
  @override
  Future<Either<RegisterFailure, Unit>> registerWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        return left(const RegisterFailure.cancelledByUser());
      }
      final googleAuthentication = await googleUser.authentication;

      final authCredential = GoogleAuthProvider.credential(
        idToken: googleAuthentication.idToken,
        accessToken: googleAuthentication.accessToken,
      );

      return _firebaseAuth
          .signInWithCredential(authCredential)
          .then((r) => right(unit));
    } on FirebaseAuthException catch (_) {
      return left(const RegisterFailure.serverError());
    }
  }

  // sends verification email to the user
  @override
  Future<Either<EmailVerificationFailure, Unit>> sendEmailverification() async {
    try {
      await _firebaseAuth.currentUser?.sendEmailVerification();
      return right(unit);
    } on FirebaseAuthException catch (_) {
      return left(const EmailVerificationFailure.serverError());
    }
  }

  // @override
  // Future<Either<ValueFailure, DocumentSnapshot>> getUser() async {
  //   final userDoc = await FirebaseFirestore.instance.userDocument();
  //   final user = await userDoc.get();
  //   return right(user);
  // }
  // gets snapshot of the user
  @override
  Future<DocumentSnapshot> getUser() async {
    final userDetails = await FirebaseFirestore.instance.userDocument();
    final snapshot = await userDetails.get();
    return snapshot;
  }
  // signs out the user
  @override
  Future<void> signOut() async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.remove('apiKey');
    await _firebaseAuth.signOut();
    await _googleSignIn.signOut();
    // return Future.wait([
    //   _firebaseAuth.signOut(),
    //   _googleSignIn.signOut(),
    // ]);
  }
}
