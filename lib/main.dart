import 'package:flutter/material.dart';

import 'pages/main_navigation_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Katalog Produk',

      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      home: const MainNavigationPage(),
    );
  }
}