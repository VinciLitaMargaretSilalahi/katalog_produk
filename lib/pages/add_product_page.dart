import 'package:flutter/material.dart';
import '../models/product.dart';

class AddProductPage extends StatefulWidget {
  final List<Product> products;
  final VoidCallback onProductAdded;

  const AddProductPage({
    super.key,
    required this.products,
    required this.onProductAdded,
  });

  @override
  State<AddProductPage> createState() {
    return _AddProductPageState();
  }
}

class _AddProductPageState
    extends State<AddProductPage> {

  final _formKey = GlobalKey<FormState>();

  final _namaController =
      TextEditingController();

  final _hargaController =
      TextEditingController();

  void _tambahProduk() {

    if (_formKey.currentState!.validate()) {

      final produkBaru = Product(
        nama: _namaController.text,
        harga: int.parse(
          _hargaController.text,
        ),
        icon: Icons.shopping_bag,
      );

      widget.products.add(produkBaru);

      widget.onProductAdded();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            '${produkBaru.nama} berhasil ditambahkan',
          ),
        ),
      );

      _namaController.clear();
      _hargaController.clear();

      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    _namaController.dispose();
    _hargaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tambah Produk',
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,

          child: Column(
            children: [

              TextFormField(
                controller: _namaController,

                decoration: const InputDecoration(
                  labelText: 'Nama Produk',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(
                    Icons.shopping_bag,
                  ),
                ),

                validator: (value) {

                  if (value == null ||
                      value.isEmpty) {
                    return 'Nama produk wajib diisi';
                  }

                  return null;
                },
              ),

              const SizedBox(height: 20),

              TextFormField(
                controller: _hargaController,

                keyboardType:
                    TextInputType.number,

                decoration: const InputDecoration(
                  labelText: 'Harga',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(
                    Icons.money,
                  ),
                ),

                validator: (value) {

                  if (value == null ||
                      value.isEmpty) {
                    return 'Harga wajib diisi';
                  }

                  if (int.tryParse(value) == null) {
                    return 'Harga harus berupa angka';
                  }

                  return null;
                },
              ),

              const SizedBox(height: 25),

              SizedBox(
                width: double.infinity,

                child: ElevatedButton(
                  onPressed: _tambahProduk,

                  child: const Text(
                    'Tambah Produk',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}