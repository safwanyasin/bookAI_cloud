import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// import 'package:book_ai/application/auth/login/login_state.dart';
import 'package:book_ai/domain/auth/login/i_login_facade.dart';
import 'package:book_ai/domain/auth/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/auth/login/login_failure.dart';

part 'login_cubit.freezed.dart';
part 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  late final ILoginFacade _loginFacade;

  LoginCubit(
    this._loginFacade,
  ) : super(LoginState.initial());

  void updateEmail(String typedEmail) {
    emit(
      state.copyWith(
        emailAddress: EmailAddress(typedEmail),
        loginFailureOrSuccessOption: none(),
      ),
    );
  }

  void updatePassword(String typedPassword) {
    emit(
      state.copyWith(
        password: Password(typedPassword),
        loginFailureOrSuccessOption: none(),
      ),
    );
  }

  Future<void> login({
    String? emailAddress,
    String? password,
  }) async {
    await _performLogin();
  }

  Future<void> _performLogin() async {
    final email = state.emailAddress;
    Password? password = state.password;

    emit(
      state.copyWith(
        isSubmitting: true,
      ),
    );

    final loginResult = await _loginFacade.signInWithEmailAndPassword(
        emailAddress: email, password: password);

    if (loginResult.isLeft()) {
      return loginResult.fold((failure) {
        failure.maybeWhen(
            cancelledByUser: () => emit(
                  state.copyWith(
                    isSubmitting: false,
                    loginFailureOrSuccessOption:
                        some(left(const LoginFailure.cancelledByUser())),
                  ),
                ),
            serverError: () => emit(
                  state.copyWith(
                    isSubmitting: false,
                    loginFailureOrSuccessOption:
                        some(left(const LoginFailure.serverError())),
                  ),
                ),
            invalidEmailAndPasswordCombination: () => emit(
                  state.copyWith(
                    isSubmitting: false,
                    loginFailureOrSuccessOption: some(left(const LoginFailure
                        .invalidEmailAndPasswordCombination())),
                  ),
                ),
            otherFailure: (m) => emit(
                  state.copyWith(
                    isSubmitting: false,
                    loginFailureOrSuccessOption:
                        some(left(LoginFailure.otherFailure(m))),
                  ),
                ),
            orElse: () => print("some unknown error occurred"));
      }, (_) => {});
    }

    // login successful
    // can build user session here
  }
}
