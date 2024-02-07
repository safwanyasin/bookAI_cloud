import 'package:book_ai/domain/story/story.dart';
import 'package:book_ai/domain/story/story_failure.dart';
import 'package:dartz/dartz.dart';

abstract class IBookRepository {
  Stream<Either<StoryFailure, StoryItem>> watchAll();
  Future<Either<StoryFailure, Unit>> create(StoryItem note);
  Future<Either<StoryFailure, Unit>> delete(StoryItem note);
}
