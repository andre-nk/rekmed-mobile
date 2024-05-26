import 'package:flutter/material.dart';

class AuthForm extends StatelessWidget {
  const AuthForm(
    {super.key, 
    required this.controller, 
    required this.textInputType, 
    required this.text,
    required this.obsecure});
  final TextEditingController controller;
  final TextInputType textInputType;
  final String text;
  final bool obsecure;

  @override
  Widget build(BuildContext context){
    return SizedBox(
      height: 48,
      child: TextField(
        controller: controller,
        keyboardType: textInputType,
        obscureText: obsecure,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 15.0),
          border: const OutlineInputBorder(),
          hintText: text,
          hintStyle: const TextStyle(fontSize: 13)
        ),
      ),
    );
  }

}
