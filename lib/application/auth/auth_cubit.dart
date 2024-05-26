import 'package:book_ai/domain/auth/login/i_login_facade.dart';
import 'package:book_ai/domain/auth/user.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'auth_cubit.freezed.dart';
part 'auth_state.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  late final ILoginFacade _loginFacade;

  AuthCubit(this._loginFacade) : super(const AuthState.initial());

  // checks the users authentication status and updates the state accordingly
  void authCheckRequested() async {
    final userOption = await _loginFacade.getSignedInUser();
    emit(userOption.fold(
      () => const AuthState.unauthenticated(),
      (a) {
        return AuthState.authenticated(a);
      },
    ));
  }

  void getUserDetails() async {}
  void signedOut() async {
    await _loginFacade.signOut();
    emit(
      const AuthState.unauthenticated(),
    );
  }
}
