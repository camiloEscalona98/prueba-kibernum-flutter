import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:prueba_ccu/presentation/screens/products/products_screen.dart';
import 'package:prueba_ccu/presentation/widgets/widgets.dart';

import '../../../logic/blocs/blocs.dart';

class ErrorScreen extends StatefulWidget {
  const ErrorScreen({super.key});

  @override
  State<ErrorScreen> createState() => _ErrorScreenState();
}

class _ErrorScreenState extends State<ErrorScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 200),
          Center(
            child: Lottie.asset(
              'assets/lottie/error.json',
              width: 300,
              height: 300,
              fit: BoxFit.contain,
            ),
          ),
          const Spacer(),
          CustomButton(
              text: 'Reintentar',
              hasBorder: false,
              isExpanded: true,
              styleType: ButtonStyleType.primary,
              onPressed: () {
                context.go(
                  '/products',
                );
                context.read<ProductsBloc>().add(GetAllProducts());
              }),
        ],
      ),
    );
  }
}
