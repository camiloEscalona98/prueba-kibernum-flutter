import '../../models/models.dart';

abstract class ProductsRepositories {
  Future<List<ProductModel>> getAllProducts();
}
