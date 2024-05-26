import 'package:book_ai/domain/auth/email_verification/email_verification_failure.dart';
import 'package:book_ai/domain/auth/login/login_failure.dart';
import 'package:book_ai/domain/auth/register/register_failure.dart';
import 'package:book_ai/domain/auth/user.dart';
import 'package:book_ai/domain/auth/value_objects.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

// using i along means that it is just interface with no implementation

abstract class ILoginFacade {
  Future<Option<AppUser>> getSignedInUser();
  Future<Either<RegisterFailure, Unit>> registerWithEmailAndPassword({
    required NickName nickName,
    required EmailAddress emailAddress,
    required Password password,
    required ConfirmPassword confirmPassword,
  });
  Future<Either<LoginFailure, Unit>> signInWithEmailAndPassword({
    required EmailAddress emailAddress,
    required LoginPassword password,
  });
  // Future<Either<LoginFailure, Unit>> signInWithGoogle();
  // Future<Either<RegisterFailure, Unit>> registerWithGoogle();
  // Future<Either<ValueFailure, DocumentSnapshot>> getUser();
  // Future<DocumentSnapshot> getUser();
  // Future<bool> checkIfVerified();
  // Future<Either<EmailVerificationFailure, Unit>> sendEmailverification();
  Future<void> signOut();
}
