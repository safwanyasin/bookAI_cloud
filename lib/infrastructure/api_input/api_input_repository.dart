import 'package:book_ai/domain/api_input/api_input_failure.dart';
import 'package:book_ai/domain/api_input/i_api_input_repository.dart';
import 'package:book_ai/domain/auth/value_objects.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class ApiInputRepository extends IApiInputRepository {
  // final FirebaseFirestore _firestore;
  // ApiInputRepository(this._firestore);
  ApiInputRepository();
  @override
  Future<Either<ApiInputFailure, Unit>> create(ApiInput apikey) async {
    // code that can be used if apikey needs to be stored in firebase
    // try {
    //   final userDoc = await _firestore.userDocument();
    //   final apiKeyStr = apikey.getOrCrash();
    //   await userDoc.update({'api-key': apiKeyStr});
    //   return right(unit);
    // } on PlatformException catch (e) {
    //   if (e.message!.contains('PERMISSION_DENIED')) {
    //     return left(const ApiInputFailure.insufficientPermissions());
    //   } else {
    //     return left(const ApiInputFailure.unexpected());
    //   }
    // }
    try {
      // Get instance of SharedPreferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      // Store the API key
      await prefs.setString('apiKey', apikey.getOrCrash());
      // print('API key stored successfully');
      return right(unit);
    } catch (e) {
      // print('Error storing API key: $e');
      return left(const ApiInputFailure.unexpected());
    }
  }

  @override
  Future<Either<ApiInputFailure, Unit>> createEmpty() async {
    // code that can be used if apikey needs to be stored in firebase
    // try {
    //   final userDoc = await _firestore.userDocument();
    //   await userDoc.update({'api-key': ''});
    //   return right(unit);
    // } on PlatformException catch (e) {
    //   if (e.message!.contains('PERMISSION_DENIED')) {
    //     return left(const ApiInputFailure.insufficientPermissions());
    //   } else {
    //     return left(const ApiInputFailure.unexpected());
    //   }
    // }
    try {
      // Get instance of SharedPreferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      // Store the API key
      await prefs.setString('apiKey', '');
      // print('API key stored successfully');
      return right(unit);
    } catch (e) {
      // print('Error storing API key: $e');
      return left(const ApiInputFailure.unexpected());
    }
  }

  @override
  Future<Either<ApiInputFailure, String>> get() async {
    try {
      // Get instance of SharedPreferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      // Retrieve the API key
      String? apiKey = prefs.getString('apiKey');
      return right(apiKey!);
    } catch (e) {
      // print('Error retrieving API key: $e');
      // Handle errors as needed
      return left(const ApiInputFailure.unexpected());
    }
  }

  @override
  Future<Either<ApiInputFailure, Unit>> delete() async {
    try {
      // Get instance of SharedPreferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      // Remove the API key
      await prefs.remove('apiKey');
      return right(unit);
    } catch (e) {
      // print('Error deleting API key: $e');
      return left(const ApiInputFailure.unexpected());
    }
  }
}
