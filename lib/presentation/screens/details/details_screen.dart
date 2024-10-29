import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:prueba_ccu/logic/blocs/product/product_bloc.dart';
import 'package:prueba_ccu/presentation/widgets/widgets.dart';

import 'widgets/widgets.dart';

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
    _fetchProduct();
  }

  void _fetchProduct() {
    context.read<ProductBloc>().add(GetProduct(int.parse(widget.id)));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state.loading) {
          return const Center(
              child: CustomScaffold(
                  body: Center(child: CircularProgressIndicator())));
        } else if (state.error.isNotEmpty) {
          return ErrorMessageWidget(
            state: state,
            onPressed: _fetchProduct,
          );
        } else if (state.product != null) {
          return DetailBody(product: state.product!);
        }
        return ErrorMessageWidget(
          state: state,
          onPressed: _fetchProduct,
        );
      },
    );
  }
}
