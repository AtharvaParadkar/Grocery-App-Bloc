// ignore_for_file: avoid_print

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:grocery_app_bloc/data/producta_data.dart';
import 'package:grocery_app_bloc/features/HomeScreen/models/product_data_model.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'home_screen_event.dart';
part 'home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  HomeScreenBloc() : super(HomeScreenInitial()) {
    on<HomeScreenInitialEvent>(homeScreenInitialEvent);
  }

  FutureOr<void> homeScreenInitialEvent(
      HomeScreenInitialEvent event, Emitter<HomeScreenState> emit) async {
    try {
      emit(HomeScreenLoadingState());
      await Future.delayed(const Duration(seconds: 4));
      print('ProductsData: ${ProductsData.groceryProducts}');
      emit(
        HomeScreenLoadedSuccessState(
          products: ProductsData.groceryProducts
              .map(
                (p) => ProductDataModel(
                  id: p['id'],
                  name: p['name'],
                  description: p['description'],
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
}
