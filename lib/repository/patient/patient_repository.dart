import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rekmed/model/patient/patient.dart';

class PatientRepository {
  final FirebaseFirestore _firebaseFirestore;

  PatientRepository() : _firebaseFirestore = FirebaseFirestore.instance;

  Future<List<Patient>> getPatients() async {
    try {
      final patients = await _firebaseFirestore.collection('patients').get();
      return patients.docs.map((e) => Patient.fromJson(e.data())).toList();
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Patient> getPatientById(String id) async {
    try {
      final patient = await _firebaseFirestore.collection('patients').doc(id).get();
      return Patient.fromJson(patient.data()!);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> addPatient(Patient patient) async {
    try {
      await _firebaseFirestore.collection('patients').add(patient.toJson());
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> updatePatient(Patient patient) async {
    try {
      await _firebaseFirestore
          .collection('patients')
          .doc(patient.id)
          .update(patient.toJson());
    } catch (e) {
      throw Exception(e);
    }
  }
}
