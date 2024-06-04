import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final bool isDisabled;
  final VoidCallback onPressed;
  final String text;
  const Button({
    super.key,
    this.isDisabled = false,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: isDisabled ? 0.5 : 1,
      child: TextButton(
        onPressed: isDisabled ? null : onPressed,
        child: Container(
          alignment: Alignment.center,
          height: 55,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[Color(0xFF04AE91), Color(0xFF05CAD5)]),
          ),
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
