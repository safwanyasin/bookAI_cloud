import 'package:book_ai/domain/api_input/api_input_failure.dart';
import 'package:book_ai/domain/api_input/i_api_input_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// import 'package:book_ai/application/auth/login/login_state.dart';
import 'package:book_ai/domain/auth/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'api_input_cubit.freezed.dart';
part 'api_input_state.dart';

@injectable
class ApiInputCubit extends Cubit<ApiInputState> {
  final IApiInputRepository _apiInputRepository;
  ApiInputCubit(this._apiInputRepository) : super(ApiInputState.initial());

  void updateApi(String typedApi) {
    emit(
      state.copyWith(
        apiKey: ApiInput(typedApi),
      ),
    );
  }

  Future<void> addApi(bool empty) async {
    final apiKey = state.apiKey;
    emit(
      state.copyWith(
        isSubmitting: true,
      ),
    );
    final submitResult = empty
        ? await _apiInputRepository.createEmpty()
        : await _apiInputRepository.create(apiKey);

    if (submitResult.isLeft()) {
      return submitResult.fold((failure) {
        failure.maybeWhen(
            unexpected: () => emit(
                  state.copyWith(
                    isSubmitting: false,
                    submitFailureOrSuccessOption:
                        some(left(const ApiInputFailure.unexpected())),
                  ),
                ),
            unableToUpdate: () => emit(
                  state.copyWith(
                    isSubmitting: false,
                    submitFailureOrSuccessOption:
                        some(left(const ApiInputFailure.unableToUpdate())),
                  ),
                ),
            insufficientPermissions: () => emit(
                  state.copyWith(
                    isSubmitting: false,
                    submitFailureOrSuccessOption: some(
                        left(const ApiInputFailure.insufficientPermissions())),
                  ),
                ),
            orElse: () => print('some unknown error'));
      }, (_) {});
    } else {
      emit(state.copyWith(
        isSubmitting: false,
        submitFailureOrSuccessOption: some(right(unit)),
      ));
    }
  }
}
