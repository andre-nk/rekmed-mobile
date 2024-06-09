import 'package:connectivity_bloc/connectivity_bloc.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rekmed/app/auth/cubit/auth_cubit.dart';
import 'package:rekmed/app/patient/cubit/patient_cubit.dart';
import 'package:rekmed/app/rekmed/cubit/rekmed_cubit.dart';
import 'package:rekmed/model/patient/patient.dart';
import 'package:rekmed/model/rekmed/rekmed.dart';
import 'package:rekmed/repository/auth/auth_repository.dart';
import 'package:rekmed/repository/clinic/clinic_repository.dart';
import 'package:rekmed/repository/patient/patient_repository.dart';
import 'package:rekmed/repository/rekmed/rekmed_repository.dart';
import 'package:rekmed/view/screens/rekmed/RekMedPage.dart';
import 'package:rekmed/view/widgets/auth/Button.dart';
import 'package:rekmed/view/widgets/doctor/ProfileForm.dart';
import 'package:rekmed/view/widgets/navigation/AppBar.dart';
import 'package:rekmed/view/widgets/patient/RekmedBox.dart';

class PatientProfilePage extends StatefulWidget {
  final Patient? patient;
  const PatientProfilePage({super.key, this.patient});

  @override
  State<PatientProfilePage> createState() => _PatientProfilePageState();
}

class _PatientProfilePageState extends State<PatientProfilePage> {
  bool isEditing = false;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController birthdayController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.patient != null) {
      nameController.text = widget.patient!.name;
      birthdayController.text = widget.patient!.date.toString();
      addressController.text = widget.patient!.address;
    } else {
      setState(() {
        isEditing = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ConnectivityBloc(),
      child: BlocBuilder<ConnectivityBloc, ConnectivityState>(
        builder: (context, state) {
          return MultiRepositoryProvider(
            providers: [
              RepositoryProvider(
                create: (context) => PatientRepository(),
              ),
              RepositoryProvider(create: (context) => RekmedRepository()),
              RepositoryProvider(
                create: (context) => AuthRepository(),
              ),
              RepositoryProvider(
                create: (context) => ClinicRepository(),
              ),
            ],
            child: MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => PatientCubit(context.read<PatientRepository>()),
                ),
                BlocProvider(
                  create: (context) => RekmedCubit(
                    context.read<RekmedRepository>(),
                  )..getRekmedQueryByUserID(widget.patient?.id ?? ""),
                ),
                BlocProvider(
                  create: (context) => AuthCubit(
                    context.read<AuthRepository>(),
                    context.read<ClinicRepository>(),
                  )..initialize(),
                ),
              ],
              child: Scaffold(
                appBar: AppBarCustom(
                  title: widget.patient != null ? "Data Pasien" : "Tambah Pasien",
                  actions: widget.patient != null
                      ? [
                          IconButton(
                            icon: Icon(
                              isEditing ? Icons.close : Icons.edit,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              setState(() {
                                isEditing = !isEditing;
                              });
                            },
                          ),
                        ]
                      : [],
                ),
                floatingActionButton: BlocConsumer<PatientCubit, PatientState>(
                  listener: (patientContext, state) {
                    state.maybeWhen(
                      orElse: () {},
                      success: (patient) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Berhasil menambahkan pasien"),
                          ),
                        );
                        Navigator.pop(context);
                      },
                      error: (message) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(message),
                          ),
                        );
                      },
                    );
                  },
                  builder: (patientContext, state) {
                    if (isEditing) {
                      return Button(
                        onPressed: () {
                          patientContext.read<AuthCubit>().initialize().then((val) {
                            patientContext.read<AuthCubit>().state.maybeMap(
                                  orElse: () {},
                                  authenticated: (state) {
                                    if (widget.patient != null) {
                                      patientContext.read<PatientCubit>().updatePatient(
                                            widget.patient!.copyWith(
                                              name: nameController.text,
                                              date:
                                                  DateTime.parse(birthdayController.text),
                                              address: addressController.text,
                                            ),
                                          );
                                    } else {
                                      patientContext.read<PatientCubit>().addPatient(
                                            Patient(
                                              clinicID: state.clinic.uid,
                                              name: nameController.text,
                                              date:
                                                  DateTime.parse(birthdayController.text),
                                              address: addressController.text,
                                              rekmed: [],
                                              createdAt: DateTime.now(),
                                              updatedAt: DateTime.now(),
                                            ),
                                          );
                                    }
                                  },
                                );
                          });
                        },
                        text: patientContext.read<PatientCubit>().state.maybeWhen(
                          orElse: () {
                            if (isEditing && widget.patient == null) {
                              return "Tambah Pasien";
                            } else {
                              return "Simpan";
                            }
                          },
                          loading: () {
                            return "Loading...";
                          },
                        ),
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
                floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
                body: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: ListView(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 16.0),
                            child: ProfileForm(
                              title: "Nama",
                              hintText: "Masukkan nama",
                              controller: nameController,
                              keyboardType: TextInputType.name,
                              isEditMode: isEditing,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 16.0),
                            child: ProfileForm(
                              title: "Tanggal Lahir",
                              hintText: "Masukkan tanggal lahir",
                              controller: birthdayController,
                              keyboardType: TextInputType.datetime,
                              isEditMode: false,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 16.0),
                            child: ProfileForm(
                              title: "Alamat",
                              hintText: "Masukkan alamat",
                              controller: addressController,
                              keyboardType: TextInputType.text,
                              isEditMode: isEditing,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Rekam Medis",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0,
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.add),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return RekmedPage(
                                            patient: widget.patient,

                                          );
                                        },
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      widget.patient != null
                          ? SizedBox(
                            height: MediaQuery.of(context).size.height * 0.6,
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
                          )
                          : const SizedBox()
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
