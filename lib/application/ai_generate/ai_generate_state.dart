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
    required Option<Either<AiGenerateFailure, Unit>>
        generateFailureOrSuccessOption,
    // can add a userdialog over here to show the error messages
  }) = _AiGenerateState;

  const AiGenerateState._();

  factory AiGenerateState.initial() => AiGenerateState(
        genre: Genre(''),
        setting: Setting(''),
        timePeriod: TimePeriod(''),
        mainCharacterTraits: MainCharacterTraits(''),
        gender: Gender(''),
        narrativeStyle: NarrativeStyle(''),
        generateFailureOrSuccessOption: none(),
      );
}


