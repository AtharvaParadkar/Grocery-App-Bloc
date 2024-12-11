import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:grocery_app_bloc/data/wishlist_items.dart';
import 'package:grocery_app_bloc/features/HomeScreen/models/product_data_model.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
    on<WishlistInitialEvent>(wishlistInitialEvent);
  }

  FutureOr<void> wishlistInitialEvent(WishlistInitialEvent event,Emitter<WishlistState> emit)async{
    emit(WishlistLoadingState());

    await Future.delayed(const Duration(seconds: 2));

    try{
      emit(WishlistLoadedSuccessState(wishlistItems: WishlistItems().getWishList));
    }catch(exception){
      emit(WishlistErrorState('Failed to get Wishlist $exception'));
    }
  }

}
