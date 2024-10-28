import 'package:flutter/material.dart';

import '../../../../data/models/models.dart';
import '../../../../logic/blocs/blocs.dart';
import 'widgets.dart';

class ProductGridView extends StatelessWidget {
  final bool isLoading;
  final List<ProductModel> products;
  final ProductsState state;
  const ProductGridView({
    Key? key,
    required this.isLoading,
    required this.products,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
        childAspectRatio: 0.7,
      ),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: isLoading ? 6 : products.length,
      itemBuilder: (context, index) {
        if (isLoading) {
          return const ProductCardSkeleton();
        } else {
          final product = products[index];
          return ProductCard(
            product: product,
          );
        }
      },
    );
  }
}
