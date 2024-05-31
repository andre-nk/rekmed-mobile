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
import 'package:rekmed/view/widgets/shared/DefaultLoadingScreen.dart';
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
      initialRoute: '/',
      routes: {
        '/signin': (context) => const SignInPage(),
      },
      home: SafeArea(
        child: MultiRepositoryProvider(
          providers: [
            RepositoryProvider(
              create: (context) => AuthRepository(),
            ),
            RepositoryProvider(
              create: (context) => ClinicRepository(),
            ),
          ],
          child: BlocProvider(
            create: (context) => AuthCubit(
              context.read<AuthRepository>(),
              context.read<ClinicRepository>(),
            )..initialize(),
            child: BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                state.maybeWhen(
                  orElse: () {},
                  error: (msg) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(msg),
                      ),
                    );
                  },
                );
              },
              builder: (context, authState) {
                return authState.maybeWhen(orElse: () {
                  return const DefaultLoadingScreen();
                }, initial: () {
                  return const DefaultLoadingScreen();
                }, authenticated: (clinic) {
                  return const HomeWrapper();
                }, unauthenticated: () {
                  return const SignInPage();
                }, error: (e) {
                  return const SignInPage();
                }, loading: () {
                  return const Scaffold(
                    body: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
