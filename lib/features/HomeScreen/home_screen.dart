import 'package:flutter/material.dart';
import 'package:grocery_app_bloc/data/producta_data.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grocery'),
        backgroundColor: const Color.fromARGB(255, 251, 251, 61),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView.builder(
          itemCount: ProductsData.groceryProducts.length,
          itemBuilder: (context, index) {
            final product = ProductsData.groceryProducts[index];
            return ListTile(
              title: Text(product['name']),
              leading: Image.network(
                product['imageUrl'],
                height: 50,
                width: 50,
              ),
            );
          },
        ),
      ),
    );
  }
}
