part of 'product_bloc.dart';

class ProductState {
  ProductState({
    required this.productName,
    required this.productDescription,
    required this.productPrice,
    required this.productModel,
  });

  final String? productName;
  final String? productDescription;
  final String? productPrice;
  List<ProductModel> productModel;

  factory ProductState.initial() {
    return ProductState(
      productName: '',
      productDescription: '',
      productPrice: '',
      productModel: [],
    );
  }

  ProductState copyWith({
    String? productName,
    String? productDescription,
    String? productPrice,
    List<ProductModel>? productModel,
  }) {
    return ProductState(
      productName: productName ?? this.productName,
      productDescription: productDescription ?? this.productDescription,
      productModel: productModel ?? this.productModel,
      productPrice: productPrice ?? this.productPrice,
    );
  }
}
