import 'package:connectivity_bloc/connectivity_bloc.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rekmed/app/auth/cubit/auth_cubit.dart';
import 'package:rekmed/repository/auth/auth_repository.dart';
import 'package:rekmed/repository/clinic/clinic_repository.dart';
import 'package:rekmed/utlis/theme.dart';
import 'package:rekmed/view/screens/HomeWrapper.dart';
import 'package:rekmed/view/screens/auth/signin/SignInPage.dart';
import 'package:rekmed/view/screens/doctor/DoctorProfilePage.dart';
import 'package:rekmed/view/screens/patient/PatientProfilePage.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //Hive
  await Hive.initFlutter();
  await Hive.openBox('rekmed_offline');

  //Firebase setup
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
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) =>
                  AuthCubit(AuthRepository(), ClinicRepository())..initialize(),
            ),
            BlocProvider(
              create: (context) => ConnectivityBloc(),
            ),
          ],
          child: BlocBuilder<ConnectivityBloc, ConnectivityState>(
            builder: (context, connState) {
              return BlocBuilder<AuthCubit, AuthState>(
                builder: (context, AuthState authState) {
                  return authState.when(
                    initial: () {
                      return const Scaffold(
                        body: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    },
                    authenticated: (clinic) {
                      return const HomeWrapper();
                    },
                    unauthenticated: () {
                      return const SignInPage();
                    },
                    loading: () {
                      return const Scaffold(
                        body: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    },
                    error: (e) {
                      return Scaffold(
                        body: Center(
                          child: Text(e),
                        ),
                      );
                    },
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
