import 'package:async/async.dart';
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
    var cancellableOperation = CancelableOperation.fromFuture(
      Future.delayed(const Duration(seconds: 5), () {
        emit(const PatientState.success("Patient added (offline)"));
      }),
    );

    await patientRepository.addPatient(patient);
    cancellableOperation.cancel();
    emit(const PatientState.success('Patient added'));
  }

  Future<void> updatePatient(Patient patient) async {
    emit(const PatientState.loading());
    var cancellableOperation = CancelableOperation.fromFuture(
      Future.delayed(const Duration(seconds: 5), () {
        emit(const PatientState.success("Patient added (offline)"));
      }),
    );

    await patientRepository.updatePatient(patient);
    cancellableOperation.cancel();
    emit(const PatientState.success('Patient updated'));
  }

  Future<void> loadPatient(String id) async {
    emit(const PatientState.loading());
    final patient = await patientRepository.getPatientById(id);
    emit(PatientState.loaded(patient));
  }

  Future<void> loadSearchQuery(String clinicID, String query) async {
    try {
      emit(const PatientState.loading());
      final searchQuery = FirebaseFirestore.instance
          .collection('patients')
          .where('clinicID', isEqualTo: clinicID)
          .where('name', isGreaterThanOrEqualTo: query)
          .where('name', isLessThan: '${query}z')
          .orderBy(
            'name',
            descending: false,
          );
      emit(PatientState.queryLoaded(searchQuery));
    } catch (e) {
      emit(PatientState.error(e.toString()));
    }
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
