import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  const AuthForm(
      {super.key,
      required this.controller,
      required this.textInputType,
      required this.text,
      required this.obscure});
  final TextEditingController controller;
  final TextInputType textInputType;
  final String text;
  final bool obscure;

  @override
  AuthFormState createState() => AuthFormState();
}

class AuthFormState extends State<AuthForm> {
  late bool obscureText; // State to toggle password visibility

  @override
  void initState() {
    super.initState();
    obscureText = widget.obscure; // Initialize obscureText state
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: Stack(alignment: Alignment.centerRight, children: [
        TextField(
          controller: widget.controller,
          keyboardType: widget.textInputType,
          obscureText: obscureText,
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 15.0),
              border: const OutlineInputBorder(),
              hintText: widget.text,
              hintStyle: const TextStyle(fontSize: 13)),
        ),
        if (widget.obscure) // Only display toggle button if obsecure is true
          TextButton(
            onPressed: () {
              setState(() {
                obscureText = !obscureText; // Toggle password visibility
              });
            },
            child: Text(
              obscureText ? 'Show' : 'Hide',
              style: const TextStyle(
                color: Color(0xFF87CBB9),
                fontSize: 11, // Ukuran font teks
              ),
            ),
          )
      ]),
    );
  }
}
