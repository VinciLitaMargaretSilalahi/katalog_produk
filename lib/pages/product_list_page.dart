import 'package:flutter/material.dart';

import '../models/product.dart';
import '../widgets/product_card.dart';

import 'product_detail_page.dart';
import 'add_product_page.dart';
import 'cart_page.dart';

class ProductListPage extends StatelessWidget {
  final List<Product> products;
  final VoidCallback onProductAdded;

  // Fungsi untuk menambahkan produk tertentu ke keranjang
  final void Function(Product) onAddToCart;

  final int jumlahKeranjang;

  // Data produk yang ada di keranjang
  final List<Product> cartItems;

  // Dipanggil ketika isi keranjang berubah
  final VoidCallback onCartChanged;

  const ProductListPage({
    super.key,
    required this.products,
    required this.onProductAdded,
    required this.onAddToCart,
    required this.jumlahKeranjang,
    required this.cartItems,
    required this.onCartChanged,
  });

  void _hapusProduk(
    BuildContext context,
    int index,
  ) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'Hapus Produk?',
          ),

          content: Text(
            'Apakah Anda yakin ingin menghapus '
            '${products[index].nama}?',
          ),

          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'Batal',
              ),
            ),

            TextButton(
              onPressed: () {
                final nama = products[index].nama;

                products.removeAt(index);

                Navigator.pop(context);

                onProductAdded();

                ScaffoldMessenger.of(context)
                    .showSnackBar(
                  SnackBar(
                    content: Text(
                      '$nama berhasil dihapus',
                    ),
                  ),
                );
              },

              child: const Text(
                'Hapus',
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Katalog Produk',
        ),

        actions: [
          // ==============================
          // TOMBOL KERANJANG
          // ==============================
          Stack(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.shopping_cart,
                ),

                // Ketika keranjang diklik
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return CartPage(
                          cartItems: cartItems,
                          onCartChanged: onCartChanged,
                        );
                      },
                    ),
                  );
                },
              ),

              // Angka jumlah keranjang
              if (jumlahKeranjang > 0)
                Positioned(
                  right: 4,
                  top: 4,

                  child: Container(
                    padding:
                        const EdgeInsets.all(4),

                    decoration:
                        const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),

                    child: Text(
                      '$jumlahKeranjang',

                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ],
          ),

          // ==============================
          // TOMBOL TAMBAH PRODUK
          // ==============================
          IconButton(
            icon: const Icon(
              Icons.add,
            ),

            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return AddProductPage(
                      products: products,
                      onProductAdded:
                          onProductAdded,
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),

      // ==============================
      // DAFTAR PRODUK
      // ==============================
      body: products.isEmpty
          ? const Center(
              child: Text(
                'Belum ada produk',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            )
          : ListView.builder(
              itemCount: products.length,

              itemBuilder:
                  (context, index) {
                final product =
                    products[index];

                return ProductCard(
                  product: product,

                  // Klik produk
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return ProductDetailPage(
                            product: product,

                            // Kirim produk
                            // yang dipilih
                            onAddToCart: () {
                              onAddToCart(product);
                            },
                          );
                        },
                      ),
                    );
                  },

                  // Hapus produk
                  onDelete: () {
                    _hapusProduk(
                      context,
                      index,
                    );
                  },
                );
              },
            ),
    );
  }
}