import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product;
  final VoidCallback onAddToCart;

  const ProductDetailPage({
    super.key,
    required this.product,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Detail Produk',
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            const SizedBox(height: 30),

            CircleAvatar(
              radius: 60,
              child: Icon(
                product.icon,
                size: 60,
              ),
            ),

            const SizedBox(height: 30),

            Text(
              product.nama,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              'Rp ${product.harga}',
              style: const TextStyle(
                fontSize: 20,
              ),
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  onAddToCart();

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        '${product.nama} ditambahkan ke keranjang',
                      ),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.shopping_cart,
                ),
                label: const Text(
                  'Tambah ke Keranjang',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}