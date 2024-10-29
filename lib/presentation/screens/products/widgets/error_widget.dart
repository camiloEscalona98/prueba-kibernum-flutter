import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../widgets/widgets.dart';

class ErrorMessageWidget extends StatelessWidget {
  final void Function() onPressed;
  final String text;
  const ErrorMessageWidget({
    super.key,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 150),
        Text(
          text,
          style: const TextStyle(fontSize: 24, color: Colors.red),
          textAlign: TextAlign.center,
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
    );
  }
}
