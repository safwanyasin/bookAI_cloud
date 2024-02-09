import 'package:book_ai/domain/story/i_story_repository.dart';
import 'package:book_ai/domain/story/story.dart';
import 'package:book_ai/domain/story/story_failure.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'story_actor_state.dart';
part 'story_actor_cubit.freezed.dart';

@injectable
class StoryActorCubit extends Cubit<StoryActorState> {
  final IStoryRepository _storyRepository;

  StoryActorCubit(this._storyRepository)
      : super(const StoryActorState.initial());

  Future<void> delete(StoryItem story) async {
    emit(const StoryActorState.actionInProgress());
    final possibleFailure = await _storyRepository.delete(story);
    emit(
      possibleFailure.fold(
        (f) => StoryActorState.deleteFailure(f),
        (_) => const StoryActorState.deleteSuccess(),
      ),
    );
  }
}
