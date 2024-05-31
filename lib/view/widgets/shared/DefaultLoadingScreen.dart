import 'package:flutter/material.dart';

class DefaultLoadingScreen extends StatelessWidget {
  const DefaultLoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
