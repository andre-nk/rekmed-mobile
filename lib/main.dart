import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_bloc/connectivity_bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rekmed/app/auth/cubit/auth_cubit.dart';
import 'package:rekmed/repository/auth/auth_repository.dart';
import 'package:rekmed/repository/clinic/clinic_repository.dart';
import 'package:rekmed/repository/rekmed/rekmed_repository.dart';
import 'package:rekmed/utlis/theme.dart';
import 'package:rekmed/view/screens/HomeWrapper.dart';
import 'package:rekmed/view/screens/auth/signin/SignInPage.dart'; import 'package:rekmed/view/widgets/shared/DefaultLoadingScreen.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //Hive
  await Hive.initFlutter();

  //Firebase setup
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseFirestore.instance.settings = const Settings(
    persistenceEnabled: true,
    cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED,
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
            RepositoryProvider(
              create: (context) => RekmedRepository(),
            )
          ],
          child: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => AuthCubit(
                  context.read<AuthRepository>(),
                  context.read<ClinicRepository>(),
                )..initialize(),
              ),
              BlocProvider(create: (context) => ConnectivityBloc()),
            ],
            child: BlocListener<ConnectivityBloc, ConnectivityState>(
              listener: (context, state) async {
                if (state is ConnectivitySuccessState) {
                  print("success");
                  var box = await Hive.openBox('rekmed_offline');
                  var rekmeds = box.values.toList();

                  if (rekmeds.isNotEmpty) {
                    for (var rekmed in rekmeds) {
                      // ignore: use_build_context_synchronously
                      await context.read<RekmedRepository>().updateRekmed(rekmed, false);
                    }
                    await box.clear();
                  }
                } else if (state is ConnectivityFailureState) {
                  print("failure");
                } else if (state is ConnectivityInitialState){
                  print("init");
                  final Connectivity connectivity = Connectivity();
                  connectivity.checkConnectivity();
                }
              },
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
      ),
    );
  }
}
