class ProductsModel {
  ProductsModel({
    this.productName,
    this.productDescription,
    this.productPrice,
  });

  final String? productName;
  final String? productDescription;
  final String? productPrice;

  factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
        productName: json['colorName'],
        productDescription: json['colorNotes'],
        productPrice: json['productPrice'],
      );

  Map<String, dynamic> toJson() => {
        'colorName': productName,
        'colorNotes': productDescription,
        'productPrice': productPrice,
      };
}
