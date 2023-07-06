import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:products_app/application/product_bloc/product_bloc.dart';
import 'package:products_app/screens/read_product_screen.dart';
import 'package:products_app/utils/styles.dart';

class CreateProductScreen extends StatelessWidget {
  const CreateProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        final ProductBloc productBloc = context.read<ProductBloc>();

        return Scaffold(
          backgroundColor: Colors.grey.shade100,
          // floatingActionButton: FloatingActionButton(
          //   onPressed: () {
          //     showModalBottomSheet(
          //       shape: const RoundedRectangleBorder(
          //         borderRadius: BorderRadius.only(
          //           topRight: Radius.circular(10),
          //           topLeft: Radius.circular(10),
          //         ),
          //       ),
          //       context: context,
          //       isScrollControlled: true,
          //       builder: (context) => const ModalBottomSheet(),
          //     );
          //   },
          //   child: const Icon(
          //     Icons.file_download_outlined,
          //     color: Colors.white,
          //     size: 35,
          //   ),
          // ),
          appBar: AppBar(
            backgroundColor: Colors.white12,
            elevation: 0.0,
            title: const Center(
              child: Text(
                'Color Designer',
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
                          builder: (context) => const ReadProductScreen(),
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
                  Container(
                    decoration: Styles.containerDecoration,
                    child: TextField(
                      decoration: Styles.taskFieldDecoration.copyWith(
                        hintText: 'Enter Product Name',
                      ),
                      onChanged: (value) {
                        productBloc.add(OnAddProductName(productName: value));
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
                      decoration: Styles.taskFieldDecoration
                          .copyWith(hintText: 'Enter Product Description'),
                      onChanged: (value) {
                        productBloc.add(
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
                      decoration: Styles.taskFieldDecoration
                          .copyWith(hintText: 'Enter Product Price'),
                      onChanged: (value) {
                        productBloc.add(
                            OnAddProductPrice(productPrice: value));
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
                        productBloc.add(OnPressedSave());
                        // if (state.productName != null &&
                        //     state.productName != '' &&
                        //     state.productDescription != null &&
                        //     state.productDescription != '') {
                        //   Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //         builder: (context) =>  const ReadProductScreen(),
                        //       ));
                        // } else {
                        //   print('error');
                        // }
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ReadProductScreen(),
                            ));
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        primary: Colors.blueAccent,
                      ),
                      child: const Text(
                        'Save',
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
