class ProductModel {
  ProductModel({
    this.productName,
    this.productDescription,
    this.productPrice,
  });

  final String? productName;
  final String? productDescription;
  final String? productPrice;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
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
