import 'package:book_ai/domain/ai_generate/ai_generate_failure.dart';
import 'package:book_ai/domain/ai_generate/value_objects.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// import 'package:book_ai/application/auth/login/login_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'ai_generate_cubit.freezed.dart';
part 'ai_generate_state.dart';

@injectable
class AiGenerateCubit extends Cubit<AiGenerateState> {
  AiGenerateCubit() : super(AiGenerateState.initial());

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

  // do the call to openapi from here
  Future<void> generate() async {}
}
