// import 'package:book_ai/domain/auth/login/i_login_facade.dart';
// import 'package:book_ai/domain/core/errors.dart';
// import 'package:book_ai/injection.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// extension FirebaseFirestoreX on FirebaseFirestore {
//   Future<DocumentReference> userDocument() async {
//     final userOption = await getIt<ILoginFacade>().getSignedInUser();
//     final user = userOption.getOrElse(() => throw NotAuthenticatedError());
//     return FirebaseFirestore.instance
//         .collection('users')
//         .doc(user.id.getOrCrash());
//   }
// }

// extension DocumentReferenceX on DocumentReference {
//   CollectionReference get usersCollection => collection('users');
//   CollectionReference get readingListCollection => collection('reading-list');
//   CollectionReference get wishListCollection => collection('wishlist');
//   CollectionReference get storyCollection => collection('stories');
//   CollectionReference get apiInputCollection => collection('api-key');
// }
