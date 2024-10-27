import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:prueba_ccu/presentation/widgets/custom_button_widget.dart';
import 'package:prueba_ccu/presentation/widgets/custom_text_field_widget.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 300),
        CustomTextField(
            hintText: 'Usuario',
            leftIcon: Icons.person,
            controller: _usernameController),
        const SizedBox(height: 20),
        CustomTextField(
          isPassword: true,
          hintText: 'Contraseña',
          controller: _passwordController,
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
          onPressed: () {},
          styleType: ButtonStyleType.primary,
        )
      ],
    );
  }
}
