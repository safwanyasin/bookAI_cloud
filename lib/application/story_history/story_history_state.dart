part of 'story_history_cubit.dart';

@freezed
class StoryHistoryState with _$StoryHistoryState {
  // const factory WishlistState({
  //   // can add a userdialog over here to show the error messages
  // }) = _BookWatcherState;

  const StoryHistoryState._();

  const factory StoryHistoryState.initial() = _Initial;
  const factory StoryHistoryState.loading() = _Loading;
  const factory StoryHistoryState.loadSuccess(List<StoryItem> stories) =
      _LoadSuccess;
  const factory StoryHistoryState.loadFailure(StoryFailure bookFailure) =
      _LoadFailure;
  const factory StoryHistoryState.deleteFailure() = _DeleteFailure;
}
