// ignore_for_file: type_literal_in_constant_pattern

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app_bloc/features/HomeScreen/UI/product_widget.dart';
import 'package:grocery_app_bloc/features/Wishlist/bloc/wishlist_bloc.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({super.key});

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  final WishlistBloc wishlistBloc = WishlistBloc();
  @override
  void initState() {
    wishlistBloc.add(WishlistInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WishlistBloc, WishlistState>(
      bloc: wishlistBloc,
      listener: (context, state) {},
      builder: (context, state) {
        switch (state.runtimeType) {
          case WishlistLoadingState:
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          case WishlistLoadedSuccessState:
            final wishlistSuccessState = state as WishlistLoadedSuccessState;
            if (wishlistSuccessState.wishlistItems.isEmpty) {
              return Scaffold(
                appBar: AppBar(
                  title: const Text('Wishlist'),
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  scrolledUnderElevation: 0,
                  centerTitle: true,
                  actions: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.shopping_cart_outlined),
                    ),
                  ],
                ),
                body: const Center(
                  child: Text('No Products in Wishlist'),
                ),
              );
            } else {
              return Scaffold(
                appBar: AppBar(
                  title: const Text('Wishlist'),
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  scrolledUnderElevation: 0,
                  centerTitle: true,
                  actions: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.shopping_cart_outlined),
                    ),
                  ],
                ),
                body: ListView.builder(
                  itemCount: wishlistSuccessState.wishlistItems.length,
                  itemBuilder: (context, index) {
                    return ProductWidget(
                      productDataModel:
                          wishlistSuccessState.wishlistItems.elementAt(index),
                      wishlistBloc: wishlistBloc,
                    );
                  },
                ),
              );
            }
          case WishlistErrorState:
            return _buildErrorState(state as WishlistErrorState);
          default:
            return Scaffold(
              appBar: AppBar(
                title: const Text('Wishlist'),
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                scrolledUnderElevation: 0,
                centerTitle: true,
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.shopping_cart_outlined),
                  ),
                ],
              ),
              body: const Center(
                child: Text('No Items!'),
              ),
            );
        }
      },
    );
  }

  Widget _buildErrorState(WishlistErrorState state) {
    return Center(
      child: Text(
        state.errorMessage,
        style: const TextStyle(color: Colors.red, fontSize: 20),
      ),
    );
  }
}
