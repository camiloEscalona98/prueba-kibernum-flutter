import 'package:dio/dio.dart' show Dio;
import 'package:prueba_ccu/data/repositories/products/products_repositories.dart';

import '../../../utils/utils.dart';
import '../../models/models.dart';

class ProductsRepositoriesImpl implements ProductsRepositories {
  @override
  Future<List<ProductModel>> getAllProducts() async {
    var response = await Dio().get('${Constants.apiUrl}/products');

    if (response.statusCode != 200) {
      throw Exception(response.statusMessage);
    }

    return ((response.data) as List)
        .map((e) => ProductModel.fromJson(e))
        .toList();
  }
}
