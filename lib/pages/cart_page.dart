import 'package:flutter/material.dart';

import '../models/product.dart';

class CartPage extends StatefulWidget {
  final List<Product> cartItems;
  final VoidCallback onCartChanged;

  const CartPage({
    super.key,
    required this.cartItems,
    required this.onCartChanged,
  });

  @override
  State<CartPage> createState() {
    return _CartPageState();
  }
}

class _CartPageState extends State<CartPage> {
  // Menyimpan produk yang dipilih
  final Set<Product> _produkDipilih = {};

  // Menghitung total harga produk yang dipilih
  int get totalHarga {
    int total = 0;

    for (final product in _produkDipilih) {
      total += product.harga;
    }

    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Keranjang',
        ),
      ),

      body: widget.cartItems.isEmpty
          ? const Center(
              child: Text(
                'Keranjang masih kosong',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            )
          : Column(
              children: [
                // =========================
                // PILIH SEMUA
                // =========================
                CheckboxListTile(
                  title: const Text(
                    'Pilih Semua',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  value:
                      _produkDipilih.length ==
                          widget.cartItems.length,

                  onChanged: (value) {
                    setState(() {
                      if (value == true) {
                        _produkDipilih
                            .addAll(widget.cartItems);
                      } else {
                        _produkDipilih.clear();
                      }
                    });
                  },
                ),

                const Divider(),

                // =========================
                // DAFTAR PRODUK
                // =========================
                Expanded(
                  child: ListView.builder(
                    itemCount:
                        widget.cartItems.length,

                    itemBuilder: (context, index) {
                      final product =
                          widget.cartItems[index];

                      final bool dipilih =
                          _produkDipilih
                              .contains(product);

                      return Card(
                        margin:
                            const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),

                        child: CheckboxListTile(
                          value: dipilih,

                          onChanged: (value) {
                            setState(() {
                              if (value == true) {
                                _produkDipilih
                                    .add(product);
                              } else {
                                _produkDipilih
                                    .remove(product);
                              }
                            });
                          },

                          secondary: Container(
                            width: 50,
                            height: 50,

                            decoration:
                                BoxDecoration(
                              color:
                                  Colors.blue.shade50,
                              borderRadius:
                                  BorderRadius.circular(
                                10,
                              ),
                            ),

                            child: Icon(
                              product.icon,
                              color: Colors.blue,
                            ),
                          ),

                          title: Text(
                            product.nama,
                            style:
                                const TextStyle(
                              fontWeight:
                                  FontWeight.bold,
                            ),
                          ),

                          subtitle: Text(
                            'Rp ${product.harga}',
                          ),

                          controlAffinity:
                              ListTileControlAffinity
                                  .leading,
                        ),
                      );
                    },
                  ),
                ),

                // =========================
                // RINGKASAN PESANAN
                // =========================
                Container(
                  padding:
                      const EdgeInsets.all(16),

                  decoration:
                      const BoxDecoration(
                    color: Colors.white,

                    boxShadow: [
                      BoxShadow(
                        blurRadius: 8,
                        color: Colors.black12,
                      ),
                    ],
                  ),

                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment
                                .spaceBetween,

                        children: [
                          const Text(
                            'Produk dipilih',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),

                          Text(
                            '${_produkDipilih.length} produk',
                            style:
                                const TextStyle(
                              fontWeight:
                                  FontWeight.bold,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 8),

                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment
                                .spaceBetween,

                        children: [
                          const Text(
                            'Total',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight:
                                  FontWeight.bold,
                            ),
                          ),

                          Text(
                            'Rp $totalHarga',
                            style:
                                const TextStyle(
                              fontSize: 18,
                              fontWeight:
                                  FontWeight.bold,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 15),

                      SizedBox(
                        width: double.infinity,

                        child: ElevatedButton(
                          onPressed:
                              _produkDipilih.isEmpty
                                  ? null
                                  : () {
                                      _pesanProduk(
                                        context,
                                      );
                                    },

                          child: const Text(
                            'Pesan Sekarang',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }

  // =========================
  // PESAN PRODUK
  // =========================
  void _pesanProduk(
    BuildContext context,
  ) {
    showDialog(
      context: context,

      builder: (context) {
        return AlertDialog(
          title: const Text(
            'Konfirmasi Pesanan',
          ),

          content: Text(
            'Anda memilih '
            '${_produkDipilih.length} produk '
            'dengan total Rp $totalHarga.',
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

            ElevatedButton(
              onPressed: () {
                // Hapus produk yang sudah dipesan
                widget.cartItems.removeWhere(
                  (product) =>
                      _produkDipilih
                          .contains(product),
                );

                _produkDipilih.clear();

                widget.onCartChanged();

                Navigator.pop(context);

                Navigator.pop(context);

                ScaffoldMessenger.of(context)
                    .showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Pesanan berhasil dibuat!',
                    ),
                  ),
                );
              },

              child: const Text(
                'Konfirmasi',
              ),
            ),
          ],
        );
      },
    );
  }
}