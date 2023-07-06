import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/products_model.dart';

part 'products_event.dart';

part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc() : super(ProductsState.initial()) {
    on<OnAddProductName>((event, emit) {
      emit(state.copyWith(productName: event.productName));
    });
    on<OnAddProductDescription>((event, emit) {
      emit(state.copyWith(productDescription: event.productDescription));
    });
    on<OnAddProductPrice>((event, emit) {
      emit(state.copyWith(productPrice: event.productPrice));
    });

    on<OnUpdateProduct>((event, emit) {
      final updatedProducts = List.of(state.productModel);
      final updatedProduct = ProductsModel(
        productName: state.productName!,
        productDescription: state.productDescription!,
        productPrice: state.productPrice!,
      );
      updatedProducts[event.index] = updatedProduct;
      emit(state.copyWith(productModel: updatedProducts));
      _saveProductsToSharedPreferences();
    });

    on<OnDeleteProduct>((event, emit) {
      final updatedProducts = List.of(state.productModel);
      updatedProducts.removeAt(event.index);
      emit(state.copyWith(productModel: updatedProducts));
      _saveProductsToSharedPreferences();
    });

    on<OnPressedSubmit>((event, emit) {
      if (state.productName != null &&
          state.productName != '' &&
          state.productDescription != null &&
          state.productDescription != '') {
        emit(
          state.copyWith(
            productModel: state.productModel
              ..add(
                ProductsModel(
                  productName: state.productName!,
                  productDescription: state.productDescription!,
                  productPrice: state.productPrice!,
                ),
              ),
          ),
        );
        _saveProductsToSharedPreferences();
      } else {
        print('Please fill in all the fields');
      }
    });
  }

  Future<void> loadProductsFromSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    final colorsJson = prefs.getString('products');
    if (colorsJson != null) {
      final colorsMapList = (jsonDecode(colorsJson) as List<dynamic>)
          .map((colorMap) => ProductsModel.fromJson(colorMap))
          .toList();
      emit(state.copyWith(productModel: colorsMapList));
    } else {
      emit(state.copyWith(productModel: []));
    }
  }

  Future<void> _saveProductsToSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    final encodedList = jsonEncode(
      state.productModel.map((product) => product.toJson()).toList(),
    );
    prefs.setString('products', encodedList);
  }
}
