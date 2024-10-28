part of 'product_bloc.dart';

class ProductState extends Equatable {
  final bool loading;
  final String error;
  final ProductModel? product;
  final bool isEmpty;

  const ProductState({
    this.loading = false,
    this.error = '',
    this.product,
    this.isEmpty = false,
  });

  ProductState copyWith({
    bool? loading,
    String? error,
    ProductModel? product,
    bool? isEmpty,
  }) =>
      ProductState(
        loading: loading ?? this.loading,
        error: error ?? this.error,
        product: product ?? this.product,
        isEmpty: isEmpty ?? (product == null),
      );

  @override
  List<Object?> get props => [loading, error, product, isEmpty];
}
