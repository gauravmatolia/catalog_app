import 'package:flutter/material.dart';
import 'main.dart';

class ProductDetails extends StatelessWidget {
  final Product product;
  const ProductDetails({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          product.name,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Icon(Icons.broken_image, size: 100,);
              },
            ),
            Column(
              children: [
                Text(
                  product.name,
                ),
                Text(
                  '\$${product.price}',
                ),
                Text(
                  product.description
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}