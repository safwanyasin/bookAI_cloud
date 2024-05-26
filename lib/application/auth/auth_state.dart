part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  // const factory AuthState() = _AuthState;

  const factory AuthState.initial() = Initial;
  const factory AuthState.authenticated(AppUser user) = Authenticated;
  const factory AuthState.unauthenticated() = Unauthenticated;
  // const factory AuthState.unverified() = Unverified;
}
