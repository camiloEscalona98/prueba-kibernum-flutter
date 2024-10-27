import 'package:flutter/material.dart';

AppBar customAppBar(BuildContext context, String title) {
  return AppBar(
    title: ShaderMask(
      shaderCallback: (bounds) => const LinearGradient(
        colors: [Color(0xFF2BAFEF), Color(0xFFDC86ED)],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      ).createShader(bounds),
      child: Text(
        title,
        style: const TextStyle(
            color: Colors.white), // Usa un color fijo para el texto
      ),
    ),
    centerTitle: true,
  );
}
