import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rekmed/app/auth/cubit/auth_cubit.dart';
import 'package:rekmed/repository/auth/auth_repository.dart';
import 'package:rekmed/utlis/theme.dart';
import 'package:rekmed/view/screens/HomeWrapper.dart';
import 'package:rekmed/view/screens/doctor/DoctorProfilePage.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: AppTheme.theme,
        title: "Rekmed Mobile",
        home: BlocProvider(
            create: (context) => AuthCubit(AuthRepository())..initialize(),
            child: BlocBuilder<AuthCubit, AuthState>(builder: (context, AuthState state) {
              return state.when(initial: () {
                return const Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }, authenticated: (clinic) {
                return Scaffold(
                  body: Center(
                      child: Column(
                    children: [
                      Text("Authenticated: ${clinic.name}"),
                      ElevatedButton(
                        onPressed: () {
                          context.read<AuthCubit>().signOut();
                        },
                        child: const Text("Sign Out"),
                      ),
                    ],
                  )),
                );
              }, unauthenticated: () {
                return Scaffold(
                  body: Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Unauthenticated"),
                      ElevatedButton(
                        onPressed: () {
                          context.read<AuthCubit>().signUpWithEmailAndPassword(
                              email: "andreasnotokusumo23@gmail.com",
                              password: "password123",
                              name: "Klinik",
                              address: "",
                              phone: 0,
                              bpjs: "",
                              satuSehat: "");
                        },
                        child: const Text("Sign Up"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          context.read<AuthCubit>().signInWithEmailAndPassword(
                              email: "andreasnotokusumo23@gmail.com",
                              password: "password123");
                        },
                        child: const Text("Sign In"),
                      ),
                    ],
                  )),
                );
              }, loading: () {
                return const Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }, error: (e) {
                return Scaffold(
                  body: Center(
                    child: Text(e),
                  ),
                );
              });
            })));
  }
}
