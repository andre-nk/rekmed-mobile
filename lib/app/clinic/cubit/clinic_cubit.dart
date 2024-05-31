import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rekmed/model/clinic/clinic.dart';
import 'package:rekmed/repository/clinic/clinic_repository.dart';

part 'clinic_state.dart';
part 'clinic_cubit.freezed.dart';

class ClinicCubit extends Cubit<ClinicState> {
  final ClinicRepository clinicRepository;
  ClinicCubit(this.clinicRepository) : super(const ClinicState.initial());

  Future<void> loadClinic(User user, String clinicID) async {
    emit(const ClinicState.loading());
    Clinic clinic = await clinicRepository.getClinicById(user);
    emit(ClinicState.loaded(clinic));
  }

  Future<void> updateClinic(Clinic clinic) async {
    emit(const ClinicState.loading());
    await clinicRepository.updateClinic(clinic);
    emit(ClinicState.loaded(clinic));
  }
}
