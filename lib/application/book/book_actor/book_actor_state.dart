part of 'book_actor_cubit.dart';

@freezed
class BookActorState with _$BookActorState {
  // const factory BookWatcherState({
  //   // can add a userdialog over here to show the error messages
  // }) = _BookWatcherState;

  // const BookWatcherState._();

  const factory BookActorState.initial() = _Initial;
  const factory BookActorState.actionInProgress() = _ActionInProgress;
  const factory BookActorState.deleteFailure(BookFailure bookFailure) = _DeleteFailure;
  const factory BookActorState.deleteSuccess() = _DeleteSuccess;
  
}