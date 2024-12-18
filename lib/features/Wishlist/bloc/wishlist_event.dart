part of 'wishlist_bloc.dart';

@immutable
sealed class WishlistEvent {}

class WishlistInitialEvent extends WishlistEvent{}

class WishlistRemoveEvent extends WishlistEvent{
  final ProductDataModel productDataModel;

  WishlistRemoveEvent(this.productDataModel);
}