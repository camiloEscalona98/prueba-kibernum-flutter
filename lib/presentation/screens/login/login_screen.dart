import 'package:flutter/material.dart';
import 'package:prueba_ccu/presentation/screens/login/widgets/login_form_widget.dart';

import 'package:prueba_ccu/presentation/widgets/custom_scaffold_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      body: SingleChildScrollView(child: LoginForm()),
    );
  }
}
