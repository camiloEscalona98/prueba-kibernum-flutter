import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:prueba_ccu/presentation/widgets/custom_button_widget.dart';
import 'package:prueba_ccu/presentation/widgets/custom_text_field_widget.dart';

import '../../../../utils/utils.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  Future<void> login() async {
    await Future.delayed(const Duration(seconds: 2));
  }

  Future<void> validateInputs() async {
    final username = _usernameController.text.trim();
    final password = _passwordController.text.trim();

    if (username.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('El usuario no puede estar vacío')),
      );
      return;
    }

    if (password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('La contraseña no puede estar vacía')),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    await login();

    setState(() {
      _isLoading = false;
    });

    context.go('/products');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 300),
        CustomTextField(
          hintText: 'Usuario',
          leftIcon: Icons.person,
          validatorFunction: (value) {
            Validators.requiredFieldValidator(value);
            return null;
          },
          controller: _usernameController,
        ),
        const SizedBox(height: 20),
        CustomTextField(
          isPassword: true,
          hintText: 'Contraseña',
          controller: _passwordController,
          validatorFunction: (value) {
            Validators.requiredFieldValidator(value);
            return null;
          },
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Checkbox(
              value: true,
              onChanged: (bool? value) {},
            ),
            const Text('Recordar contraseña'),
          ],
        ),
        CustomButton(
          text: 'Iniciar Sesión',
          isExpanded: true,
          hasBorder: false,
          isLoading: _isLoading,
          onPressed: validateInputs,
          styleType: ButtonStyleType.primary,
        )
      ],
    );
  }
}
