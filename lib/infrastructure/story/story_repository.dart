
import 'package:book_ai/domain/api_input/i_api_input_repository.dart';
import 'package:book_ai/domain/core/value_objects.dart';
import 'package:book_ai/domain/story/i_story_repository.dart';
import 'package:book_ai/domain/story/story.dart';
import 'package:book_ai/domain/story/story_failure.dart';
import 'package:book_ai/infrastructure/core/firestore_helpers.dart';
import 'package:book_ai/infrastructure/story/story_dtos.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

@lazySingleton
class StoryRepository extends IStoryRepository {
  FirebaseFirestore _firestore;
  final IApiInputRepository _apiInputRepository;
  static const String apiUrl =
      'https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent';

  StoryRepository(this._firestore, this._apiInputRepository);
  @override
  Stream<Either<StoryFailure, List<StoryItem>>> watchAll() async* {
    final userDoc = await _firestore.userDocument();
    yield* userDoc.storyCollection
        // .orderBy('serverTimestamp', descending: true)
        .snapshots()
        .map((snapshot) {
      return right<StoryFailure, List<StoryItem>>(snapshot.docs.map((doc) {
        return StoryDto.fromFirestore(doc).toDomain();
      }).toList());
    }).onErrorReturnWith((e, stackTrace) {
      if (e is PlatformException && e.message!.contains('PERMISSION_DENIED')) {
        return left(const StoryFailure.unexpected());
      } else {
        return left(const StoryFailure.unexpected());
      }
    });
  }

  @override
  Future<Either<StoryFailure, StoryDto>> createSaveAndGet(
      String searchParams) async {
    final possibleFailure = await _apiInputRepository.get();
    late String apiKey;

    possibleFailure.fold(
      (l) {
        return const StoryFailure.unexpected();
      },
      (r) => apiKey = r,
    );
    try {
      // make the openai api call here
      // print('trying to get a story');
      // print(apiKey);
      late var response, secondResponse;

      // print('trying gemini');
      // print(searchParams);
      final gemini = Gemini.instance;
      response = await gemini.text(searchParams);
      // print(response.content.parts.last.text);
      // formattedResponse =
      // body = json.decode(response);
      // print(body);
      secondResponse = await gemini.text(
          'Create a short title for the story. only include the title in the response and dont format it in any way');
      // // gemini.text(searchParams).then(
      //   (value) {
      //     response = value;
      //     // print(response.content);
      //   },
      // ).catchError(
      //   (e) => print('error $e'),
      // );

      // final responseContent = response.data['choices'][0]['message']['content'];
      // final repsonseTitle = response.data['choices'][1]['message']['content'];
      // final responseId = response.data['id'];

      final userDoc = await _firestore.userDocument();
      //print('response is: $response');
      final storyDto = StoryDto(
        content: response.content.parts.last.text,
        storyId: UniqueId().getOrCrash(),
        storyTitle: secondResponse.content.parts.last.text,
      );
      //print(storyDto);
      await userDoc.storyCollection
          .doc(storyDto.storyId)
          .set(storyDto.toJson());
      return right(storyDto);
    } catch (e) {
      // print('the error is${e.);
      return left(const StoryFailure.unexpected());
    }
    // final chatGpt = ChatGpt(apiKey: apiKey);
    // final prompt = 'create a short futuristic story for me';
    // final request = ChatCompletionRequest(
    //   model: ChatGptModel.gpt35Turbo.modelName,
    //   messages: [
    //     Message(role: 'assistant', content: 'create a futuristic story for me'),
    //     Message(role: 'assistant', content: 'Suggest me a title for the story'),
    //   ],
    // );
    // final result = await chatGpt.createChatCompletion(request);
    // final storyDto = StoryDto(
    //     storyId: result!.id!,
    //     content: result.choices![0].message!.content,
    //     storyTitle: result.choices![1].message!.content);
    // return right(storyDto);
  }

  @override
  Future<Either<StoryFailure, Unit>> delete(StoryItem story) async {
    try {
      final userDoc = await _firestore.userDocument();
      final storyId = story.storyId.getOrCrash();

      await userDoc.storyCollection.doc(storyId).delete();
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
