import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:products_app/screens/read_products_screen.dart';
import 'package:products_app/utils/styles.dart';

import '../application/products_bloc/products_bloc.dart';

class CreateProductsScreen extends StatelessWidget {
  const CreateProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsBloc, ProductsState>(
      builder: (context, state) {
        final ProductsBloc productsBloc = context.read<ProductsBloc>();

        return Scaffold(
          backgroundColor: Colors.grey.shade200,
          appBar: AppBar(
            backgroundColor: Colors.grey.shade200,
            elevation: 0.0,
            title: const Center(
              child: Text(
                'Create Products',
                style: Styles.headingStyle,
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ReadProductsScreen(),
                        ));
                  },
                  icon: const Icon(
                    Icons.save,
                    size: 30,
                  ),
                  color: Colors.black,
                ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 150,
                  ),
                  Container(
                    decoration: Styles.containerDecoration,
                    child: TextField(
                      decoration: Styles.productsFieldDecoration.copyWith(
                        hintText: 'Enter Product Name',
                      ),
                      onChanged: (value) {
                        productsBloc.add(OnAddProductName(productName: value));
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    // height: 100,
                    decoration: Styles.containerDecoration,
                    child: TextField(
                      decoration: Styles.productsFieldDecoration
                          .copyWith(hintText: 'Enter Product Description'),
                      onChanged: (value) {
                        productsBloc.add(
                            OnAddProductDescription(productDescription: value));
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    // height: 100,
                    decoration: Styles.containerDecoration,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: Styles.productsFieldDecoration
                          .copyWith(hintText: 'Enter Product Price'),
                      onChanged: (value) {
                        productsBloc
                            .add(OnAddProductPrice(productPrice: value));
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 45,
                    child: ElevatedButton(
                      onPressed: () {
                        productsBloc.add(OnPressedSubmit());
                        if (state.productName != null &&
                            state.productName != '' &&
                            state.productDescription != null &&
                            state.productDescription != '' &&
                            state.productPrice != null &&
                            state.productPrice != '') {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Center(
                                child: Text(
                                    '${state.productName} is Added to Product\'s Library')),
                            backgroundColor: Colors.green,
                          ));
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const ReadProductsScreen(),
                              ));
                        } else {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Center(
                                child: Text('Please Fill all the Fields')),
                            backgroundColor: Colors.red,
                          ));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: Colors.blueAccent,
                      ),
                      child: const Text(
                        'Submit',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
