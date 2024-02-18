import 'package:book_ai/domain/auth/value_objects.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// import 'package:book_ai/application/auth/login/login_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'profile_page_cubit.freezed.dart';
part 'profile_page_state.dart';

@injectable
class ProfilePageCubit extends Cubit<ProfilePageState> {
  ProfilePageCubit() : super(ProfilePageState.initial());

  // updates the state when there is a change in user input
  void updateApiKey(String typedApiKey) {
    emit(
      state.copyWith(
        apiKey: ApiKey(typedApiKey),
      ),
    );
  }

  // updates the apikey
  void update() async {
    emit(state.copyWith(
      isSubmitting: true,
    ));

    // TODO: move this to the infrastructure layer
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('apiKey', state.apiKey.getOrCrash());
    emit(
      state.copyWith(
        isSubmitting: false,
      ),
    );
  }
}
