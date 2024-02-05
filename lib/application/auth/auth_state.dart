part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  // const factory AuthState() = _AuthState;

  // const AuthState._();

  // factory AuthState.initial() => AuthState();
  // factory AuthState.authenticated() => AuthState();
  // factory AuthState.unauthenticated() => AuthState();
  const factory AuthState.initial() = Initial;
  const factory AuthState.authenticated() = Authenticated;
  const factory AuthState.unauthenticated() = Unauthenticated;
}
