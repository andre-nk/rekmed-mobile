import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rekmed/app/auth/cubit/auth_cubit.dart';
import 'package:rekmed/repository/auth/auth_repository.dart';
import 'package:rekmed/utlis/theme.dart';
import 'package:rekmed/view/screens/HomeWrapper.dart';
import 'package:rekmed/view/screens/auth/signin/SignInPage.dart';
import 'package:rekmed/view/screens/doctor/DoctorProfilePage.dart';
import 'package:rekmed/view/screens/patient/PatientProfilePage.dart';
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
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      title: "Rekmed Mobile",
      home: SafeArea(
        child: BlocProvider(
          create: (context) => AuthCubit(AuthRepository())..initialize(),
          child: BlocBuilder<AuthCubit, AuthState>(builder: (context, AuthState state) {
            return state.when(initial: () {
              return const Scaffold(
                body: Center(
                  child: Text(""),
                ),
              );
            }, authenticated: (clinic) {
              return const HomeWrapper();
            }, unauthenticated: () {
              return const PatientProfilePage();
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
          }),
        ),
      ),
    );
  }
}
