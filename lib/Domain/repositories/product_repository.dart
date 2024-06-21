import '../../Data/models/products_model.dart';
abstract class ProductRepo{
  Future<Map<String, List<ProductModel>>> getAllProducts();
}