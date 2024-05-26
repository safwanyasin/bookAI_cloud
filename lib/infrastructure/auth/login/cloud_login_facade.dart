import 'dart:convert';
import 'package:book_ai/domain/auth/email_verification/email_verification_failure.dart';
import 'package:book_ai/domain/auth/login/i_login_facade.dart';
import 'package:book_ai/domain/auth/login/login_failure.dart';
import 'package:book_ai/domain/auth/register/register_failure.dart';
import 'package:book_ai/domain/auth/user.dart';
import 'package:book_ai/domain/auth/value_objects.dart';
import 'package:book_ai/domain/core/value_objects.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

@lazySingleton
class CloudLoginFacade implements ILoginFacade {
  final String _registerUrl =
      'https://europe-west3-taletuner-cloud.cloudfunctions.net/register';
  final String _loginUrl =
      'https://us-central1-taletuner-cloud.cloudfunctions.net/login';
  static const String apiUrl =
      'https://europe-west3-taletuner-cloud.cloudfunctions.net/getuser';
  //final Uuid _uuid = Uuid();
  // This should store the current user's token

  @override
  Future<Option<AppUser>> getSignedInUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    if (token == null) {
      return none();
    }
    dynamic response = await http.get(
      Uri.parse(apiUrl),
      headers: {
        'Authorization': token,
      },
    );
    if (response.statusCode == 200) {
      response = json.decode(response.body);
    } else {
      return none();
    }
    return some(AppUser(
      id: UniqueId.fromUniqueString(response['user_id']),
      email: EmailAddress(response['email']),
      nickname: NickName(response['nickname']),
    ));
    // } else {
    //   return none();
    // }
  }

  // @override
  // Future<bool> checkIfVerified() async {
  //   // You may need a separate endpoint for email verification if applicable
  //   return true;
  // }

  @override
  Future<Either<RegisterFailure, Unit>> registerWithEmailAndPassword({
    required NickName nickName,
    required EmailAddress emailAddress,
    required Password password,
    required ConfirmPassword confirmPassword,
  }) async {
    final nickNameStr = nickName.getOrCrash();
    final emailAddressStr = emailAddress.getOrCrash();
    final passwordStr = password.getOrCrash();
    final confirmPasswordStr = confirmPassword.getOrCrash();

    if (passwordStr != confirmPasswordStr) {
      return left(const RegisterFailure.otherFailure('Passwords do not match'));
    }

    final userId = UniqueId();

    try {
      final response = await http.post(
        Uri.parse(_registerUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'user_id': userId
              .getOrCrash(), // You need to generate or manage user IDs as per your logic
          'nickname': nickNameStr,
          'email': emailAddressStr,
          'password': passwordStr,
        }),
      );

      if (response.statusCode == 201) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        final responseBody = jsonDecode(response.body);
        await prefs.setString('token', responseBody['token']);
        return right(unit);
      } else if (response.statusCode == 401) {
        return left(const RegisterFailure.emailAlreadyInUse());
      } else {
        return left(const RegisterFailure.serverError());
      }
    } catch (e) {
      return left(const RegisterFailure.serverError());
    }
  }

  @override
  Future<Either<LoginFailure, Unit>> signInWithEmailAndPassword({
    required EmailAddress emailAddress,
    required LoginPassword password,
  }) async {
    final emailAddressStr = emailAddress.getOrCrash();
    final passwordStr = password.getOrCrash();

    try {
      final response = await http.post(
        Uri.parse(_loginUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'email': emailAddressStr,
          'password': passwordStr,
        }),
      );

      if (response.statusCode == 201) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        final responseBody = jsonDecode(response.body);
        prefs.setString('token', responseBody['token']);
        return right(unit);
      } else if (response.statusCode == 401) {
        return left(const LoginFailure.invalidEmailAndPasswordCombination());
      } else {
        return left(const LoginFailure.serverError());
      }
    } catch (e) {
      return left(const LoginFailure.serverError());
    }
  }

  // @override
  // Future<Either<LoginFailure, Unit>> signInWithGoogle() async {
  //   // Implement Google Sign-In logic here if you plan to support it via Cloud Functions
  //   return left(const LoginFailure.serverError());
  // }

  // @override
  // Future<Either<RegisterFailure, Unit>> registerWithGoogle() async {
  //   // Implement Google Sign-Up logic here if you plan to support it via Cloud Functions
  //   return left(const RegisterFailure.serverError());
  // }

  // @override
  // Future<Either<EmailVerificationFailure, Unit>> sendEmailverification() async {
  //   // Implement email verification logic if needed
  //   return left(const EmailVerificationFailure.serverError());
  // }

  // @override
  // Future<DocumentSnapshot> getUser() async {
  //   // Implement fetching user details logic if needed
  //   throw UnimplementedError();
  // }

  @override
  Future<void> signOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    // Implement sign-out logic if needed
  }
}
