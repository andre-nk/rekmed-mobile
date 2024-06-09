import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rekmed/app/auth/cubit/auth_cubit.dart';
import 'package:rekmed/app/doctor/cubit/doctor_cubit.dart';
import 'package:rekmed/model/doctor/doctor.dart';
import 'package:rekmed/repository/doctor/doctor_repository.dart';
import 'package:rekmed/view/screens/doctor/DoctorProfilePage.dart';
import 'package:rekmed/view/widgets/doctor/DoctorListTile.dart';
import 'package:rekmed/view/widgets/home/HomeSearchBar.dart';

class DoctorListPage extends StatelessWidget {
  const DoctorListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => DoctorRepository(),
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          return state.maybeWhen(orElse: () {
            return const CircularProgressIndicator();
          }, authenticated: (clinic) {
            return BlocProvider(
              create: (context) =>
                  DoctorCubit(context.read<DoctorRepository>())..loadQuery(clinic.uid),
              child: Scaffold(
                appBar: AppBar(
                  title: const Text(
                    'Daftar Dokter',
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
                      return const DoctorProfilePage();
                    }));
                  },
                  child: const Icon(Icons.add),
                ),
                body: Padding(
                  padding: const EdgeInsets.all(24.0).copyWith(top: 0),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 24.0),
                          child: HomeSearchBar(
                            clinicID: clinic.uid,
                            isPatientSearch: false,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 8,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: BlocBuilder<DoctorCubit, DoctorState>(
                            builder: (context, state) {
                              return state.maybeWhen(
                                orElse: () {
                                  return const CircularProgressIndicator();
                                },
                                queryLoaded: (query) {
                                  return FirestoreListView(
                                    query: query,
                                    itemBuilder: (context, snapshot) {
                                      Doctor doctor = Doctor.fromJson(
                                        snapshot.data() as Map<String, dynamic>,
                                      ).copyWith(id: snapshot.id);

                                      return DoctorListTile(
                                        doctor: doctor,
                                      );
                                    },
                                    emptyBuilder: (context) {
                                      return const Center(
                                        child: Text('Tidak ada dokter'),
                                      );
                                    },
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          });
        },
      ),
    );
  }
}
