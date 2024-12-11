// ignore_for_file: type_literal_in_constant_pattern

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app_bloc/features/HomeScreen/bloc/home_screen_bloc.dart';
import 'package:grocery_app_bloc/features/HomeScreen/UI/product_widget.dart';
import 'package:grocery_app_bloc/features/Wishlist/UI/wishlist.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //* direct instance creation of Bloc
  final HomeScreenBloc homeScreenBloc = HomeScreenBloc();

  @override
  void initState() {
    homeScreenBloc.add(HomeScreenInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeScreenBloc, HomeScreenState>(
      bloc: homeScreenBloc,
      listenWhen: (previous, current) => current is HomeScreenActionsState,
      listener: (context, state) {
        if (state is HomeScreenNavigateToWishlistPageActionState) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const WishlistPage()),
          );
        }
        if(state is HomeScreenItemAddedToWishlistMsg){
          displaySnackBar(context, state.msg);
        }
      },
      buildWhen: (previous, current) => current is! HomeScreenActionsState,
      builder: (context, state) {
        debugPrint('Current state: $state');
        switch (state.runtimeType) {
          case HomeScreenLoadingState:
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          case HomeScreenLoadedSuccessState:
            final successState = state as HomeScreenLoadedSuccessState;
            return Scaffold(
              appBar: AppBar(
                title: const Text('Grocery'),
                centerTitle: true,
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                scrolledUnderElevation: 0,
                actions: [
                  IconButton(
                    onPressed: () {
                      homeScreenBloc.add(HomeScreenWishlistNavigateEvent());
                    },
                    icon: const Icon(Icons.favorite_border),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.shopping_cart_outlined),
                  ),
                ],
              ),
              body: Padding(
                padding: const EdgeInsets.all(8),
                child: ListView.builder(
                  itemCount: successState.products.length,
                  itemBuilder: (context, index) {
                    return ProductWidget(
                      productDataModel: successState.products.elementAt(index),
                      homeScreenBloc: homeScreenBloc,
                    );
                  },
                ),
              ),
            );
          case HomeScreenErrorState:
            return _buildErrorState(state as HomeScreenErrorState);
          default:
            return const Scaffold(
              body: Center(
                child: Text("No Items!"),
              ),
            );
        }
      },
    );
  }

  Widget _buildErrorState(HomeScreenErrorState state) {
    return Center(
      child: Text(
        state.errorMessage,
        style: const TextStyle(color: Colors.red, fontSize: 20),
      ),
    );
  }

  void displaySnackBar(BuildContext context, String displayMsg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Expanded(
          child: Text(
            displayMsg,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.white, // Text color
            ),
          ),
        ),
        backgroundColor: Colors.greenAccent.shade700,
        // SnackBar background color
        behavior: SnackBarBehavior.floating,
        // Floating behavior for a modern look
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // Rounded corners
        ),
        elevation: 6,
        // Subtle elevation for a rich look
        duration: const Duration(seconds: 3),
        
      ),
    );
  }
}
