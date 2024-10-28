import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:prueba_ccu/data/models/product_model.dart';

import '../../../data/repositories/repositories.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  late ProductsRepositories productsRepositories;

  ProductBloc() : super(const ProductState()) {
    productsRepositories = ProductsRepositoriesImpl();
    on<GetProduct>((event, emit) async {
      try {
        emit(state.copyWith(loading: true));
        final response =
            await productsRepositories.getProductById(event.productId);

        emit(state.copyWith(
          loading: false,
          product: response,
          isEmpty: response == null,
          error: '', // Limpiar el error si la carga es exitosa
        ));
      } catch (e) {
        emit(state.copyWith(
          loading: false,
          error:
              'No se pudo cargar el producto. Verifica tu conexión a internet.',
          isEmpty: true,
        ));
      }
    });
  }
}
