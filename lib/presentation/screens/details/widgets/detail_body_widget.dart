import 'package:flutter/material.dart';

import '../../../../data/models/models.dart';
import '../../../widgets/widgets.dart';

class DetailBody extends StatelessWidget {
  const DetailBody({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: customAppBar(context, 'Detalles del producto'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                constraints: const BoxConstraints(
                  maxHeight: 300,
                ),
                child: Center(
                  child: FadeInImage(
                    placeholder: const AssetImage('assets/img/placeholder.png'),
                    image: NetworkImage(product.image),
                    fit: BoxFit.contain,
                    fadeInDuration: const Duration(milliseconds: 500),
                    fadeOutDuration: const Duration(milliseconds: 300),
                    imageErrorBuilder: (context, error, stackTrace) {
                      return const Icon(Icons.error);
                    },
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              Text(product.title, style: const TextStyle(fontSize: 26.0)),
              const SizedBox(height: 8.0),
              Text(product.description,
                  style: const TextStyle(fontSize: 16.0, color: Colors.grey)),
              const SizedBox(height: 16.0),
              Text('Precio: \$${product.price.toStringAsFixed(2)}',
                  style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue)),
              const SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
    );
  }
}
