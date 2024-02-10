import 'dart:async';

import 'package:book_ai/domain/story/i_story_repository.dart';
import 'package:book_ai/domain/story/story.dart';
import 'package:book_ai/domain/story/story_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'story_watcher_cubit.freezed.dart';
part 'story_watcher_state.dart';

@injectable
class StoryWatcherCubit extends Cubit<StoryWatcherState> {
  final IStoryRepository _storyRepository;
  StreamSubscription<Either<StoryFailure, List<StoryItem>>>?
      _storyStreamSubscription;

  StoryWatcherCubit(this._storyRepository)
      : super(const StoryWatcherState.initial()) {
    watchStoriesStarted();
  }

  void watchStoriesStarted() async {
    emit(const StoryWatcherState.loading());
    await _storyStreamSubscription?.cancel();
    print('hello there');
    _storyStreamSubscription = _storyRepository.watchAll().listen(
          (failureOrStory) => _onStoryReceived(failureOrStory),
        );
  }

  void _onStoryReceived(Either<StoryFailure, List<StoryItem>> failureOrStory) {
    emit(
      failureOrStory.fold((f) => StoryWatcherState.loadFailure(f),
          (stories) => StoryWatcherState.loadSuccess(stories)),
    );
  }

  @override
  Future<void> close() async {
    await _storyStreamSubscription?.cancel();
    return super.close();
  }
}
