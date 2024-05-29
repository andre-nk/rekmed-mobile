import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rekmed/app/auth/cubit/auth_cubit.dart';
import 'package:rekmed/view/widgets/auth/AuthForm.dart';
import 'package:rekmed/view/widgets/auth/Button.dart';
import 'package:rekmed/view/screens/auth/signup/SignUpPage.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

void _navigateToSignUpPage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const SignUpPage(),
    ),
  );
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
                  child: const Text('Sign In',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                const SizedBox(height: 60),

                /// input username
                AuthForm(
                  controller: emailController,
                  textInputType: TextInputType.emailAddress,
                  text: 'Email',
                  obscure: false,
                ),

                const SizedBox(height: 10),

                /// input password
                AuthForm(
                  controller: passwordController,
                  textInputType: TextInputType.text,
                  text: 'Password',
                  obscure: true,
                ),

                const SizedBox(height: 14),

                /// lupa password
                const Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Lupa Password?",
                    style: TextStyle(
                      fontSize: 11,
                      color: Color(0xFF87CBB9),
                    ),
                  ),
                ),

                const SizedBox(height: 54),

                Button(
                  onPressed: () {
                    if (emailController.text.isNotEmpty &&
                        passwordController.text.isNotEmpty) {
                      context.read<AuthCubit>().signInWithEmailAndPassword(
                            email: emailController.text,
                            password: passwordController.text,
                          );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content:
                              Text('Email dan Password tidak boleh kosong'),
                        ),
                      );
                    }
                  },
                  text: 'Sign In',
                ),

                const SizedBox(height: 10),

                Container(
                  height: 20,
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Belum memiliki Akun? ',
                          style: TextStyle(
                              color: Color(0xff646464), fontSize: 12)),
                      InkWell(
                        onTap: () => _navigateToSignUpPage(context),
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Color(0xff646464),
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
