part of 'product_bloc.dart';

class ProductState extends Equatable {
  final bool loading;
  final String error;
  final ProductModel? product;

  const ProductState({
    this.loading = false,
    this.error = '',
    this.product,
  });

  ProductState copyWith({
    bool? loading,
    String? error,
    ProductModel? product,
  }) =>
      ProductState(
        loading: loading ?? this.loading,
        error: error ?? this.error,
        product: product ?? this.product,
      );

  @override
  List<Object?> get props => [loading, error, product];
}
