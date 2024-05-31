import 'package:firebase_auth/firebase_auth.dart';
import 'package:rekmed/model/clinic/clinic.dart';
import 'package:rekmed/repository/clinic/clinic_repository.dart';

class AuthRepository {
  final FirebaseAuth _firebaseAuth;
  final ClinicRepository _clinicRepository;

  AuthRepository()
      : _firebaseAuth = FirebaseAuth.instance,
        _clinicRepository = ClinicRepository();

  Future<Clinic> signUpWithEmailAndPassword(
      {required String email,
      required String password,
      required String name,
      required String address,
      required String bpjs,
      required String satuSehat,
      required String phone}) async {
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
        satuSehat: satuSehat,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      await _clinicRepository.addClinic(clinic);
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

  Future<void> resetPassword({required String email}) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
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
      return await _clinicRepository.getClinicById(user);
    } else {
      throw Exception("User's logged out");
    }
  }
}
