part of 'book_watcher_cubit.dart';

@freezed
class BookWatcherState with _$BookWatcherState {
  // const factory BookWatcherState({
  //   // can add a userdialog over here to show the error messages
  // }) = _BookWatcherState;

  // const BookWatcherState._();

  const factory BookWatcherState.initial() = _Initial;
  const factory BookWatcherState.loading() = _Loading;
  const factory BookWatcherState.loadSuccess(Book book) = _LoadSuccess;
  const factory BookWatcherState.loadFailure(BookFailure bookFailure) = _LoadFailure;
  
}
