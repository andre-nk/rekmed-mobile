import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rekmed/app/patient/cubit/patient_cubit.dart';
import 'package:rekmed/model/rekmed/rekmed.dart';
import 'package:rekmed/repository/patient/patient_repository.dart';
import 'package:rekmed/view/screens/rekmed/RekMedPage.dart';

class RekmedBox extends StatelessWidget {
  final Rekmed rekmed;
  final bool isVersion;
  final String? overrideID;

  const RekmedBox({
    super.key,
    required this.rekmed,
    required this.isVersion,
    this.overrideID
  });

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => PatientRepository(),
      child: BlocProvider(
        create: (context) => PatientCubit(context.read<PatientRepository>())
          ..loadPatient(rekmed.patientID),
        child: BlocBuilder<PatientCubit, PatientState>(
          builder: (context, state) {
            return state.maybeWhen(orElse: () {
              return const SizedBox();
            }, loaded: (patient) {
              return InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return RekmedPage(
                      rekmed: rekmed,
                      patient: patient,
                      overrideID: overrideID,
                    );
                  }));
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 16.0),
                  padding: const EdgeInsets.all(16.0),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                        Text(
                          rekmed.id!,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16.0),
                        ),
                        Text(
                          '${rekmed.date.day}/${rekmed.date.month}/${rekmed.date.year}',
                          style: const TextStyle(fontSize: 12.0),
                        ),
                      ]),
                      const SizedBox(height: 8.0),
                      Text(
                        'Nama Pasien : ${rekmed.name}',
                        style: const TextStyle(fontSize: 12.0),
                      ),
                      const SizedBox(height: 4.0),
                      Text(
                        'Dokter : ${rekmed.petugasMedis}',
                        style: const TextStyle(fontSize: 12.0),
                      ),
                      const SizedBox(height: 4.0),
                    ],
                  ),
                ),
              );
            });
          },
        ),
      ),
    );
  }
}
