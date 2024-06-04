import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:rekmed/model/doctor/doctor.dart';

class DoctorRepository {
  final FirebaseFirestore _firebaseFirestore;
  final FirebaseStorage _firebaseStorage;

  DoctorRepository()
      : _firebaseFirestore = FirebaseFirestore.instance,
        _firebaseStorage = FirebaseStorage.instance;

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

  Future<String> uploadDoctorProfilePicture(File file, String doctorID) async {
    try {
      final storageRef = _firebaseStorage.ref();
      final fileRef = storageRef.child('doctors/$doctorID/profile_picture.jpg');

      await fileRef.putFile(file);
      return await fileRef.getDownloadURL();
    } on FirebaseException catch (e) {
      throw Exception(e);
    }
  }

  Future<void> addDoctor(Doctor doctor) async {
    try {
      await _firebaseFirestore.collection('doctors').doc(doctor.id).set(doctor.toJson());
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
