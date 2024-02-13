import 'package:book_ai/domain/api_input/api_input_failure.dart';
import 'package:book_ai/domain/api_input/i_api_input_repository.dart';
import 'package:book_ai/domain/auth/value_objects.dart';
import 'package:book_ai/infrastructure/core/firestore_helpers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ApiInputRepository extends IApiInputRepository {
  final FirebaseFirestore _firestore;
  ApiInputRepository(this._firestore);

  @override
  Future<Either<ApiInputFailure, Unit>> create(ApiInput apikey) async {
    try {
      final userDoc = await _firestore.userDocument();
      final apiKeyStr = apikey.getOrCrash();
      await userDoc.update({'api-key': apiKeyStr});
      return right(unit);
    } on PlatformException catch (e) {
      if (e.message!.contains('PERMISSION_DENIED')) {
        return left(const ApiInputFailure.insufficientPermissions());
      } else {
        return left(const ApiInputFailure.unexpected());
      }
    }
  }
}
