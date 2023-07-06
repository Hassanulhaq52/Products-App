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

class OnPressedSave extends ProductEvent {}