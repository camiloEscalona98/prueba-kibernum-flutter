import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Color(0xFF29333C), // Color principal
    scaffoldBackgroundColor: Color(0xFF29333C), // Color de fondo
    appBarTheme: AppBarTheme(
      backgroundColor: Color(0xFF29333C), // Fondo del AppBar
      foregroundColor: Colors.white, // Color del texto del AppBar
    ),
    colorScheme: ColorScheme.dark(
      primary: Colors.blueAccent, // Puedes cambiarlo por otro color de acento
      secondary: Colors.tealAccent,
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: Colors.white),
      bodyMedium: TextStyle(color: Colors.white70),
    ),
  );
}
