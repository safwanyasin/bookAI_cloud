import 'package:book_ai/domain/auth/register/register_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// import 'package:book_ai/application/auth/login/login_state.dart';
import 'package:book_ai/domain/auth/login/i_login_facade.dart';
import 'package:book_ai/domain/auth/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'register_cubit.freezed.dart';
part 'resgister_state.dart';

@injectable
class RegisterCubit extends Cubit<RegisterState> {
  late final ILoginFacade _loginFacade;

  RegisterCubit(
    this._loginFacade,
  ) : super(RegisterState.initial());

  void updateEmail(String typedEmail) {
    emit(
      state.copyWith(
        emailAddress: EmailAddress(typedEmail),
        registerFailureOrSuccessOption: none(),
      ),
    );
  }

  void updatePassword(String typedPassword) {
    emit(
      state.copyWith(
        password: Password(typedPassword),
        registerFailureOrSuccessOption: none(),
      ),
    );
  }

  void updateConfirmPassword(String typedConfirmPassword) {
    emit(
      state.copyWith(
        password: Password(typedConfirmPassword),
        registerFailureOrSuccessOption: none(),
      ),
    );
  }

  Future<void> register({
    String? emailAddress,
    String? password,
  }) async {
    await _performRegister();
  }

  Future<void> _performRegister() async {
    final email = state.emailAddress;
    Password? password = state.password;

    emit(
      state.copyWith(
        isSubmitting: true,
      ),
    );

    final registerResult = await _loginFacade.registerWithEmailAndPassword(
        emailAddress: email, password: password);

    if (registerResult.isLeft()) {
      return registerResult.fold((failure) {
        failure.maybeWhen(
            cancelledByUser: () => emit(
                  state.copyWith(
                    isSubmitting: false,
                    registerFailureOrSuccessOption:
                        some(left(const RegisterFailure.cancelledByUser())),
                  ),
                ),
            serverError: () => emit(
                  state.copyWith(
                    isSubmitting: false,
                    registerFailureOrSuccessOption:
                        some(left(const RegisterFailure.serverError())),
                  ),
                ),
            emailAlreadyInUse: () => emit(
                  state.copyWith(
                    isSubmitting: false,
                    registerFailureOrSuccessOption:
                        some(left(const RegisterFailure.emailAlreadyInUse())),
                  ),
                ),
            otherFailure: (m) => emit(
                  state.copyWith(
                    isSubmitting: false,
                    registerFailureOrSuccessOption:
                        some(left(RegisterFailure.otherFailure(m))),
                  ),
                ),
            orElse: () => print("some unknown error occurred"));
      }, (_) => {});
    }

    // login successful
    // can build user session here
  }
}
