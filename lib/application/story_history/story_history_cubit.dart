import 'dart:async';

import 'package:book_ai/domain/book/book.dart';
import 'package:book_ai/domain/book/book_failure.dart';
import 'package:book_ai/domain/book/i_book_repository.dart';
import 'package:book_ai/domain/story/i_story_repository.dart';
import 'package:book_ai/domain/story/story.dart';
import 'package:book_ai/domain/story/story_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'story_history_cubit.freezed.dart';
part 'story_history_state.dart';

// the watcher cubit will only be used to get the items from firestore
@injectable
class StoryHistoryCubit extends Cubit<StoryHistoryState> {
  final IStoryRepository _storyRepository;
  StreamSubscription<Either<StoryFailure, List<StoryItem>>>?
      _bookStreamSubscription;

  StoryHistoryCubit(this._storyRepository)
      : super(const StoryHistoryState.initial()) {
    watchStoryListStarted();
  }

  void watchStoryListStarted() async {
    emit(const StoryHistoryState.loading());
    await _bookStreamSubscription?.cancel();
    _bookStreamSubscription = _storyRepository.watchAll().listen(
          (failureOrStory) => _onStoryReceived(failureOrStory),
        );
  }

  void _onStoryReceived(Either<StoryFailure, List<StoryItem>> failureOrBook) {
    emit(
      failureOrBook.fold(
        (f) => StoryHistoryState.loadFailure(f),
        (story) => StoryHistoryState.loadSuccess(story),
      ),
    );
  }

  void deleteStory(StoryItem storyItem) async {
    final failureOrUnit = await _storyRepository.delete(storyItem);
    return failureOrUnit.fold(
      (f) => const StoryHistoryState.deleteFailure(),
      (_) => const Right(unit),
    );
  }

  @override
  Future<void> close() async {
    await _bookStreamSubscription?.cancel();
    return super.close();
  }

  // WishlistCubit() : super(const WishlistState.initial());

  // void updateEmail(String typedEmail) {
  //   emit(
  //     state.copyWith(
  //       emailAddress: EmailAddress(typedEmail),
  //       loginFailureOrSuccessOption: none(),
  //     ),
  //   );
  // }

  // login successful
  // can build user session here
}
