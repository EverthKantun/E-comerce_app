import 'package:flutter/material.dart';
class MyTextFormField extends StatelessWidget {
  bool obserText;
  final Function validator;
  final String name;
  MyTextFormField({required this.name,required this.obserText, required this.validator})
}
//TODO: CHECK ERRORS!!!
  @override
  Widget build(BuildContext context) {
    return TextFormField(
                      obscureText: obserText,
                      validator: validator,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: name,
                      ),
                    );  
}