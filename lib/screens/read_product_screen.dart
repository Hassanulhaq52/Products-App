import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products_app/application/product_bloc/product_bloc.dart';
import 'package:products_app/screens/create_product_screen.dart';
import 'package:products_app/utils/styles.dart';

class ReadProductScreen extends StatelessWidget {
  const ReadProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        context.read<ProductBloc>().loadProductsFromSharedPreferences();
        return Scaffold(
          backgroundColor: Colors.grey.shade100,
          appBar: AppBar(
            backgroundColor: Colors.grey.shade100,
            elevation: 0.0,
            // bottomOpacity: 0.0,
            title: const Text(
              'Library',
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
                          builder: (context) => const CreateProductScreen(),
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
          body: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: state.productModel.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 3),
                    child: SizedBox(
                      height: 90,
                      child: Card(
                        color: Colors.grey.shade300,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        margin:
                            const EdgeInsets.only(left: 20, right: 20, top: 8),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              bottom: 8, left: 3, right: 3),
                          child: ListTile(
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
                              ],
                            ),
                            trailing: Column(
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Price: ${state.productModel[index].productPrice}',
                                  style: Styles.colorStyle,
                                ),
                              ],
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
        );
      },
    );
  }
}
