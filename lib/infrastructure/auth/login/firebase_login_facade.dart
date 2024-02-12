// this facade is in infrastructure layer because it deals with third parties

import 'package:book_ai/domain/auth/login/i_login_facade.dart';
import 'package:book_ai/domain/auth/login/login_failure.dart';
import 'package:book_ai/domain/auth/register/register_failure.dart';
import 'package:book_ai/domain/auth/user.dart';
import 'package:book_ai/domain/auth/value_objects.dart';
import 'package:book_ai/domain/core/value_objects.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import './firebase_user_mapper.dart';

@lazySingleton
class FirebaseLoginFacade implements ILoginFacade {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  FirebaseLoginFacade(
    this._firebaseAuth,
    this._googleSignIn,
  );

  @override
  Future<Option<AppUser>> getSignedInUser() async =>
      optionOf(_firebaseAuth.currentUser?.toDomain());
  // Future<Option<AppUser>> getSignedInUser() async {
  // some(
  //   User(
  //     id: UniqueId.fromUniqueString(
  //       _firebaseAuth.currentUser!.uid,
  //     ),
  //   ),
  // );
  // return optionOf(_firebaseAuth.currentUser?.toDomain());

  // try {
  //   User? user = _firebaseAuth.currentUser;

  //   if (user == null) {
  //     return none();
  //   }

  //   AppUser appUser = user.toDomain();
  //   return some(appUser);
  // } catch (e) {
  //   print('error getting signed in user');
  //   return none();
  // }
  // }

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

  @override
  Future<void> signOut() {
    return Future.wait([
      _firebaseAuth.signOut(),
      _googleSignIn.signOut(),
    ]);
  }
}
