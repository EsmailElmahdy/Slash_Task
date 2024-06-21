import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:slash/Data/models/products_model.dart';

import '../../Domain/repositories/product_repository.dart';

class RepositoryApi extends ProductRepo{
  @override
  Future<Map<String, List<ProductModel>>> getAllProducts() async{
    final response = await rootBundle.loadString('assets/data/dummyData.json');
    final data = json.decode(response);

    List<ProductModel> bestSelling = (data['bestSelling'] as List)
        .map((i) => ProductModel.fromJson(i))
        .toList();
    List<ProductModel> newArrival = (data['newArrival'] as List)
        .map((i) => ProductModel.fromJson(i))
        .toList();
    List<ProductModel> recommendedForYou = (data['recommendedForYou'] as List)
        .map((i) => ProductModel.fromJson(i))
        .toList();
    return {
      'bestSelling': bestSelling,
      'newArrival': newArrival,
      'recommendedForYou': recommendedForYou,
    };
  }
}