import '../../models/models.dart';

abstract class ProductsRepositories {
  Future<List<ProductModel>> getAllProducts();

  Future<ProductModel> getProductById(int id);
}
