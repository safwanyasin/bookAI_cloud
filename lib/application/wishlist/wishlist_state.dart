part of 'wishlist_cubit.dart';

@freezed
class WishlistState with _$WishlistState {
  // const factory WishlistState({
  //   // can add a userdialog over here to show the error messages
  // }) = _BookWatcherState;

  const WishlistState._();

  const factory WishlistState.initial() = _Initial;
  const factory WishlistState.loading() = _Loading;
  const factory WishlistState.loadSuccess(List<Book> books) = _LoadSuccess;
  const factory WishlistState.loadFailure(BookFailure bookFailure) = _LoadFailure;
  
}
