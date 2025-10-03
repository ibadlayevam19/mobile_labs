import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String productName;
  final double price;

  const ProductCard({
    super.key,
    required this.productName,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.shopping_cart),
        title: Text(productName),
        subtitle: Text("\$${price.toStringAsFixed(2)}"),
      ),
    );
  }
}
