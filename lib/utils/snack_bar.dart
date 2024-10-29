import 'package:flutter/material.dart';

//se puede modificar de acuerdo a la necesidad, colores tipografia, etc. Como parametros
void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(message)),
  );
}
