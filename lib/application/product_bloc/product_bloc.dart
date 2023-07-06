import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/product_model.dart';

part 'product_event.dart';

part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductState.initial()) {
    on<OnAddProductName>((event, emit) {
      emit(state.copyWith(productName: event.productName));
    });
    on<OnAddProductDescription>((event, emit) {
      emit(state.copyWith(productDescription: event.productDescription));
    });
    on<OnAddProductPrice>((event, emit) {
      emit(state.copyWith(productPrice: event.productPrice));
    });
    on<OnPressedSave>((event, emit) {
      if (state.productName != null &&
          state.productName != '' &&
          state.productDescription != null &&
          state.productDescription != '') {
        emit(
          state.copyWith(
            productModel: state.productModel
              ..add(
                ProductModel(
                  productName: state.productName!,
                  productDescription: state.productDescription!,
                  productPrice: state.productPrice!,
                ),
              ),
          ),
        );
        _saveProductsToSharedPreferences();
      } else {
        print('Plz fill all the Fields');
      }
    });
  }

  Future<void> loadProductsFromSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    final colorsJson = prefs.getString('products');
    if (colorsJson != null) {
      final colorsMapList = (jsonDecode(colorsJson) as List<dynamic>)
          .map((colorMap) => ProductModel.fromJson(colorMap))
          .toList();
      emit(state.copyWith(productModel: colorsMapList));
    } else {
      emit(state.copyWith(productModel: []));
    }
  }

  Future<void> _saveProductsToSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    final encodedList =
        jsonEncode(state.productModel.map((color) => color.toJson()).toList());
    prefs.setString('products', encodedList);
  }
}
