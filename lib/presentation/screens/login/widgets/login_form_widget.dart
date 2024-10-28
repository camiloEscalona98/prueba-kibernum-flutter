import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:prueba_ccu/presentation/widgets/custom_button_widget.dart';
import 'package:prueba_ccu/presentation/widgets/custom_text_field_widget.dart';

import '../../../../logic/blocs/blocs.dart';

import 'package:shared_preferences/shared_preferences.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _rememberMe = false;

  @override
  void initState() {
    super.initState();
    _loadCredentials();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _loadCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _usernameController.text = prefs.getString('username') ?? '';
      _passwordController.text = prefs.getString('password') ?? '';
      _rememberMe = prefs.getBool('rememberMe') ?? false;
    });

    // Verifica que las credenciales se están cargando correctamente
    print("Username: ${_usernameController.text}");
    print("Password: ${_passwordController.text}");
    print("Remember Me: $_rememberMe");
  }

  Future<void> _saveCredentials(String username, String password) async {
    final prefs = await SharedPreferences.getInstance();
    if (_rememberMe) {
      await prefs.setString('username', username);
      await prefs.setString('password', password);
    } else {
      await prefs.remove('username');
      await prefs.remove('password');
    }
    await prefs.setBool('rememberMe', _rememberMe);
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

    context.read<LoginBloc>().add(LoginButtonPressed(
          username: username,
          password: password,
        ));

    // Guardar credenciales si "Recordar contraseña" está marcado
    await _saveCredentials(username, password);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 300),
        CustomTextField(
          hintText: 'Usuario',
          leftIcon: Icons.person,
          controller: _usernameController,
        ),
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
              value: _rememberMe,
              onChanged: (bool? value) {
                setState(() {
                  _rememberMe = value ?? false;
                });
              },
            ),
            const Text('Recordar contraseña'),
          ],
        ),
        CustomButton(
          text: 'Iniciar Sesión',
          isExpanded: true,
          hasBorder: false,
          onPressed: validateInputs,
          styleType: ButtonStyleType.primary,
        )
      ],
    );
  }
}
