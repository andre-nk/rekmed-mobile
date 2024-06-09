import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rekmed/app/auth/cubit/auth_cubit.dart';
import 'package:rekmed/app/patient/cubit/patient_cubit.dart';
import 'package:rekmed/model/patient/patient.dart';
import 'package:rekmed/repository/patient/patient_repository.dart';
import 'package:rekmed/view/screens/patient/PatientProfilePage.dart';
import 'package:rekmed/view/widgets/home/HomeSearchBar.dart';
import 'package:rekmed/view/widgets/patient/PatientListTile.dart';

class PatientListPage extends StatelessWidget {
  const PatientListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => PatientRepository(),
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          return state.maybeWhen(orElse: () {
            return const CircularProgressIndicator();
          }, authenticated: (user) {
            return BlocProvider(
              create: (context) =>
                  PatientCubit(context.read<PatientRepository>())..loadQuery(user.uid),
              child: Scaffold(
                appBar: AppBar(
                  title: const Text(
                    'Daftar Pasien',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  centerTitle: true,
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                ),
                floatingActionButton: FloatingActionButton(
                  elevation: 0.1,
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return const PatientProfilePage();
                    }));
                  },
                  child: const Icon(Icons.add),
                ),
                body: Column(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: HomeSearchBar(
                          clinicID: user.uid,
                          isPatientSearch: true,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 8,
                      child: BlocBuilder<PatientCubit, PatientState>(
                        builder: (context, state) {
                          return state.maybeWhen(
                            orElse: () {
                              return const CircularProgressIndicator();
                            },
                            queryLoaded: (query) {
                              return FirestoreListView(
                                query: query,
                                itemBuilder: (context, snapshot) {
                                  Patient patient = Patient.fromJson(
                                          snapshot.data() as Map<String, dynamic>)
                                      .copyWith(id: snapshot.id);

                                  return PatientListTile(patient: patient);
                                },
                                emptyBuilder: (context) {
                                  return const Center(child: Text('Tidak ada pasien'));
                                },
                              );
                            },
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            );
          });
        },
      ),
    );
  }
}
