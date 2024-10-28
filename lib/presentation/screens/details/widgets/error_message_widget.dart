import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../logic/blocs/blocs.dart';
import '../../../widgets/widgets.dart';

class ErrorMessageWidget extends StatelessWidget {
  final ProductState state;
  final VoidCallback onPressed;
  const ErrorMessageWidget({
    super.key,
    required this.state,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Error: ${state.error}',
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.red, fontSize: 16),
          ),
          const SizedBox(height: 30),
          Lottie.asset(
            'assets/lottie/error.json',
            width: 300,
            height: 200,
            fit: BoxFit.fill,
          ),
          const SizedBox(height: 50),
          CustomButton(
              text: 'Recargar productos',
              hasBorder: false,
              isExpanded: true,
              styleType: ButtonStyleType.primary,
              onPressed: onPressed)
        ],
      ),
    );
  }
}
