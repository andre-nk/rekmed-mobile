import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rekmed/model/patient/patient.dart';
import 'package:rekmed/repository/patient/patient_repository.dart';

part 'patient_state.dart';
part 'patient_cubit.freezed.dart';

class PatientCubit extends Cubit<PatientState> {
  final PatientRepository patientRepository;
  PatientCubit(this.patientRepository) : super(const PatientState.initial());

  Future<void> addPatient(Patient patient) async {
    emit(const PatientState.loading());
    await patientRepository.addPatient(patient);
    emit(const PatientState.success('Patient added'));
  }

  Future<void> updatePatient(Patient patient) async {
    emit(const PatientState.loading());
    await patientRepository.updatePatient(patient);
    emit(const PatientState.success('Patient updated'));
  }

  Future<void> loadPatient(String id) async {
    emit(const PatientState.loading());
    final patient = await patientRepository.getPatientById(id);
    emit(PatientState.loaded(patient));
  }

  Future<void> loadQuery(String clinicID) async {
    emit(const PatientState.loading());
    final query = FirebaseFirestore.instance
        .collection('patients')
        .where('clinicID', isEqualTo: clinicID)
        .orderBy(
          'name',
          descending: false,
        );
    emit(PatientState.queryLoaded(query));
  }

  Future<void> loadPatients() async {
    emit(const PatientState.loading());
    final patients = await patientRepository.getPatients();
    emit(PatientState.listLoaded(patients));
  }
}
