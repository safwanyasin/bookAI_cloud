import 'package:book_ai/domain/ai_generate/ai_generate_failure.dart';
import 'package:book_ai/domain/ai_generate/value_objects.dart';
import 'package:book_ai/infrastructure/story/story_dtos.dart';
import 'package:book_ai/infrastructure/story/story_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// import 'package:book_ai/application/auth/login/login_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'ai_generate_cubit.freezed.dart';
part 'ai_generate_state.dart';

@injectable
class AiGenerateCubit extends Cubit<AiGenerateState> {
  final StoryRepository _storyRepository;
  AiGenerateCubit(this._storyRepository) : super(AiGenerateState.initial());

  void updateGenre(String typedGenre) {
    emit(
      state.copyWith(
        genre: Genre(typedGenre),
        generateFailureOrSuccessOption: none(),
      ),
    );
  }

  void updateSetting(String typedSetting) {
    emit(
      state.copyWith(
        setting: Setting(typedSetting),
        generateFailureOrSuccessOption: none(),
      ),
    );
  }

  void updateTimePeriod(String typedTimePeriod) {
    emit(
      state.copyWith(
        timePeriod: TimePeriod(typedTimePeriod),
        generateFailureOrSuccessOption: none(),
      ),
    );
  }

  void updateMainCharacterTraits(String typedMainCharacterTraits) {
    emit(
      state.copyWith(
        mainCharacterTraits: MainCharacterTraits(typedMainCharacterTraits),
        generateFailureOrSuccessOption: none(),
      ),
    );
  }

  void updateGender(String typedGender) {
    emit(
      state.copyWith(
        gender: Gender(typedGender),
        generateFailureOrSuccessOption: none(),
      ),
    );
  }

  void updateNarrativeStyle(String typedNarrativeStyle) {
    emit(
      state.copyWith(
        narrativeStyle: NarrativeStyle(typedNarrativeStyle),
        generateFailureOrSuccessOption: none(),
      ),
    );
  }

  void reset() {
    emit(AiGenerateState.initial());
  }

  // do the call to openapi from here
  Future<void> generate() async {
    emit(
      state.copyWith(
        isSubmitting: true,
      ),
    );
    final genreQuery = (state.genre.getOrCrash().isEmpty)
        ? 'random'
        : state.genre.getOrCrash();
    final settingQuery = (state.setting.getOrCrash().isEmpty)
        ? 'random'
        : state.setting.getOrCrash();
    final timePeriodQuery = (state.timePeriod.getOrCrash().isEmpty)
        ? 'random'
        : state.timePeriod.getOrCrash();
    final mainChararcterTraitsQuery =
        (state.mainCharacterTraits.getOrCrash().isEmpty)
            ? 'random'
            : state.mainCharacterTraits.getOrCrash();
    final genderQuery = (state.gender.getOrCrash().isEmpty)
        ? 'random'
        : state.gender.getOrCrash();
    final narrativeStyleQuery = (state.narrativeStyle.getOrCrash().isEmpty)
        ? 'random'
        : state.narrativeStyle.getOrCrash();
    final submitResult = await _storyRepository.createSaveAndGet(
        'create a long story for me. the genres should be $genreQuery. the setting should be $settingQuery. The time period should be $timePeriodQuery. The main character traits should be $mainChararcterTraitsQuery. The gender of the main character should be $genderQuery. The narrative style $narrativeStyleQuery. if any of the above criteria doesnt make sense or seems irrelevent then ignore it. the response should only have the story content. dont apply any formatting on the text');
    if (submitResult.isLeft()) {
      return submitResult.fold((failure) {
        failure.maybeWhen(
            unexpected: () => emit(
                  state.copyWith(
                    isSubmitting: false,
                    generateFailureOrSuccessOption: some(
                      left(
                        const AiGenerateFailure.otherFailure(
                            'An unexpected error occurred'),
                      ),
                    ),
                  ),
                ),
            insufficientPermissions: () => emit(
                  state.copyWith(
                    isSubmitting: false,
                    generateFailureOrSuccessOption: some(
                      left(const AiGenerateFailure.otherFailure(
                          'You do not have sufficient permissions to carry out this action')),
                    ),
                  ),
                ),
            orElse: () => print('an uknown error occurred'));
      }, (_) {});
    } else {
      submitResult.fold((_) {}, (story) {
        emit(state.copyWith(
          isSubmitting: false,
          generateFailureOrSuccessOption: some(right(story)),
        ));
      });
    }
  }
}
