import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/models.dart';
import '../../../data/repositories/repositories.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  late ProductsRepositories productsRepositories;
  ProductsBloc() : super(const ProductsState()) {
    productsRepositories = ProductsRepositoriesImpl();
    on<GetAllProducts>((event, emit) async {
      try {
        emit(state.copyWith(loading: true));
        final response = await productsRepositories.getAllProducts();
        emit(state.copyWith(loading: false, products: response));
      } catch (e) {
        emit(state.copyWith(loading: false, error: e.toString()));
      }
    });
  }
}
