part of 'reading_list_cubit.dart';

@freezed
class ReadingListState with _$ReadingListState {
  // const factory ReadingListState({
  //   // can add a userdialog over here to show the error messages
  // }) = _BookWatcherState;

  const ReadingListState._();

  const factory ReadingListState.initial() = _Initial;
  const factory ReadingListState.loading() = _Loading;
  const factory ReadingListState.loadSuccess(List<Book> books) = _LoadSuccess;
  const factory ReadingListState.loadFailure(BookFailure bookFailure) =
      _LoadFailure;
}
