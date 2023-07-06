part of 'products_bloc.dart';

class ProductsState {
  ProductsState({
    required this.productName,
    required this.productDescription,
    required this.productPrice,
    required this.productModel,
  });

  final String? productName;
  final String? productDescription;
  final String? productPrice;
  List<ProductsModel> productModel;

  factory ProductsState.initial() {
    return ProductsState(
      productName: '',
      productDescription: '',
      productPrice: '',
      productModel: [],
    );
  }

  ProductsState copyWith({
    String? productName,
    String? productDescription,
    String? productPrice,
    List<ProductsModel>? productModel,
  }) {
    return ProductsState(
      productName: productName ?? this.productName,
      productDescription: productDescription ?? this.productDescription,
      productModel: productModel ?? this.productModel,
      productPrice: productPrice ?? this.productPrice,
    );
  }
}
