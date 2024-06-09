import 'package:connectivity_bloc/connectivity_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rekmed/app/auth/cubit/auth_cubit.dart';
import 'package:rekmed/app/rekmed/cubit/rekmed_cubit.dart';
import 'package:rekmed/model/patient/patient.dart';
import 'package:rekmed/model/rekmed/rekmed.dart';
import 'package:rekmed/repository/auth/auth_repository.dart';
import 'package:rekmed/repository/clinic/clinic_repository.dart';
import 'package:rekmed/repository/rekmed/rekmed_repository.dart';
import 'package:rekmed/view/screens/rekmed/RekmedVersionPage.dart';
import 'package:rekmed/view/widgets/auth/Button.dart';
import 'package:rekmed/view/widgets/doctor/ProfileForm.dart';
import 'package:flutter/material.dart';
import 'package:rekmed/view/widgets/navigation/AppBar.dart';

class RekmedPage extends StatefulWidget {
  final Rekmed? rekmed;
  final Patient? patient;
  final String? overrideID;
  const RekmedPage({super.key, this.rekmed, required this.patient, this.overrideID});

  @override
  State<RekmedPage> createState() => _RekmedPageState();
}

class _RekmedPageState extends State<RekmedPage> {
  bool isEditing = false;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController birthdayController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController famController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController jenisController = TextEditingController();
  final TextEditingController unitController = TextEditingController();
  final TextEditingController jaminanController = TextEditingController();
  final TextEditingController providerController = TextEditingController();
  final TextEditingController kunjunganController = TextEditingController();
  final TextEditingController petugasController = TextEditingController();
  final TextEditingController tinggiController = TextEditingController();
  final TextEditingController beratController = TextEditingController();
  final TextEditingController tekananController = TextEditingController();
  final TextEditingController suhuController = TextEditingController();
  final TextEditingController diagnosis1Controller = TextEditingController();
  final TextEditingController kodeDiagnosis1Controller = TextEditingController();
  final TextEditingController blkk1Controller = TextEditingController();
  final TextEditingController diagnosis2Controller = TextEditingController();
  final TextEditingController kodeDiagnosis2Controller = TextEditingController();
  final TextEditingController blkk2Controller = TextEditingController();
  final TextEditingController obatController = TextEditingController();
  final TextEditingController kodeObatController = TextEditingController();
  final TextEditingController dosisController = TextEditingController();
  final TextEditingController jumlahController = TextEditingController();
  final TextEditingController alergiController = TextEditingController();
  final TextEditingController tindakLanjutController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.rekmed != null) {
      nameController.text = widget.rekmed!.name;
      birthdayController.text = widget.rekmed!.birthday.toString();
      addressController.text = widget.rekmed!.address;
      famController.text = widget.rekmed!.famFolder;
      dateController.text = widget.rekmed!.date.toString();
      jenisController.text = widget.rekmed!.jenisPasien;
      unitController.text = widget.rekmed!.unit;
      jaminanController.text = widget.rekmed!.noJaminan;
      providerController.text = widget.rekmed!.providerBPJS;
      kunjunganController.text = widget.rekmed!.kunjungan;
      petugasController.text = widget.rekmed!.petugasMedis;
      tinggiController.text = widget.rekmed!.tinggiBadan.toString();
      beratController.text = widget.rekmed!.beratBadan.toString();
      tekananController.text = widget.rekmed!.tekananDarah.toString();
      suhuController.text = widget.rekmed!.suhuTubuh.toString();
      diagnosis1Controller.text = widget.rekmed!.diagnosis1;
      kodeDiagnosis1Controller.text = widget.rekmed!.kodeDiagnosis1;
      blkk1Controller.text = widget.rekmed!.blkk1;
      diagnosis2Controller.text = widget.rekmed!.diagnosis2;
      kodeDiagnosis2Controller.text = widget.rekmed!.kodeDiagnosis2;
      blkk2Controller.text = widget.rekmed!.blkk2;
      obatController.text = widget.rekmed!.obat;
      kodeObatController.text = widget.rekmed!.kodeObat;
      dosisController.text = widget.rekmed!.dosis.toString();
      jumlahController.text = widget.rekmed!.jumlah.toString();
      alergiController.text = widget.rekmed!.alergi.toString();
      tindakLanjutController.text = widget.rekmed!.kunjungan;
    } else {
      nameController.text = widget.patient!.name;
      birthdayController.text = widget.patient!.date.toString();
      addressController.text = widget.patient!.address;

      setState(() {
        isEditing = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ConnectivityBloc(),
      child: MultiRepositoryProvider(
        providers: [
          RepositoryProvider(
            create: (context) => AuthRepository(),
          ),
          RepositoryProvider(
            create: (context) => RekmedRepository(),
          ),
          RepositoryProvider(create: (context) => ClinicRepository())
        ],
        child: BlocBuilder<ConnectivityBloc, ConnectivityState>(
          builder: (connContext, connState) {
            return MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => RekmedCubit(
                    context.read<RekmedRepository>(),
                  ),
                ),
                BlocProvider(
                  create: (context) => AuthCubit(
                    context.read<AuthRepository>(),
                    context.read<ClinicRepository>(),
                  ),
                ),
              ],
              child: Scaffold(
                  appBar: AppBarCustom(
                    title:
                        widget.rekmed != null ? "Data Rekam Medis" : "Tambah Rekam Medis",
                    actions: widget.rekmed != null && widget.overrideID != null
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
                        : [
                            IconButton(
                              icon: const Icon(
                                Icons.history,
                                color: Colors.black,
                              ),
                              onPressed: () {
                                Navigator.push(connContext,
                                    MaterialPageRoute(builder: (context) {
                                  return RekmedVersionPage(
                                    rekmedID: widget.rekmed?.id! ?? "",
                                  );
                                }));
                              },
                            ),
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
                          ],
                  ),
                  floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
                  floatingActionButton: BlocConsumer<RekmedCubit, RekmedState>(
                    listener: (patientContext, state) {
                      state.maybeWhen(
                        orElse: () {},
                        success: () {
                          ScaffoldMessenger.of(connContext).showSnackBar(
                            const SnackBar(
                              content: Text("Berhasil memperbarui rekam medis"),
                            ),
                          );
                          Navigator.pop(connContext);
                        },
                        error: (message) {
                          ScaffoldMessenger.of(connContext).showSnackBar(
                            SnackBar(
                              content: Text(message),
                            ),
                          );
                        },
                      );
                    },
                    builder: (rekmedContext, state) {
                      if (widget.overrideID != null) {
                        return Button(
                          onPressed: () {
                            rekmedContext.read<RekmedCubit>().updateRekmed(
                                  widget.rekmed!,
                                  false,
                                  overrideID: widget.overrideID,
                                );
                          },
                          text: rekmedContext.read<RekmedCubit>().state.maybeWhen(
                            orElse: () {
                              return "Perbarui rekam medis";
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
                  body: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 50.0),
                            child: ProfileForm(
                              title: "Nama",
                              hintText: "Nama",
                              controller: nameController,
                              keyboardType: TextInputType.text,
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
                            child: ProfileForm(
                              title: "Fam Folder (B/L)",
                              hintText: "Fam Folder (B/L)",
                              controller: famController,
                              keyboardType: TextInputType.text,
                              isEditMode: isEditing,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 50.0),
                            child: ProfileForm(
                              title: "Tanggal Masuk",
                              hintText: "Tanggal Masuk",
                              controller: dateController,
                              keyboardType: TextInputType.datetime,
                              isEditMode: false,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 16.0),
                            child: ProfileForm(
                              title: "Jenis Pasien",
                              hintText: "Jenis Pasien",
                              controller: jenisController,
                              keyboardType: TextInputType.text,
                              isEditMode: isEditing,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 16.0),
                            child: ProfileForm(
                              title: "Unit",
                              hintText: "Unit",
                              controller: unitController,
                              keyboardType: TextInputType.text,
                              isEditMode: isEditing,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 16.0),
                            child: ProfileForm(
                              title: "No. Jaminan",
                              hintText: "No. Jaminan",
                              controller: jaminanController,
                              keyboardType: TextInputType.number,
                              isEditMode: isEditing,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 16.0),
                            child: ProfileForm(
                              title: "Provider BPJS",
                              hintText: "Provider BPJS",
                              controller: providerController,
                              keyboardType: TextInputType.text,
                              isEditMode: isEditing,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 16.0),
                            child: ProfileForm(
                              title: "Kunjungan",
                              hintText: "Kunjungan ",
                              controller: kunjunganController,
                              keyboardType: TextInputType.text,
                              isEditMode: isEditing,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 16.0),
                            child: ProfileForm(
                              title: "Petugas Medis",
                              hintText: "Petugas Medis",
                              controller: petugasController,
                              keyboardType: TextInputType.text,
                              isEditMode: isEditing,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 50.0),
                            child: ProfileForm(
                              title: "Tinggi Badan (cm)",
                              hintText: "Masukkan tinggi badan",
                              controller: tinggiController,
                              keyboardType: TextInputType.number,
                              isEditMode: isEditing,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 16.0),
                            child: ProfileForm(
                              title: "Berat Badan (kg)",
                              hintText: "Berat Badan",
                              controller: beratController,
                              keyboardType: TextInputType.number,
                              isEditMode: isEditing,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 16.0),
                            child: ProfileForm(
                              title: "Tekanan Darah",
                              hintText: "Tekanan Darah",
                              controller: tekananController,
                              keyboardType: TextInputType.number,
                              isEditMode: isEditing,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 16.0),
                            child: ProfileForm(
                              title: "Suhu Tubuh",
                              hintText: "Suhu Tubuh",
                              controller: suhuController,
                              keyboardType: TextInputType.text,
                              isEditMode: isEditing,
                            ),
                          ),
                          const SizedBox(height: 35.0),
                          const Center(
                            child: Text(
                              "Diagnosis",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                decoration: TextDecoration.underline,
                                decorationThickness: 2.0,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 23.0),
                            child: ProfileForm(
                              title: "Diagnosis 1",
                              hintText: "xxxxx",
                              controller: diagnosis1Controller,
                              keyboardType: TextInputType.text,
                              isEditMode: isEditing,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 16.0),
                            child: ProfileForm(
                              title: "Kode Diagnosis",
                              hintText: "xxxxx",
                              controller: kodeDiagnosis1Controller,
                              keyboardType: TextInputType.text,
                              isEditMode: isEditing,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 16.0),
                            child: ProfileForm(
                              title: "B/L/KK",
                              hintText: "xxxxx",
                              controller: blkk1Controller,
                              keyboardType: TextInputType.text,
                              isEditMode: isEditing,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 50.0),
                            child: ProfileForm(
                              title: "Diagnosis 2",
                              hintText: "xxxxx",
                              controller: diagnosis2Controller,
                              keyboardType: TextInputType.text,
                              isEditMode: isEditing,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 16.0),
                            child: ProfileForm(
                              title: "Kode Diagnosis",
                              hintText: "xxxxx",
                              controller: kodeDiagnosis2Controller,
                              keyboardType: TextInputType.text,
                              isEditMode: isEditing,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 16.0),
                            child: ProfileForm(
                              title: "B/L/KK",
                              hintText: "xxxxx",
                              controller: blkk2Controller,
                              keyboardType: TextInputType.text,
                              isEditMode: isEditing,
                            ),
                          ),
                          const SizedBox(height: 35.0),
                          const Center(
                            child: Text(
                              "Obat",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                decoration: TextDecoration.underline,
                                decorationThickness: 2.0,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 23.0),
                            child: ProfileForm(
                              title: "Obat 1",
                              hintText: "xxxxx",
                              controller: obatController,
                              keyboardType: TextInputType.text,
                              isEditMode: isEditing,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 16.0),
                            child: ProfileForm(
                              title: "Kode Obat",
                              hintText: "xxxxx",
                              controller: kodeObatController,
                              keyboardType: TextInputType.text,
                              isEditMode: isEditing,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 16.0),
                            child: ProfileForm(
                              title: "Dosis",
                              hintText: "xxxxx",
                              controller: dosisController,
                              keyboardType: TextInputType.number,
                              isEditMode: isEditing,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 16.0),
                            child: ProfileForm(
                              title: "Jumlah",
                              hintText: "xxxxx",
                              controller: jumlahController,
                              keyboardType: TextInputType.number,
                              isEditMode: isEditing,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 16.0),
                            child: ProfileForm(
                              title: "Alergi",
                              hintText: "xxxxx",
                              controller: alergiController,
                              keyboardType: TextInputType.text,
                              isEditMode: isEditing,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 16.0),
                            child: ProfileForm(
                              title: "Tindak Lanjut",
                              hintText: "-",
                              controller: tindakLanjutController,
                              keyboardType: TextInputType.text,
                              isEditMode: isEditing,
                            ),
                          ),
                          if (isEditing)
                            BlocConsumer<RekmedCubit, RekmedState>(
                              listener: (rekmedContext, state) {
                                state.maybeWhen(
                                  orElse: () {},
                                  success: () {
                                    ScaffoldMessenger.of(connContext).showSnackBar(
                                      const SnackBar(
                                        content: Text("Berhasil menambahkan rekam medis"),
                                      ),
                                    );
                                    Navigator.pop(connContext);
                                  },
                                  error: (message) {
                                    ScaffoldMessenger.of(connContext).showSnackBar(
                                      SnackBar(
                                        content: Text(message),
                                      ),
                                    );
                                  },
                                );
                              },
                              builder: (rekmedContext, state) {
                                if (isEditing) {
                                  return Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 24.0),
                                    child: Button(
                                      onPressed: () {
                                        rekmedContext
                                            .read<AuthCubit>()
                                            .initialize()
                                            .then(
                                          (val) {
                                            rekmedContext
                                                .read<AuthCubit>()
                                                .state
                                                .maybeMap(
                                                  orElse: () {},
                                                  authenticated: (state) {
                                                    if (widget.rekmed != null) {
                                                      rekmedContext
                                                          .read<RekmedCubit>()
                                                          .updateRekmed(
                                                            widget.rekmed!.copyWith(
                                                              name:
                                                                  nameController.text,
                                                              birthday: DateTime.parse(
                                                                  birthdayController
                                                                      .text),
                                                              address:
                                                                  addressController
                                                                      .text,
                                                              famFolder:
                                                                  famController.text,
                                                              date: DateTime.tryParse(
                                                                      dateController
                                                                          .text) ??
                                                                  DateTime.now(),
                                                              jenisPasien:
                                                                  jenisController
                                                                      .text,
                                                              unit:
                                                                  unitController.text,
                                                              noJaminan:
                                                                  jaminanController
                                                                      .text,
                                                              providerBPJS:
                                                                  providerController
                                                                      .text,
                                                              kunjungan:
                                                                  kunjunganController
                                                                      .text,
                                                              petugasMedis:
                                                                  petugasController
                                                                      .text,
                                                              tinggiBadan: int.tryParse(
                                                                      tinggiController
                                                                          .text) ??
                                                                  0,
                                                              beratBadan: int.tryParse(
                                                                      beratController
                                                                          .text) ??
                                                                  0,
                                                              tekananDarah: int.tryParse(
                                                                      tekananController
                                                                          .text) ??
                                                                  0,
                                                              suhuTubuh: int.tryParse(
                                                                      suhuController
                                                                          .text) ??
                                                                  0,
                                                              diagnosis1:
                                                                  diagnosis1Controller
                                                                      .text,
                                                              kodeDiagnosis1:
                                                                  kodeDiagnosis1Controller
                                                                      .text,
                                                              blkk1: blkk1Controller
                                                                  .text,
                                                              diagnosis2:
                                                                  diagnosis2Controller
                                                                      .text,
                                                              kodeDiagnosis2:
                                                                  kodeDiagnosis2Controller
                                                                      .text,
                                                              blkk2: blkk2Controller
                                                                  .text,
                                                              obat:
                                                                  obatController.text,
                                                              kodeObat:
                                                                  kodeObatController
                                                                      .text,
                                                              dosis: int.tryParse(
                                                                      dosisController
                                                                          .text) ??
                                                                  0,
                                                              jumlah: int.tryParse(
                                                                      jumlahController
                                                                          .text) ??
                                                                  0,
                                                              alergi: alergiController
                                                                  .text,
                                                              tindakLanjut:
                                                                  tindakLanjutController
                                                                      .text,
                                                              updatedAt:
                                                                  DateTime.now(),
                                                            ),
                                                            connState
                                                                is ConnectivityFailureState,
                                                          );
                                                    } else {
                                                      rekmedContext
                                                          .read<RekmedCubit>()
                                                          .addRekmed(
                                                            Rekmed(
                                                              clinicID:
                                                                  state.clinic.uid,
                                                              name:
                                                                  nameController.text,
                                                              birthday: DateTime.tryParse(
                                                                      birthdayController
                                                                          .text) ??
                                                                  DateTime.now(),
                                                              address:
                                                                  addressController
                                                                      .text,
                                                              famFolder:
                                                                  famController.text,
                                                              date: DateTime.tryParse(
                                                                      dateController
                                                                          .text) ??
                                                                  DateTime.now(),
                                                              jenisPasien:
                                                                  jenisController
                                                                      .text,
                                                              unit:
                                                                  unitController.text,
                                                              noJaminan:
                                                                  jaminanController
                                                                      .text,
                                                              providerBPJS:
                                                                  providerController
                                                                      .text,
                                                              kunjungan:
                                                                  kunjunganController
                                                                      .text,
                                                              petugasMedis:
                                                                  petugasController
                                                                      .text,
                                                              tinggiBadan: int.tryParse(
                                                                      tinggiController
                                                                          .text) ??
                                                                  0,
                                                              beratBadan: int.tryParse(
                                                                      beratController
                                                                          .text) ??
                                                                  0,
                                                              tekananDarah: int.tryParse(
                                                                      tekananController
                                                                          .text) ??
                                                                  0,
                                                              suhuTubuh: int.tryParse(
                                                                      suhuController
                                                                          .text) ??
                                                                  0,
                                                              diagnosis1:
                                                                  diagnosis1Controller
                                                                      .text,
                                                              kodeDiagnosis1:
                                                                  kodeDiagnosis1Controller
                                                                      .text,
                                                              blkk1: blkk1Controller
                                                                  .text,
                                                              diagnosis2:
                                                                  diagnosis2Controller
                                                                      .text,
                                                              kodeDiagnosis2:
                                                                  kodeDiagnosis2Controller
                                                                      .text,
                                                              blkk2: blkk2Controller
                                                                  .text,
                                                              obat:
                                                                  obatController.text,
                                                              kodeObat:
                                                                  kodeObatController
                                                                      .text,
                                                              dosis: int.tryParse(
                                                                      dosisController
                                                                          .text) ??
                                                                  0,
                                                              jumlah: int.tryParse(
                                                                      jumlahController
                                                                          .text) ??
                                                                  0,
                                                              alergi: alergiController
                                                                  .text,
                                                              tindakLanjut:
                                                                  tindakLanjutController
                                                                      .text,
                                                              createdAt:
                                                                  DateTime.now(),
                                                              updatedAt:
                                                                  DateTime.now(),
                                                              patientID:
                                                                  widget.patient!.id!,
                                                            ),
                                                          );
                                                    }
                                                  },
                                                );
                                          },
                                        );
                                      },
                                      text: rekmedContext
                                          .read<RekmedCubit>()
                                          .state
                                          .maybeWhen(
                                        orElse: () {
                                          if (isEditing && widget.patient == null) {
                                            return "Tambah Rekam Medis";
                                          } else {
                                            return "Simpan";
                                          }
                                        },
                                        loading: () {
                                          return "Loading...";
                                        },
                                      ),
                                    ),
                                  );
                                } else {
                                  return const SizedBox();
                                }
                              },
                            ),
                        ],
                      ),
                    ),
                  )),
            );
          },
        ),
      ),
    );
  }
}
