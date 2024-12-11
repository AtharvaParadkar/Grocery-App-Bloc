part of 'home_screen_bloc.dart';

@immutable
sealed class HomeScreenEvent {}

class HomeScreenInitialEvent extends HomeScreenEvent {}

class HomeScreenWishlistClickedEvent extends HomeScreenEvent{
  final ProductDataModel productDataModel;

  HomeScreenWishlistClickedEvent(this.productDataModel);
}

class HomeScreenWishlistNavigateEvent extends HomeScreenEvent{}