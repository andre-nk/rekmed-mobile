import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rekmed/app/auth/cubit/auth_cubit.dart';
import 'package:rekmed/app/clinic/cubit/clinic_cubit.dart';
import 'package:rekmed/view/widgets/clinic/InfoRow.dart';

class ClinicProfilePage extends StatelessWidget {
  const ClinicProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ClinicCubit(context.read<AuthCubit>().clinicRepository),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          centerTitle: true,
          title: const Text(
            'Akun',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
              return state.maybeWhen(
                authenticated: (clinic) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 120.0,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/RekmedLogo.png',
                              height: 50,
                            ),
                            const SizedBox(width: 10),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: const Text(
                          'Informasi Akun',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.teal,
                          ),
                        ),
                      ),
                      const Divider(color: Colors.teal),
                      InfoRow(
                        title: 'Nama Klinik',
                        value: clinic.name,
                        onSave: (newValue) {
                          context
                              .read<ClinicCubit>()
                              .updateClinic(clinic.copyWith(name: newValue));
                          context.read<AuthCubit>().initialize();
                        },
                      ),
                      InfoRow(
                        title: 'Username Klinik',
                        value: clinic.username,
                        onSave: (newValue) {
                          context
                              .read<ClinicCubit>()
                              .updateClinic(clinic.copyWith(username: newValue));
                        },
                      ),
                      const SizedBox(height: 16.0),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: const Text(
                          'Informasi Klinik',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.teal,
                          ),
                        ),
                      ),
                      const Divider(color: Colors.teal),
                      InfoRow(
                        title: 'E-mail Klinik',
                        value: clinic.email,
                      ),
                      InfoRow(
                        title: 'No. Telepon',
                        value: clinic.phone,
                      ),
                      InfoRow(
                        title: 'Alamat Klinik',
                        value: clinic.address,
                        onSave: (newValue) {
                          context
                              .read<ClinicCubit>()
                              .updateClinic(clinic.copyWith(address: newValue));
                          context.read<AuthCubit>().initialize();
                        },
                      ),
                      InfoRow(
                        title: 'No. BPJS',
                        value: clinic.bpjs.isEmpty ? "Belum diisi" : clinic.bpjs,
                        onSave: (newValue) {
                          context
                              .read<ClinicCubit>()
                              .updateClinic(clinic.copyWith(bpjs: newValue));
                          context.read<AuthCubit>().initialize();
                        },
                      ),
                      InfoRow(
                        title: 'No. SatuSehat',
                        value:
                            clinic.satuSehat.isEmpty ? "Belum diisi" : clinic.satuSehat,
                        onSave: (newValue) {
                          context
                              .read<ClinicCubit>()
                              .updateClinic(clinic.copyWith(satuSehat: newValue));
                          context.read<AuthCubit>().initialize();
                        },
                      ),
                    ],
                  );
                },
                orElse: () {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              );
            }),
          ),
        ),
      ),
    );
  }
}

