import 'package:slash/Data/models/products_model.dart';
import '../repositories/product_repository.dart';

class Services{

  final ProductRepo repo;

  Services(this.repo);

  Future<Map<String, List<ProductModel>>> getAllData() async{
    return await repo.getAllProducts();
  }
}