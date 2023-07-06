part of 'product_bloc.dart';

abstract class ProductEvent {}

class OnAddProductName extends ProductEvent {
  OnAddProductName({required this.productName});

  final String productName;
}

class OnAddProductDescription extends ProductEvent {
  OnAddProductDescription({required this.productDescription});

  final String productDescription;
}

class OnAddProductPrice extends ProductEvent {
  OnAddProductPrice({required this.productPrice});

  final String productPrice;
}

class OnUpdateProduct extends ProductEvent {
  OnUpdateProduct({required this.index});

  final int index;
}

class OnDeleteProduct extends ProductEvent {
  final int index;

  OnDeleteProduct({required this.index});
}

class OnPressedSave extends ProductEvent {}
