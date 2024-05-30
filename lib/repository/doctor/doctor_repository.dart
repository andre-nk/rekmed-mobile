import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rekmed/model/doctor/doctor.dart';

class DoctorRepository {
  final FirebaseFirestore _firebaseFirestore;

  DoctorRepository() : _firebaseFirestore = FirebaseFirestore.instance;

  Future<List<Doctor>> getDoctors() async {
    try {
      final doctors = await _firebaseFirestore.collection('doctors').get();
      return doctors.docs.map((e) => Doctor.fromJson(e.data())).toList();
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Doctor> getDoctorById(String id) async {
    try {
      final doctor = await _firebaseFirestore.collection('doctors').doc(id).get();
      return Doctor.fromJson(doctor.data()!);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> addDoctor(Doctor doctor) async {
    try {
      await _firebaseFirestore.collection('doctors').add(doctor.toJson());
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> updateDoctor(Doctor doctor) async {
    try {
      await _firebaseFirestore
          .collection('doctors')
          .doc(doctor.id)
          .update(doctor.toJson());
    } catch (e) {
      throw Exception(e);
    }
  }
}
