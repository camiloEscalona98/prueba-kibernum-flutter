import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:prueba_ccu/presentation/screens/login/widgets/login_form_widget.dart';

import 'package:prueba_ccu/presentation/widgets/custom_scaffold_widget.dart';

import '../../../logic/blocs/blocs.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginInProgress) {
        } else if (state is LoginSuccessful) {
          context.go('/products');
        } else if (state is LoginFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error al iniciar sesión')),
          );
        }
      },
      child: const CustomScaffold(
        body: SingleChildScrollView(
          child: LoginForm(),
        ),
      ),
    );
  }
}
