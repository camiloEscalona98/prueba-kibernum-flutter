import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_ccu/data/models/product_model.dart';
import 'package:prueba_ccu/logic/blocs/product/product_bloc.dart';

import '../../widgets/widgets.dart';
import 'widgets/detail_body_widget.dart';

class DetailsScreen extends StatefulWidget {
  final String id;
  const DetailsScreen({super.key, required this.id});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ProductBloc>().add(GetProduct(int.parse(widget.id)));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state.loading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.error.isNotEmpty) {
          return Center(child: Text('Error: ${state.error}'));
        } else if (state.product != null) {
          final product = state.product!;
          return DetailBody(product: product);
        }
        return const Center(child: Text('No se encontró el producto.'));
      },
    );
  }
}
