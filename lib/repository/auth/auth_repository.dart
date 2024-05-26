import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rekmed/model/clinic/clinic.dart';

class AuthRepository {
  final FirebaseFirestore _firebaseFirestore;
  final FirebaseAuth _firebaseAuth;

  AuthRepository()
      : _firebaseFirestore = FirebaseFirestore.instance,
        _firebaseAuth = FirebaseAuth.instance;

  Future<Clinic> signUpWithEmailAndPassword(
      {required String email,
      required String password,
      required String name,
      required String address,
      required String bpjs,
      required String satuSehat,
      required int phone}) async {
    try {
      final UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      final User user = userCredential.user!;
      await _firebaseAuth.currentUser?.updateDisplayName(name);

      final clinic = Clinic(
          uid: user.uid,
          email: email,
          name: name,
          username: name,
          address: address,
          phone: phone,
          bpjs: bpjs,
          satuSehat: satuSehat);

      await _firebaseFirestore.collection('clinics').doc(user.uid).set(clinic.toJson());
      return clinic;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<void> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<Clinic> getCurrentUser() async {
    final User? user = _firebaseAuth.currentUser;
    if (user != null) {
      final DocumentSnapshot documentSnapshot =
          await _firebaseFirestore.collection('clinics').doc(user.uid).get();

      final Clinic clinic = Clinic(
          uid: user.uid,
          email: user.email!,
          name: user.displayName!,
          username: user.displayName!,
          address: documentSnapshot.get('address'),
          phone: documentSnapshot.get('phone'),
          bpjs: documentSnapshot.get('bpjs'),
          satuSehat: documentSnapshot.get('satuSehat'));

      return clinic;
    } else {
      throw Exception('Clinic not found');
    }
  }
}
