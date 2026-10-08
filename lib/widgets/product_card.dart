import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback onTap;
  final VoidCallback onDelete;

  const ProductCard({
    super.key,
    required this.product,
    required this.onTap,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: ListTile(
        leading: CircleAvatar(
          child: Icon(
            product.icon,
          ),
        ),

        title: Text(
          product.nama,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),

        subtitle: Text(
          'Rp ${product.harga}',
        ),

        trailing: IconButton(
          icon: const Icon(
            Icons.delete,
            color: Colors.red,
          ),
          onPressed: onDelete,
        ),

        onTap: onTap,
      ),
    );
  }
}