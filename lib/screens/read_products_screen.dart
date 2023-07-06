import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products_app/application/products_bloc/products_bloc.dart';
import 'package:products_app/screens/create_products_screen.dart';
import 'package:products_app/screens/update_products_screen.dart';
import 'package:products_app/utils/styles.dart';

class ReadProductsScreen extends StatelessWidget {
  const ReadProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsBloc, ProductsState>(
      builder: (context, state) {
        context.read<ProductsBloc>().loadProductsFromSharedPreferences();

        final ProductsBloc productsBloc = context.read<ProductsBloc>();

        return Scaffold(
          backgroundColor: Colors.grey.shade100,
          appBar: AppBar(
            backgroundColor: Colors.grey.shade100,
            elevation: 0.0,
            // bottomOpacity: 0.0,
            title: const Text(
              'Products Library',
              style: Styles.headingStyle,
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Container(
                  height: 30,
                  width: 40,
                  decoration: Styles.addButtonDecoration,
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CreateProductsScreen(),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.add,
                    ),
                  ),
                ),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: state.productModel.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 3),
                      child: SizedBox(
                        height: 100,
                        child: Card(
                          color: Colors.grey.shade300,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          margin: const EdgeInsets.only(
                              left: 10, right: 20, top: 8),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                bottom: 5, left: 3, right: 3),
                            child: ListTile(
                              leading: Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Container(
                                  width: 45,
                                  height: 45,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                      'Price: ${state.productModel[index].productPrice}'),
                                ),
                              ),
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '${state.productModel[index].productName}',
                                    style: const TextStyle(
                                        fontSize: 18, color: Colors.black),
                                  ),
                                  const SizedBox(
                                    height: 1.0,
                                  ),
                                  Text(
                                    '${state.productModel[index].productDescription}',
                                    style: const TextStyle(
                                        fontSize: 14, color: Colors.black54),
                                  ),
                                  const SizedBox(
                                    height: 6.0,
                                  ),
                                  // Text(
                                  //     'Price: ${state.productModel[index].productPrice}',
                                  //     style: Styles.colorStyle,
                                  //   ),
                                  //     const SizedBox(
                                  //       height: 6.0,
                                  //     ),
                                ],
                              ),
                              trailing: SizedBox(
                                width: 80,
                                height: 30,
                                child: Row(
                                  // crossAxisAlignment: CrossAxisAlignment.start,
                                  // mainAxisAlignment: MainAxisAlignment.start,
                                  // mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 20,
                                      child: IconButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  UpdateProductsScreen(
                                                      index: index),
                                            ),
                                          );
                                        },
                                        icon: const Icon(
                                          Icons.edit,
                                        ),
                                      ),
                                    ),

                                    const SizedBox(
                                      width: 20,
                                    ),
                                    SizedBox(
                                      width: 20,
                                      child: IconButton(
                                        icon: const Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        ),
                                        onPressed: () {
                                          productsBloc.add(
                                              OnDeleteProduct(index: index));
                                        },
                                      ),
                                    ),

                                    // SizedBox(
                                    //   height: 20,
                                    // ),
                                    // Text(
                                    //   'Price: ${state.productModel[index].productPrice}',
                                    //   style: Styles.colorStyle,
                                    // ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}
