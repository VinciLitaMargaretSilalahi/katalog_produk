import 'package:flutter/material.dart';

import '../models/product.dart';

import 'product_list_page.dart';
import 'profile_page.dart';
import 'cart_page.dart';

class MainNavigationPage extends StatefulWidget {
  const MainNavigationPage({
    super.key,
  });

  @override
  State<MainNavigationPage> createState() {
    return _MainNavigationPageState();
  }
}

class _MainNavigationPageState extends State<MainNavigationPage> {
  int _tabTerpilih = 0;

  final List<Product> _products = [
    Product(
      nama: 'Kursi Minimalis',
      harga: 350000,
      icon: Icons.chair,
    ),
    Product(
      nama: 'Meja Kerja',
      harga: 750000,
      icon: Icons.table_bar,
    ),
    Product(
      nama: 'Lampu Meja',
      harga: 120000,
      icon: Icons.lightbulb,
    ),
    Product(
      nama: 'Tas Kulit',
      harga: 450000,
      icon: Icons.shopping_bag,
    ),
    Product(
      nama: 'Jam Tangan',
      harga: 650000,
      icon: Icons.watch,
    ),
  ];

  // Menyimpan produk yang masuk ke keranjang
  final List<Product> _cartItems = [];

  void _refreshProducts() {
    setState(() {});
  }

  // Fungsi untuk menambahkan produk ke keranjang
  void _tambahKeKeranjang(Product product) {
    setState(() {
      _cartItems.add(product);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          '${product.nama} ditambahkan ke keranjang',
        ),
      ),
    );
  }

  // Fungsi ketika isi keranjang berubah
  void _refreshCart() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> halaman = [
      ProductListPage(
        products: _products,
        onProductAdded: _refreshProducts,

        // Mengirim fungsi tambah keranjang
        onAddToCart: _tambahKeKeranjang,

        // Jumlah produk di keranjang
        jumlahKeranjang: _cartItems.length,

        // Mengirim data keranjang
        cartItems: _cartItems,

        // Fungsi ketika keranjang berubah
        onCartChanged: _refreshCart,
      ),

      const ProfilePage(),
    ];

    return Scaffold(
      body: halaman[_tabTerpilih],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _tabTerpilih,

        onTap: (index) {
          setState(() {
            _tabTerpilih = index;
          });
        },

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Produk',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}