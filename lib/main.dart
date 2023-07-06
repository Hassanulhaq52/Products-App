
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products_app/screens/create_product_screen.dart';
import 'package:products_app/screens/read_product_screen.dart';

import 'application/product_bloc/product_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductBloc(),
      child: const MaterialApp(
        title: 'Products App',
        home: CreateProductScreen(),
      ),
    );
  }
}