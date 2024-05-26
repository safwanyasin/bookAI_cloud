import 'dart:convert';

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
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class StoryApiService {
  static const String apiUrl =
      'https://europe-west3-taletuner-cloud.cloudfunctions.net';

  Future<List<Map<String, dynamic>>> fetchStories() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    if (token == null) {
      throw Exception('Token not found');
    }

    final response = await http.get(
      Uri.parse('$apiUrl/generated-stories/get'),
      headers: {
        'Authorization': token,
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return List<Map<String, dynamic>>.from(data['data']);
    } else {
      throw Exception('Failed to fetch stories');
    }
  }

  Future<void> addStory(StoryDto storyData) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    if (token == null) {
      throw Exception('Token not found');
    }

    final response = await http.post(
      Uri.parse('$apiUrl/generated-stories/add'),
      headers: {
        'Authorization': token,
        'Content-Type': 'application/json',
      },
      body: jsonEncode(storyData),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to add story');
    }
  }

  Future<void> deleteStory(String storyId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    if (token == null) {
      throw Exception('Token not found');
    }

    final response = await http.delete(
      Uri.parse('$apiUrl/generated-stories/delete/$storyId'),
      headers: {
        'Authorization': token,
      },
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to delete story');
    }
  }
}

@lazySingleton
class StoryRepository extends IStoryRepository {
  final StoryApiService _apiService;
  StoryRepository(this._apiService);
  @override
  Stream<Either<StoryFailure, List<StoryItem>>> watchAll() async* {
    try {
      final List<Map<String, dynamic>> storyData =
          await _apiService.fetchStories();
      final stories =
          storyData.map((data) => StoryDto.fromJson(data).toDomain()).toList();
      yield right(stories);
    } catch (e) {
      if (e is PlatformException && e.message!.contains('PERMISSION_DENIED')) {
        yield left(const StoryFailure.insufficientPermissions());
      } else {
        yield left(const StoryFailure.unexpected());
      }
    }
  }

  @override
  Future<Either<StoryFailure, StoryDto>> createSaveAndGet(
      String searchParams) async {
    // final possibleFailure = await _apiInputRepository.get();
    // late String apiKey;

    // possibleFailure.fold(
    //   (l) {
    //     return const StoryFailure.unexpected();
    //   },
    //   (r) => apiKey = r,
    // );
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

      // final userDoc = await _firestore.userDocument();
      //print('response is: $response');
      final storyDto = StoryDto(
        //content: response.content.parts.last.text,
        content:
            'once upon a time there was a guy and a girl who loved each other',
        story_id: UniqueId().getOrCrash(),
        // storyTitle: secondResponse.content.parts.last.text,
        title: 'love story',
      );

      await _apiService.addStory(storyDto);
      //print(storyDto);
      // await userDoc.storyCollection
      //     .doc(storyDto.storyId)
      //     .set(storyDto.toJson());
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
      final storyId = story.storyId.getOrCrash();
      await _apiService.deleteStory(storyId);
      return right(unit);
    } catch (e) {
      if (e is PlatformException) {
        return left(const StoryFailure.insufficientPermissions());
      } else {
        return left(const StoryFailure.unexpected());
      }
    }
  }
}
