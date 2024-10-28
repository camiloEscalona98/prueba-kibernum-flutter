import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../logic/blocs/blocs.dart';
import '../../widgets/widgets.dart';
import 'widgets/widgets.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ProductsBloc>().add(GetAllProducts());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsBloc, ProductsState>(
      builder: (context, state) {
        return CustomScaffold(
          appBar: customAppBar(context, 'Productos'),
          body: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                if (state.error.isNotEmpty)
                  // Vista de error
                  Column(
                    children: [
                      const SizedBox(height: 150),
                      const Text(
                        'Error de conexión',
                        style: TextStyle(fontSize: 24, color: Colors.red),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 30),
                      Lottie.asset(
                        'assets/lottie/error.json',
                        width: 300,
                        height: 200,
                        fit: BoxFit.fill,
                      ),
                      const SizedBox(height: 50),
                      CustomButton(
                          text: 'Recargar productos',
                          hasBorder: false,
                          isExpanded: true,
                          styleType: ButtonStyleType.primary,
                          onPressed: () {
                            context.read<ProductsBloc>().add(GetAllProducts());
                          })
                    ],
                  )
                else if (state.isEmpty)
                  // Vista para cuando la lista está vacía
                  Column(
                    children: [
                      const Text(
                        'No hay productos disponibles.',
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      CustomButton(
                          text: 'Recargar productos',
                          hasBorder: false,
                          isExpanded: true,
                          styleType: ButtonStyleType.primary,
                          onPressed: () {
                            context.read<ProductsBloc>().add(GetAllProducts());
                          })
                    ],
                  )
                else
                  // Vista para mostrar los productos
                  ProductGridView(
                    isLoading: state.loading,
                    state: state,
                    products: state.products,
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
