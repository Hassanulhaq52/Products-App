import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products_app/application/products_bloc/products_bloc.dart';

class UpdateProductsScreen extends StatelessWidget {
  final int index;

  const UpdateProductsScreen({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final productBloc = context.read<ProductsBloc>();
    final product = productBloc.state.productModel[index];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              const SizedBox(height: 50,),
              TextFormField(
                initialValue: product.productName,
                onChanged: (value) {
                  productBloc.add(OnAddProductName(productName: value));
                },
                decoration: const InputDecoration(labelText: 'Product Name'),
              ),
              const SizedBox(height: 30,),
              TextFormField(
                initialValue: product.productDescription,
                onChanged: (value) {
                  productBloc
                      .add(OnAddProductDescription(productDescription: value));
                },
                decoration: const InputDecoration(labelText: 'Product Description'),
              ),
              const SizedBox(height: 50,),
              TextFormField(
                initialValue: product.productPrice.toString(),
                onChanged: (value) {
                  productBloc.add(OnAddProductPrice(productPrice: value));
                },
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Product Price'),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  productBloc.add(OnUpdateProduct(index: index));
                  Navigator.pop(context);
                },
                child: const Text('Update'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
