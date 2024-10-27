part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class GetProduct extends ProductEvent {
  final int productId;

  const GetProduct(this.productId);

  @override
  List<Object> get props => [productId];
}
