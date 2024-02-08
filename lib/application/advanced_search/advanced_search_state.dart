part of 'advanced_search_cubit.dart';

@freezed
class AdvancedSearchState with _$AdvancedSearchState {
  const factory AdvancedSearchState({
    required Genre genre,
    required Setting setting,
    required TimePeriod timePeriod,
    required MainCharacterTraits mainCharacterTraits,
    required Gender gender,
    required NarrativeStyle narrativeStyle,
    required Option<Either<AiGenerateFailure, Unit>>
        searchFailureOrSuccessOption,
    // can add a userdialog over here to show the error messages
  }) = _AdvancedSearchState;

  const AdvancedSearchState._();

  factory AdvancedSearchState.initial() => AdvancedSearchState(
        genre: Genre(''),
        setting: Setting(''),
        timePeriod: TimePeriod(''),
        mainCharacterTraits: MainCharacterTraits(''),
        gender: Gender(''),
        narrativeStyle: NarrativeStyle(''),
        searchFailureOrSuccessOption: none(),
      );
}


