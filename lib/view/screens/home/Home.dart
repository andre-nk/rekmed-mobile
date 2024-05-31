import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rekmed/app/auth/cubit/auth_cubit.dart';
import 'package:rekmed/view/widgets/home/HomeSearchBar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return state.maybeWhen(
          authenticated: (clinic) {
            return Padding(
              padding: const EdgeInsets.all(24.0),
              child: ListView(
                children: [
                  Text(
                    clinic.name,
                    style: const TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 24.0),
                    child: HomeSearchBar(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24.0),
                    child: Container(
                      padding: const EdgeInsets.all(28.0),
                      height: MediaQuery.of(context).size.height * 0.15,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: <Color>[Color(0xFF04AE91), Color(0xFF05CAD5)],
                        ),
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Jumlah pasien\nHari ini",
                            style: TextStyle(
                                fontSize: 18.0,
                                height: 1.5,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "10",
                            style: TextStyle(
                              fontSize: 40.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 24.0),
                    child: Column(
                      children: [
                        
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
          orElse: () {
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        );
      },
    );
  }
}
