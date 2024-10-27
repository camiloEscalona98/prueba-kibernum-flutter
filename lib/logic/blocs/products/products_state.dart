part of 'products_bloc.dart';

class ProductsState extends Equatable {
  final bool loading;
  final String error;
  final List<ProductModel> products;

  const ProductsState(
      {this.loading = false, this.error = '', this.products = const []});

  ProductsState copyWith(
          {bool? loading, String? error, List<ProductModel>? products}) =>
      ProductsState(
        loading: loading ?? this.loading,
        error: error ?? this.error,
        products: products ?? this.products,
      );

  @override
  List<Object> get props => [loading, error, products];
}
