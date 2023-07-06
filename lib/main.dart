import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products_app/application/products_bloc/products_bloc.dart';
import 'package:products_app/screens/create_products_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsBloc(),
      child: const MaterialApp(
        title: 'Products App',
        home: CreateProductsScreen(),
      ),
    );
  }
}
