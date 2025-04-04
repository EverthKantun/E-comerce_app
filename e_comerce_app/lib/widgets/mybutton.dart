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
          // Se usa `backgroundColor` en lugar de `color`
          backgroundColor:
              Colors.cyan[100], 
          padding: EdgeInsets.zero,
        ),
        onPressed: onPressed, 
        child: Text(name),
      ),
    );
  }
}
