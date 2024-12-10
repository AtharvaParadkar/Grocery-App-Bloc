import 'package:flutter/material.dart';
import 'package:grocery_app_bloc/features/HomeScreen/bloc/home_screen_bloc.dart';
import 'package:grocery_app_bloc/features/HomeScreen/models/product_data_model.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget(
      {super.key, required this.productDataModel, this.homeScreenBloc});

  final ProductDataModel productDataModel;
  final HomeScreenBloc? homeScreenBloc;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(horizontal: 7, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: const Color.fromARGB(255, 245, 245, 150),
        border: Border(
          bottom: BorderSide(color: Colors.black.withOpacity(0.6), width: 2),
          right: BorderSide(color: Colors.black.withOpacity(0.6), width: 2),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 3,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Stack(
          //   children: [
          Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: const Color.fromARGB(255, 245, 245, 150),
              // border: Border(
              //   bottom:
              //       BorderSide(color: Colors.black.withOpacity(0.6), width: 2),
              //   right:
              //       BorderSide(color: Colors.black.withOpacity(0.6), width: 2),
              // ),
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
              fit: BoxFit.cover,
            ),
          ),
          // Positioned(
          //   child: Container(
          //     padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 3),
          //     decoration: const BoxDecoration(
          //       color: Colors.redAccent,
          //       borderRadius: BorderRadius.only(
          //         topLeft: Radius.circular(15),
          //         bottomRight: Radius.circular(15),
          //       ),
          //     ),
          //     child: const Text('90% OFF',style: TextStyle(fontSize: 12),),
          //   ),
          // ),
          //   ],
          // ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Text(
                  productDataModel.name,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 10),
                Text(
                  productDataModel.description,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w400),
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Text(
                      '\u{20B9} ${productDataModel.price}',
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.favorite_border),
                      color: Colors.orangeAccent,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.shopping_cart_outlined),
                      color: Colors.deepOrangeAccent,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
