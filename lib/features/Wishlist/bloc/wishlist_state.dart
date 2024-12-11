part of 'wishlist_bloc.dart';

@immutable
sealed class WishlistState {}

final class WishlistInitial extends WishlistState {}

class WishlistLoadingState extends WishlistState{}

class WishlistLoadedSuccessState extends WishlistState{
  final List<ProductDataModel> wishlistItems;

  WishlistLoadedSuccessState({required this.wishlistItems});
}

class WishlistErrorState extends WishlistState{
  final String errorMessage;

  WishlistErrorState(this.errorMessage);
}