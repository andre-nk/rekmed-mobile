import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rekmed/model/clinic/clinic.dart';

class ClinicRepository {
  final FirebaseFirestore _firebaseFirestore;

  ClinicRepository() : _firebaseFirestore = FirebaseFirestore.instance;

  Future<Clinic> getClinicById(User user, String uid) async {
    try {
      final documentSnapshot =
          await _firebaseFirestore.collection('clinics').doc(uid).get();

      final Clinic clinic = Clinic(
        uid: user.uid,
        email: user.email!,
        name: user.displayName!,
        username: user.displayName!,
        address: documentSnapshot.get('address'),
        phone: documentSnapshot.get('phone'),
        bpjs: documentSnapshot.get('bpjs'),
        satuSehat: documentSnapshot.get('satuSehat'),
        createdAt: documentSnapshot.get('createdAt').toDate(),
        updatedAt: documentSnapshot.get('updatedAt').toDate(),
      );

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
