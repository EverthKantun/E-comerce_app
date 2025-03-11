import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  final String name;
  final String? Function(String?)? validator; // Se cambió Function por String? Function(String?)?

  const MyTextFormField({
    super.key,
    required this.name,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator, // Ahora tiene el tipo correcto
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: name,
      ),
    );
  }
}
