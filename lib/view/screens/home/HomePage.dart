import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rekmed/app/auth/cubit/auth_cubit.dart';
import 'package:rekmed/app/rekmed/cubit/rekmed_cubit.dart';
import 'package:rekmed/model/rekmed/rekmed.dart';
import 'package:rekmed/repository/rekmed/rekmed_repository.dart';
import 'package:rekmed/view/widgets/home/HomeBox.dart';
import 'package:rekmed/view/widgets/patient/RekMedBox.dart';

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
              child: Column(
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        Text(
                          clinic.name,
                          style: const TextStyle(
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(top: 24.0),
                            child: HomeBox(clinicID: clinic.uid)),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 7,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Expanded(
                            flex: 1,
                            child: Text(
                              "Data rekam medis terakhir",
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 9,
                            child: BlocProvider(
                              create: (context) => RekmedCubit(
                                context.read<RekmedRepository>(),
                              )..getRekmedQueryByClinicIDAndDateRange(
                                  clinic.uid,
                                  DateTime.now().subtract(const Duration(days: 1)),
                                  DateTime.now(),
                                ),
                              child: BlocBuilder<RekmedCubit, RekmedState>(
                                builder: (context, state) {
                                  return state.maybeWhen(orElse: () {
                                    return const CircularProgressIndicator();
                                  }, queryLoaded: (query) {
                                    return FirestoreListView(
                                      query: query,
                                      itemBuilder: (context, snapshot) {
                                        Rekmed rekmed = Rekmed.fromJson(
                                          snapshot.data() as Map<String, dynamic>,
                                        ).copyWith(id: snapshot.id);

                                        return RekmedBox(
                                          rekmed: rekmed,
                                          isVersion: false,
                                        );
                                      },
                                      emptyBuilder: (context) {
                                        return const Center(
                                          child: Text('Tidak ada rekam medis'),
                                        );
                                      },
                                    );
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
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
