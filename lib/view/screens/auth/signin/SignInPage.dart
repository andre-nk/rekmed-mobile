import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rekmed/app/auth/cubit/auth_cubit.dart';
import 'package:rekmed/view/widgets/auth/AuthForm.dart';
import 'package:rekmed/view/widgets/auth/Button.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isCheckedRememberMe = false;

  void rememberMe(bool value) {
    setState(() {
      isCheckedRememberMe = value;
    });
  }

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
                const SizedBox(height: 67),

                ///input username
                AuthForm(
                  controller: emailController,
                  textInputType: TextInputType.emailAddress,
                  text: 'E-mail',
                  obsecure: false,
                ),

                const SizedBox(height: 10),

                ///input password
                AuthForm(
                  controller: passwordController,
                  textInputType: TextInputType.text,
                  text: 'Password',
                  obsecure: true,
                ),

                const SizedBox(height: 13),

                ///remember me
                Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  SizedBox(
                      height: 15,
                      width: 15,
                      child: Theme(
                        data: ThemeData(unselectedWidgetColor: const Color(0xff00C8E8)),
                        child: Checkbox(
                            activeColor: const Color(0xff00C8E8),
                            value: isCheckedRememberMe,
                            onChanged: (val) {
                              rememberMe(val ?? false);
                            }),
                      )),
                  const SizedBox(
                    width: 10.0,
                  ),
                  const Text("Ingat Saya",
                      style: TextStyle(color: Color(0xff646464), fontSize: 11))
                ]),

                const SizedBox(height: 51),
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
                          content: Text('Email dan Password tidak boleh kosong'),
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
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Belum memiliki Akun? ',
                          style: TextStyle(color: Color(0xff646464), fontSize: 13)),
                      InkWell(
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Color(0xff646464),
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
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
