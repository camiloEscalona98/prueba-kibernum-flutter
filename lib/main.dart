import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:prueba_ccu/logic/blocs/products/products_bloc.dart';

import 'package:prueba_ccu/presentation/screens/products/products_screen.dart';

import 'utils/utils.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: AppTheme.darkTheme,
        home: MultiBlocProvider(providers: [
          BlocProvider(create: (context) => ProductsBloc()),
        ], child: ProductsScreen()));
  }
}
