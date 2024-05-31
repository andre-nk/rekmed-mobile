import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rekmed/model/clinic/clinic.dart';

class ClinicRepository {
  final FirebaseFirestore _firebaseFirestore;

  ClinicRepository() : _firebaseFirestore = FirebaseFirestore.instance;

  Future<Clinic> getClinicById(User user) async {
    try {
      final documentSnapshot = await _firebaseFirestore
          .collection('clinics')
          .where("uid", isEqualTo: user.uid)
          .get();

      Clinic clinic;

      if (documentSnapshot.docs.isNotEmpty) {
        var rawClinic = documentSnapshot.docs.first.data();

        clinic = Clinic(
          uid: user.uid,
          email: user.email!,
          name: user.displayName!,
          username: user.displayName!,
          address: rawClinic['address'],
          phone: rawClinic['phone'],
          bpjs: rawClinic['bpjs'],
          satuSehat: rawClinic['satuSehat'],
          createdAt: DateTime.parse(rawClinic['createdAt']),
          updatedAt: DateTime.parse(rawClinic['updatedAt']),
        );
      } else {
        throw Exception('Clinic not found');
      }

      return clinic;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> addClinic(Clinic clinic) async {
    try {
      await _firebaseFirestore.collection('clinics').add(clinic.toJson());
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> updateClinic(Clinic clinic) async {
    try {
      await _firebaseFirestore.collection('clinics').doc(clinic.uid).update(
            clinic.toJson(),
          );
    } catch (e) {
      throw Exception(e);
    }
  }
}
