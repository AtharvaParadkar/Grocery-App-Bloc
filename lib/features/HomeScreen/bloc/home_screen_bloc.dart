// ignore_for_file: avoid_print

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:grocery_app_bloc/data/producta_data.dart';
import 'package:grocery_app_bloc/data/wishlist_items.dart';
import 'package:grocery_app_bloc/features/HomeScreen/models/product_data_model.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'home_screen_event.dart';
part 'home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  HomeScreenBloc() : super(HomeScreenInitial()) {
    on<HomeScreenInitialEvent>(homeScreenInitialEvent);
    on<HomeScreenWishlistClickedEvent>(homeScreenWishlistClickedEvent);
    on<HomeScreenWishlistNavigateEvent>(homeScreenWishlistNavigateEvent);
  }

  FutureOr<void> homeScreenInitialEvent(
      HomeScreenInitialEvent event, Emitter<HomeScreenState> emit) async {
    try {
      emit(HomeScreenLoadingState());
      await Future.delayed(const Duration(seconds: 2));
      // print('ProductsData: ${ProductsData.groceryProducts}');
      emit(
        HomeScreenLoadedSuccessState(
          products: ProductsData.groceryProducts
              .map(
                (p) => ProductDataModel(
                  id: p['id'],
                  name: p['name'],
                  description: p['description'],
                  detailDescription: p['detailDescription'],
                  price: p['price'],
                  imageUrl: p['imageUrl'],
                ),
              )
              .toList(),
        ),
      );
    } catch (error) {
      emit(HomeScreenErrorState('Error in HomeScreenInitialEvent $error'));
    }
  }

  FutureOr<void> homeScreenWishlistClickedEvent(
      HomeScreenWishlistClickedEvent event, Emitter<HomeScreenState> emit) {
    if (WishlistItems().isInWishlist(event.productDataModel)) {
      emit(HomeScreenItemAddedToWishlistMsg(
          '${event.productDataModel.name} is already in wishlist'));
    } else {
      WishlistItems().addWishlist(event.productDataModel);

      emit(
        HomeScreenItemAddedToWishlistMsg(
            '${event.productDataModel.name} added to wishlist'),
      );
    }
  }

  FutureOr<void> homeScreenWishlistNavigateEvent(
      HomeScreenWishlistNavigateEvent event, Emitter<HomeScreenState> emit) {
    print("Clicked on wishlist navigate button");

    emit(HomeScreenNavigateToWishlistPageActionState());
  }
}
