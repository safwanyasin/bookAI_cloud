part of 'ai_generate_cubit.dart';

@freezed
class AiGenerateState with _$AiGenerateState {
  const factory AiGenerateState({
    required Genre genre,
    required Setting setting,
    required TimePeriod timePeriod,
    required MainCharacterTraits mainCharacterTraits,
    required Gender gender,
    required NarrativeStyle narrativeStyle,
    required bool isSubmitting,
    required Option<Either<AiGenerateFailure, StoryDto>>
        generateFailureOrSuccessOption,
    // can add a userdialog over here to show the error messages
  }) = _AiGenerateState;

  const AiGenerateState._();

  Option<Either<AiGenerateFailure, StoryDto>> get result {
    return generateFailureOrSuccessOption;
  }

  factory AiGenerateState.initial() => AiGenerateState(
        genre: Genre(''),
        setting: Setting(''),
        timePeriod: TimePeriod(''),
        mainCharacterTraits: MainCharacterTraits(''),
        gender: Gender('Unspecified'),
        narrativeStyle: NarrativeStyle('Unspecified'),
        isSubmitting: false,
        generateFailureOrSuccessOption: none(),
      );
  // const factory AiGenerateState.loading() = _Loading;
  // const factory AiGenerateState.generateFailure(AiGenerateFailure failure) =
  //     _GenerateFailure;
  // const factory AiGenerateState.generateSuccess(StoryItem story) =
  //     _GenerateSuccess;
}
