part of 'home_screen_bloc.dart';

@immutable
sealed class HomeScreenState {}

final class HomeScreenInitial extends HomeScreenState {}

class HomeScreenLoadingState extends HomeScreenState {}

class HomeScreenLoadedSuccessState extends HomeScreenState {
  final List<ProductDataModel> products;

  HomeScreenLoadedSuccessState({required this.products});
}

class HomeScreenErrorState extends HomeScreenState {
  final String errorMessage;

  HomeScreenErrorState(this.errorMessage);
}
