import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
        style: const TextStyle(color: Colors.white),
      ),
    ),
    centerTitle: true,
    actions: [
      IconButton(
        icon: const Icon(
          Icons.logout,
          color: Colors.white,
        ),
        onPressed: () async {
          final prefs = await SharedPreferences.getInstance();
          await prefs.remove('auth_token');
          context.go('/');
        },
      )
    ],
  );
}
