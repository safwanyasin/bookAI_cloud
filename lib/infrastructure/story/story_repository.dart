import 'package:book_ai/domain/story/i_story_repository.dart';
import 'package:book_ai/domain/story/story.dart';
import 'package:book_ai/domain/story/story_failure.dart';
import 'package:book_ai/infrastructure/core/firestore_helpers.dart';
import 'package:book_ai/infrastructure/story/story_dtos.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

@lazySingleton
class StoryRepository extends IStoryRepository {
  FirebaseFirestore _firestore;

  StoryRepository(this._firestore);

  @override
  Stream<Either<StoryFailure, List<StoryItem>>> watchAll() async* {
    final userDoc = await _firestore.userDocument();
    yield* userDoc.storyCollection
        .orderBy('serverTimestamp', descending: true)
        .snapshots()
        .map((snapshot) => right<StoryFailure, List<StoryItem>>(snapshot.docs
            .map((doc) => StoryDto.fromFirestore(doc).toDomain())
            .toList()))
        .onErrorReturnWith((e, stackTrace) {
      if (e is PlatformException && e.message!.contains('PERMISSION_DENIED')) {
        return left(const StoryFailure.unexpected());
      } else {
        return left(const StoryFailure.unexpected());
      }
    });
  }

  @override
  Future<Either<StoryFailure, Unit>> create(StoryItem story) async {
    try {
      final userDoc = await _firestore.userDocument();
      final storyDto = StoryDto.fromDomain(story);

      await userDoc.wishListCollection
          .doc(storyDto.storyId)
          .set(storyDto.toJson());
      return right(unit);
    } on PlatformException catch (e) {
      if (e.message!.contains('PERMISSION_DENIED')) {
        return left(const StoryFailure.insufficientPermissions());
      } else {
        return left(const StoryFailure.unexpected());
      }
    }
  }

  @override
  Future<Either<StoryFailure, Unit>> delete(StoryItem story) async {
    try {
      final userDoc = await _firestore.userDocument();
      final storyId = story.storyId.getOrCrash();

      await userDoc.wishListCollection.doc(storyId).delete();
      return right(unit);
    } on PlatformException catch (e) {
      if (e.message!.contains('PERMISSION_DENIED')) {
        return left(const StoryFailure.insufficientPermissions());
      } else if (e.message!.contains('NOT_FOUND')) {
        return left(const StoryFailure.unableToUpdate());
      } else {
        return left(const StoryFailure.unexpected());
      }
    }
  }
}
