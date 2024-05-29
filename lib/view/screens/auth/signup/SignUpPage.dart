import 'package:flutter/material.dart';
import 'package:rekmed/view/widgets/auth/AuthForm.dart';
import 'package:rekmed/view/widgets/auth/Button.dart';
import 'package:rekmed/view/screens/auth/signin/SignInPage.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

void _navigateToSignInPage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const SignInPage(),
    ),
  );
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

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
                  child: const Text('Sign Up',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                const SizedBox(height: 60),

                /// input nama klinik
                AuthForm(
                  controller: emailController,
                  textInputType: TextInputType.emailAddress,
                  text: 'Nama Klinik',
                  obscure: false,
                ),

                const SizedBox(height: 10),

                /// input username klinik
                AuthForm(
                  controller: emailController,
                  textInputType: TextInputType.emailAddress,
                  text: 'Username Klinik',
                  obscure: false,
                ),

                const SizedBox(height: 10),

                /// input email
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
                  text: 'Buat Password',
                  obscure: true,
                ),

                const SizedBox(height: 10),

                /// confirm password
                AuthForm(
                  controller: confirmPasswordController,
                  textInputType: TextInputType.text,
                  text: 'Konfirmasi Password',
                  obscure: true,
                ),

                const SizedBox(height: 10),

                Container(
                  height: 20,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Text(
                            'Password harus memuat minimal 8 karakter termasuk huruf kapital, huruf kecil, dan simbol.',
                            style: TextStyle(
                                color: Color(0xffAAAAAA), fontSize: 12),
                            overflow: TextOverflow.visible,
                          ),
                        ),
                      ]),
                ),

                const SizedBox(height: 47),

                Container(
                  height: 20,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: const Row(children: [
                    Flexible(
                      child: Text(
                        'Dengan mengetuk Register, Saya menyetujui semua Ketentuan Penggunaan dan Privasi kami.',
                        textAlign: TextAlign.center,
                        style:
                            TextStyle(color: Color(0xff555555), fontSize: 11),
                        overflow: TextOverflow.visible,
                      ),
                    ),
                  ]),
                ),

                const SizedBox(height: 14),

                Button(
                  onPressed: () {
                    if (emailController.text.isNotEmpty &&
                        passwordController.text.isNotEmpty &&
                        confirmPasswordController.text ==
                            passwordController.text) {
                      ///
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please fill all fields correctly'),
                        ),
                      );
                    }
                  },
                  text: 'Sign Up',
                ),

                const SizedBox(height: 10),

                Container(
                  height: 20,
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // ignore: prefer_const_constructors
                      Text('Sudah memiliki akun? ',
                          style: const TextStyle(
                              color: Color(0xff646464), fontSize: 12)),
                      InkWell(
                        onTap: () => _navigateToSignInPage(context),
                        child: const Text(
                          'Sign In',
                          style: TextStyle(
                            color: Color(0xff646464),
                            fontSize: 12,
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
