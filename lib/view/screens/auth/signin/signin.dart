import 'package:flutter/material.dart';
import 'package:rekmed/view/widgets/text.form.dart';

class SigninView extends StatelessWidget {
  const SigninView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 79.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: Text(
                  'Sign In',
                  style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  ),
                ),
            ),
            const SizedBox(height: 36),
            TextForm(),
            ],
            ),
          ),
        ),
      ),
    );
  }
}
