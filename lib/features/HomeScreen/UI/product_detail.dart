import 'package:flutter/material.dart';
import 'package:grocery_app_bloc/features/HomeScreen/bloc/home_screen_bloc.dart';
import 'package:grocery_app_bloc/features/HomeScreen/models/product_data_model.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail(
      {super.key, required this.productDataModel, this.homeScreenBloc});

  final ProductDataModel productDataModel;
  final HomeScreenBloc? homeScreenBloc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(homeScreenBloc != null?'Grocery':'Wishlist'),
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        scrolledUnderElevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite_border),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart_outlined),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            Hero(
              transitionOnUserGestures: true,
              tag: productDataModel.id,
              child: Container(
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height / 4,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color.fromARGB(255, 245, 245, 150),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: const Offset(2, 2),
                    ),
                  ],
                ),
                child: Image.network(
                  productDataModel.imageUrl,
                  height: 100,
                  width: 100,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              productDataModel.name,
              style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 10),
            Text(
              '\u{20B9}${productDataModel.price}',
              style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 10),
            Text(
              productDataModel.detailDescription,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 25),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                fixedSize: Size(MediaQuery.sizeOf(context).width, 45),
                backgroundColor: Colors.orangeAccent,
              ),
              child: const Text(
                'Add to Wishlist',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w400),
              ),
            ),
            const SizedBox(height: 25),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                fixedSize: Size(MediaQuery.sizeOf(context).width, 45),
                backgroundColor: Colors.deepOrangeAccent,
              ),
              child: const Text(
                'Add to Cart',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
