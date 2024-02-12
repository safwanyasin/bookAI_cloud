part of 'book_details_cubit.dart';

@freezed
class BookDetailsState with _$BookDetailsState {
  // const factory BookDetailsState({
  //   // can add a userdialog over here to show the error messages
  // }) = _BookWatcherState;

  const BookDetailsState._();

  const factory BookDetailsState.initial() = _Initial;
  const factory BookDetailsState.loading() = _Loading;
  const factory BookDetailsState.loadSuccess(
      bool existsInReading, bool existsInWish) = _LoadSuccess;
  const factory BookDetailsState.loadFailure(BookFailure bookFailure) =
      _LoadFailure;
}
