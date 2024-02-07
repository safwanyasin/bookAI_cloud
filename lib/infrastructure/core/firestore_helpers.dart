import 'package:book_ai/domain/auth/login/i_login_facade.dart';
import 'package:book_ai/injection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

extension FirebaseFirestoreX on FirebaseFirestore {
  Future<DocumentReference> userDocument() async {
    final userOption = getIt<ILoginFacade>().getSignedInUser();
    final user = userOption.getOrElse(() => throw)
  }
}