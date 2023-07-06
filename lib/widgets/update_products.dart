//
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:products_app/application/product_bloc/product_bloc.dart';
// import 'package:products_app/screens/read_product_screen.dart';
// import 'package:products_app/utils/styles.dart';
//
// class UpdateProducts extends StatelessWidget {
//   const UpdateProducts({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<ProductBloc, ProductState>(
//       builder: (context, state) {
//         final ProductBloc productBloc = context.read<ProductBloc>();
//         return Padding(
//           padding: EdgeInsets.only(
//             top: 20,
//             right: 15,
//             left: 15,
//             bottom: MediaQuery.of(context).viewInsets.bottom,
//           ),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 decoration: Styles.containerDecoration,
//                 child: TextField(
//                   decoration: Styles.taskFieldDecoration.copyWith(
//                     hintText: 'Enter Color Name',
//                   ),
//                   onChanged: (value) {
//                     productBloc.add(OnAddProductName(productName: value));
//                   },
//                 ),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               Container(
//                 decoration: Styles.containerDecoration,
//                 child: TextField(
//                   decoration: Styles.taskFieldDecoration
//                       .copyWith(hintText: 'Enter Notes'),
//                   onChanged: (value) {
//                     productBloc.add(
//                         OnAddProductDescription(productDescription: value));
//                   },
//                 ),
//               ),
//               Container(
//                 decoration: Styles.containerDecoration,
//                 child: TextField(
//                   decoration: Styles.taskFieldDecoration
//                       .copyWith(hintText: 'Enter Notes'),
//                   onChanged: (value) {
//                     productBloc.add(OnAddProductPrice(productPrice: value));
//                   },
//                 ),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               SizedBox(
//                 width: double.infinity,
//                 height: 45,
//                 child: ElevatedButton(
//                   onPressed: () {
//                     productBloc.add(OnPressedSave());
//                     // if (state.colorName != null &&
//                     //     state.colorName != '' &&
//                     //     state.colorNotes != null &&
//                     //     state.colorNotes != '') {
//                     //   Navigator.push(
//                     //       context,
//                     //       MaterialPageRoute(
//                     //         builder: (context) =>  const ReadProductScreen(),
//                     //       ));
//                     // } else {
//                     //   print('error');
//                     // }
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => const ReadProductScreen(),
//                         ));
//                   },
//                   style: ElevatedButton.styleFrom(
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     primary: Colors.blueAccent,
//                   ),
//                   child: const Text(
//                     'Update',
//                     style: TextStyle(
//                       fontSize: 18,
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 9,
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products_app/screens/read_product_screen.dart';

import '../application/product_bloc/product_bloc.dart';

class UpdateProductScreen extends StatelessWidget {
  final int index;

  UpdateProductScreen({required this.index});

  @override
  Widget build(BuildContext context) {
    final productBloc = context.read<ProductBloc>();
    final product = productBloc.state.productModel[index];

    return Scaffold(
      appBar: AppBar(
        title: Text('Update Product'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              initialValue: product.productName,
              onChanged: (value) {
                productBloc.add(OnAddProductName(productName: value));
              },
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextFormField(
              initialValue: product.productDescription,
              onChanged: (value) {
                productBloc.add(OnAddProductDescription(productDescription: value));
              },
              decoration: InputDecoration(labelText: 'Description'),
            ),
            TextFormField(
              initialValue: product.productPrice.toString(),
              onChanged: (value) {
                productBloc.add(OnAddProductPrice(productPrice: value));
              },
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Price'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                productBloc.add(OnUpdateProduct(index: index));
                Navigator.pop(context);
              },
              child: Text('Update'),
            ),
          ],
        ),
      ),
    );
  }
}





