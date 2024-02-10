import 'package:book_ai/domain/ai_generate/ai_generate_failure.dart';
import 'package:book_ai/domain/ai_generate/value_objects.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// import 'package:book_ai/application/auth/login/login_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'advanced_search_cubit.freezed.dart';
part 'advanced_search_state.dart';

@injectable
class AdvancedSearchCubit extends Cubit<AdvancedSearchState> {
  AdvancedSearchCubit() : super(AdvancedSearchState.initial());

  void updateGenre(String typedGenre) {
    emit(
      state.copyWith(
        genre: Genre(typedGenre),
        searchFailureOrSuccessOption: none(),
      ),
    );
  }

  void updateSetting(String typedSetting) {
    emit(
      state.copyWith(
        setting: Setting(typedSetting),
        searchFailureOrSuccessOption: none(),
      ),
    );
  }

  void updateTimePeriod(String typedTimePeriod) {
    emit(
      state.copyWith(
        timePeriod: TimePeriod(typedTimePeriod),
        searchFailureOrSuccessOption: none(),
      ),
    );
  }

  void updateMainCharacterTraits(String typedMainCharacterTraits) {
    emit(
      state.copyWith(
        mainCharacterTraits: MainCharacterTraits(typedMainCharacterTraits),
        searchFailureOrSuccessOption: none(),
      ),
    );
  }

  void updateGender(String typedGender) {
    emit(
      state.copyWith(
        gender: Gender(typedGender),
        searchFailureOrSuccessOption: none(),
      ),
    );
  }

  void updateNarrativeStyle(String typedNarrativeStyle) {
    emit(
      state.copyWith(
        narrativeStyle: NarrativeStyle(typedNarrativeStyle),
        searchFailureOrSuccessOption: none(),
      ),
    );
  }

  // do the call to openapi from here
  Future<void> search() async {}
}
