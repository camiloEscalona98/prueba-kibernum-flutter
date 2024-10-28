part of 'products_bloc.dart';

class ProductsState extends Equatable {
  final bool loading;
  final String error;
  final List<ProductModel> products;
  final bool isEmpty;

  const ProductsState({
    this.loading = false,
    this.error = '',
    this.products = const [],
    this.isEmpty = false,
  });

  ProductsState copyWith({
    bool? loading,
    String? error,
    List<ProductModel>? products,
    bool? isEmpty,
  }) =>
      ProductsState(
        loading: loading ?? this.loading,
        error: error ?? this.error,
        products: products ?? this.products,
        isEmpty: isEmpty ?? (products?.isEmpty ?? this.isEmpty),
      );

  @override
  List<Object> get props => [loading, error, products, isEmpty];
}
