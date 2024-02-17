part of 'profile_page_cubit.dart';

@freezed
class ProfilePageState with _$ProfilePageState {
  const factory ProfilePageState({
    required ApiKey apiKey,
    required bool isSubmitting,
    // can add a userdialog over here to show the error messages
  }) = _ProfilePageState;

  const ProfilePageState._();

  factory ProfilePageState.initial() => ProfilePageState(
        apiKey: ApiKey(''),
        isSubmitting: false,
      );
}
