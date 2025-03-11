import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String name;

  const MyButton({super.key, required this.name, this.onPressed}); 

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.cyan[100], // Se usa `backgroundColor` en lugar de `color`
          padding: EdgeInsets.zero,
        ),
        onPressed: onPressed, // Ahora usa el tipo correcto
        child: Text(name),
      ),
    );
  }
}
