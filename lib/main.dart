import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:prueba_ccu/presentation/screens/details/details_screen.dart';
import 'package:prueba_ccu/presentation/screens/error/error_screen.dart';
import 'package:prueba_ccu/presentation/screens/login/login_screen.dart';

import 'package:prueba_ccu/presentation/screens/products/products_screen.dart';

import 'logic/blocs/blocs.dart';
import 'utils/utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginBloc(Dio()),
        ),
        BlocProvider(create: (context) => ProductsBloc()),
        BlocProvider(
          create: (context) => ProductBloc(),
        )
      ],
      child: MaterialApp.router(
        theme: AppTheme.darkTheme,
        routerConfig: router,
      ),
    );
  }
}

final router = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/products',
      builder: (context, state) => const ProductsScreen(),
    ),
    GoRoute(
      path: '/details/:id',
      builder: (context, state) =>
          DetailsScreen(id: state.pathParameters['id']!),
    ),
    GoRoute(
      path: '/error',
      builder: (context, state) => const ErrorScreen(),
    ),
  ],
);
