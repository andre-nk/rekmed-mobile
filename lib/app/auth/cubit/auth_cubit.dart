import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rekmed/model/clinic/clinic.dart';
import 'package:rekmed/repository/auth/auth_repository.dart';
import 'package:rekmed/repository/clinic/clinic_repository.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository authRepository;
  final ClinicRepository clinicRepository;
  AuthCubit(this.authRepository, this.clinicRepository)
      : super(const AuthState.initial());

  void loading() {
    emit(const AuthState.loading());
  }

  void error(String message) {
    emit(AuthState.error(message));
  }

  Future<void> initialize() async {
    emit(const AuthState.initial());

    try {
      emit(const AuthState.loading());
      final Clinic clinic = await authRepository.getCurrentUser();
      emit(AuthState.authenticated(clinic));
    } on Exception catch (e) {
      emit(AuthState.error(e.toString()));
    }
  }

  Future<void> signUpWithEmailAndPassword(
      {required String email,
      required String password,
      required String name,
      required String address,
      required String bpjs,
      required String satuSehat,
      required String phone}) async {
    try {
      emit(const AuthState.loading());
      final Clinic clinic = await authRepository.signUpWithEmailAndPassword(
        email: email,
        password: password,
        name: name,
        address: address,
        bpjs: bpjs,
        satuSehat: satuSehat,
        phone: phone,
      );
      emit(AuthState.authenticated(clinic));
    } on Exception catch (e) {
      emit(AuthState.error(e.toString()));
    }
  }

  Future<void> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      emit(const AuthState.loading());
      await authRepository.signInWithEmailAndPassword(email: email, password: password);
      final Clinic clinic = await authRepository.getCurrentUser();
      emit(AuthState.authenticated(clinic));
    } on Exception catch (e) {
      emit(AuthState.error(e.toString()));
    }
  }

  Future<void> signOut() async {
    try {
      emit(const AuthState.loading());
      await authRepository.signOut();
      emit(const AuthState.unauthenticated());
    } on Exception catch (e) {
      emit(AuthState.error(e.toString()));
    }
  }

  Future<void> resetPassword(String email) async {
    try {
      emit(const AuthState.loading());
      await authRepository.resetPassword(email: email);
      emit(const AuthState.error("Reset password link has been sent to your email"));
    } on Exception catch (e) {
      emit(AuthState.error(e.toString()));
    }
  }
}
