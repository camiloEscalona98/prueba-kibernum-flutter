import 'package:go_router/go_router.dart';
import 'package:prueba_ccu/presentation/screens/details/details_screen.dart';
import 'package:prueba_ccu/presentation/screens/login/login_screen.dart';
import 'package:prueba_ccu/presentation/screens/products/products_screen.dart';

GoRouter createRouter(String initialRoute) {
  return GoRouter(
    debugLogDiagnostics: true,
    initialLocation: initialRoute,
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
    ],
  );
}
