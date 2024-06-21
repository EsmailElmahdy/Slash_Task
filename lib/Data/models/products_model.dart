import 'package:slash/Domain/entities/Products.dart';

class ProductModel extends Products {
  ProductModel(int id, String name, String imagePath, double price)
      : super(id, name, imagePath, price);

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      json['id'],
      json['name'],
      json['image'],
      json['price'].toDouble(),
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductModel &&
        other.id == id &&
        other.name == name &&
        other.imagePath == imagePath &&
        other.price == price;
  }

  @override
  int get hashCode =>
      id.hashCode ^ name.hashCode ^ imagePath.hashCode ^ price.hashCode;
}
