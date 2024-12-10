// ignore_for_file: type_literal_in_constant_pattern

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app_bloc/features/HomeScreen/bloc/home_screen_bloc.dart';

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
      listener: (context, state) {},
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
              ),
              body: Padding(
                padding: const EdgeInsets.all(8),
                child: ListView.builder(
                  itemCount: successState.products.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        successState.products[index].name,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 18),
                      ),
                      subtitle: Text(
                        successState.products[index].description,
                        style: const TextStyle(fontSize: 14),
                      ),
                      leading: Image.network(
                        successState.products[index].imageUrl,
                        height: 50,
                        width: 70,
                        fit: BoxFit.cover,
                      ),
                      trailing: Text(
                        '\u{20B9} ${successState.products[index].price}',
                        style: const TextStyle(fontSize: 16),
                      ),
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
}

Widget _buildErrorState(HomeScreenErrorState state) {
  return Center(
    child: Text(
      state.errorMessage,
      style: const TextStyle(color: Colors.red, fontSize: 20),
    ),
  );
}
