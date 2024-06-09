import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rekmed/app/auth/cubit/auth_cubit.dart';
import 'package:rekmed/app/doctor/cubit/doctor_cubit.dart';
import 'package:rekmed/model/doctor/doctor.dart';
import 'package:rekmed/repository/auth/auth_repository.dart';
import 'package:rekmed/repository/clinic/clinic_repository.dart';
import 'package:rekmed/repository/doctor/doctor_repository.dart';
import 'package:rekmed/utlis/poli.dart';
import 'package:rekmed/view/widgets/auth/Button.dart';
import 'package:rekmed/view/widgets/doctor/ProfileForm.dart';
import 'package:rekmed/view/widgets/navigation/AppBar.dart';
import 'package:rekmed/view/widgets/doctor/DoctorProfilePicture.dart';
import 'package:uuid/uuid.dart';

class DoctorProfilePage extends StatefulWidget {
  final Doctor? doctor;
  const DoctorProfilePage({super.key, this.doctor});

  @override
  State<DoctorProfilePage> createState() => _DoctorProfilePageState();
}

class _DoctorProfilePageState extends State<DoctorProfilePage> {
  bool isEditing = false;
  String doctorID = "";
  Poli poli = Poli.anak;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController nikController = TextEditingController();
  final TextEditingController strController = TextEditingController();
  final TextEditingController poliController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.doctor != null) {
      emailController.text = widget.doctor!.email;
      phoneController.text = widget.doctor!.phone.toString();
      nameController.text = widget.doctor!.name;
      nikController.text = widget.doctor!.nik.toString();
      strController.text = widget.doctor!.str.toString();
      poliController.text = widget.doctor!.poli.toString();
    } else {
      setState(() {
        doctorID = const Uuid().v4();
        isEditing = true;
      });
    }
  }

  void addOrUpdateDoctor(
    BuildContext doctorContext,
    String clinicID,
    String? profilePictureURL,
  ) {
    if (widget.doctor != null) {
      if (profilePictureURL != null) {
        doctorContext.read<DoctorCubit>().updateDoctor(
              widget.doctor!.copyWith(
                profilePicture: profilePictureURL,
                clinicID: clinicID,
                name: nameController.text,
                email: emailController.text,
                phone: int.parse(phoneController.text),
                nik: int.parse(nikController.text),
                str: int.parse(strController.text),
                poli: poli,
                updatedAt: DateTime.now(),
              ),
            );
      } else {
        doctorContext.read<DoctorCubit>().updateDoctor(
              widget.doctor!.copyWith(
                clinicID: clinicID,
                name: nameController.text,
                email: emailController.text,
                phone: int.parse(phoneController.text),
                nik: int.parse(nikController.text),
                str: int.parse(strController.text),
                poli: poli,
                updatedAt: DateTime.now(),
              ),
            );
      }
    } else {
      doctorContext.read<DoctorCubit>().addDoctor(
            Doctor(
              profilePicture: profilePictureURL ?? "",
              clinicID: clinicID,
              name: nameController.text,
              email: emailController.text,
              phone: int.parse(phoneController.text),
              nik: int.parse(nikController.text),
              str: int.parse(strController.text),
              poli: Poli.anak,
              createdAt: DateTime.now(),
              updatedAt: DateTime.now(),
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => DoctorRepository(),
        ),
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
            create: (context) => DoctorCubit(context.read<DoctorRepository>()),
          ),
          BlocProvider(
            create: (context) => AuthCubit(
                context.read<AuthRepository>(), context.read<ClinicRepository>())
              ..initialize(),
          ),
        ],
        child: Scaffold(
          appBar: AppBarCustom(
            title: widget.doctor != null ? "Profil Dokter" : "Tambah Dokter",
            actions: widget.doctor != null
                ? [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          isEditing = !isEditing;
                        });
                      },
                      icon: Icon(
                        isEditing ? Icons.close : Icons.edit,
                        color: Colors.black,
                      ),
                    ),
                  ]
                : [],
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DoctorProfilePicture(
                    doctorID: doctorID,
                    profilePicture: widget.doctor?.profilePicture,
                    isEditing: isEditing,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: ProfileForm(
                      title: "E-mail",
                      hintText: "Masukkan e-mail",
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      isEditMode: isEditing,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: ProfileForm(
                      title: "No. Telepon",
                      hintText: "Masukkan no. telepon",
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      isEditMode: isEditing,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: ProfileForm(
                      title: "Nama Dokter",
                      hintText: "Masukkan nama dokter",
                      controller: nameController,
                      keyboardType: TextInputType.name,
                      isEditMode: isEditing,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: ProfileForm(
                      title: "NIK",
                      hintText: "Masukkan NIK",
                      controller: nikController,
                      keyboardType: TextInputType.number,
                      isEditMode: isEditing,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: ProfileForm(
                      title: "No. STR",
                      hintText: "Masukkan no. STR",
                      controller: strController,
                      keyboardType: TextInputType.number,
                      isEditMode: isEditing,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text(
                          "Poli",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        DropdownButton<Poli>(
                          isExpanded: true,
                          items: const [
                            DropdownMenuItem(
                              value: Poli.anak,
                              child: Text("Anak"),
                            ),
                            DropdownMenuItem(
                              value: Poli.umum,
                              child: Text("Umum"),
                            ),
                            DropdownMenuItem(
                              value: Poli.gigi,
                              child: Text("Gigi"),
                            ),
                            DropdownMenuItem(
                              value: Poli.kandungan,
                              child: Text("Kandungan"),
                            ),
                            DropdownMenuItem(
                              value: Poli.mata,
                              child: Text("Mata"),
                            ),
                            DropdownMenuItem(
                              value: Poli.jantung,
                              child: Text("Jantung"),
                            ),
                            DropdownMenuItem(
                              value: Poli.syaraf,
                              child: Text("Syaraf"),
                            ),
                            DropdownMenuItem(
                              value: Poli.bedah,
                              child: Text("Bedah"),
                            ),
                            DropdownMenuItem(
                              value: Poli.kulit,
                              child: Text("Kulit"),
                            ),
                            DropdownMenuItem(
                              value: Poli.tht,
                              child: Text("THT"),
                            ),
                            DropdownMenuItem(
                              value: Poli.paru,
                              child: Text("Paru"),
                            ),
                            DropdownMenuItem(
                              value: Poli.saraf,
                              child: Text("Saraf"),
                            ),
                            DropdownMenuItem(
                              value: Poli.tulang,
                              child: Text("Tulang"),
                            ),
                            DropdownMenuItem(
                              value: Poli.jiwa,
                              child: Text("Jiwa"),
                            ),
                            DropdownMenuItem(
                              value: Poli.ginjal,
                              child: Text("Ginjal"),
                            ),
                            DropdownMenuItem(
                              value: Poli.lambung,
                              child: Text("Lambung"),
                            ),
                            DropdownMenuItem(
                              value: Poli.hati,
                              child: Text("Hati"),
                            ),
                            DropdownMenuItem(
                              value: Poli.penyakitDalam,
                              child: Text("Penyakit Dalam"),
                            ),
                            DropdownMenuItem(
                              value: Poli.endokrin,
                              child: Text("Endokrin"),
                            ),
                          ],
                          value: poli,
                          onChanged: isEditing
                              ? (val) {
                                  setState(() {
                                    poli = val!;
                                  });
                                }
                              : null,
                        ),
                      ],
                    ),
                  ),
                  isEditing
                      ? BlocConsumer<DoctorCubit, DoctorState>(
                          listener: (doctorContext, state) {
                            state.maybeWhen(
                              orElse: () {},
                              error: (message) {
                                ScaffoldMessenger.of(doctorContext).showSnackBar(
                                  SnackBar(
                                    content: Text(message),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                              },
                              success: (val) {
                                ScaffoldMessenger.of(doctorContext).showSnackBar(
                                  const SnackBar(
                                    content: Text('Data dokter berhasil disimpan!'),
                                    backgroundColor: Colors.green,
                                  ),
                                );
                                Navigator.pop(context);
                              },
                            );
                          },
                          builder: (doctorContext, state) {
                            return Button(
                              onPressed: () {
                                doctorContext.read<AuthCubit>().initialize().then((val) {
                                  doctorContext.read<AuthCubit>().state.maybeMap(
                                        orElse: () {},
                                        authenticated: (state) {
                                          doctorContext
                                              .read<DoctorCubit>()
                                              .state
                                              .maybeWhen(
                                                orElse: () {},
                                                initial: () {
                                                  addOrUpdateDoctor(
                                                    doctorContext,
                                                    state.clinic.uid,
                                                    null,
                                                  );
                                                },
                                                profilePictureUploaded: (url) {
                                                  addOrUpdateDoctor(
                                                    doctorContext,
                                                    state.clinic.uid,
                                                    url,
                                                  );
                                                },
                                              );
                                        },
                                      );
                                });
                              },
                              text: doctorContext.read<DoctorCubit>().state.maybeWhen(
                                orElse: () {
                                  if (isEditing && widget.doctor == null) {
                                    return "Tambah Dokter";
                                  } else {
                                    return "Simpan";
                                  }
                                },
                                loading: () {
                                  return "Loading...";
                                },
                              ),
                            );
                          },
                        )
                      : const SizedBox(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
