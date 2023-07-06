part of 'products_bloc.dart';

abstract class ProductsEvent {}

class OnAddProductName extends ProductsEvent {
  OnAddProductName({required this.productName});

  final String productName;
}

class OnAddProductDescription extends ProductsEvent {
  OnAddProductDescription({required this.productDescription});

  final String productDescription;
}

class OnAddProductPrice extends ProductsEvent {
  OnAddProductPrice({required this.productPrice});

  final String productPrice;
}

class OnPressedSubmit extends ProductsEvent {}

class OnUpdateProduct extends ProductsEvent {
  OnUpdateProduct({required this.index});

  final int index;
}

class OnDeleteProduct extends ProductsEvent {
  final int index;

  OnDeleteProduct({required this.index});
}


