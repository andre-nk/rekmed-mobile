import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rekmed/model/doctor/doctor.dart';
import 'package:rekmed/repository/doctor/doctor_repository.dart';

part 'doctor_state.dart';
part 'doctor_cubit.freezed.dart';

class DoctorCubit extends Cubit<DoctorState> {
  final DoctorRepository doctorRepository;
  DoctorCubit(this.doctorRepository) : super(const DoctorState.initial());

  Future<void> loadQuery(String clinicID) async {
    try {
      emit(const DoctorState.loading());
      final query = FirebaseFirestore.instance
          .collection('doctors')
          .where('clinicID', isEqualTo: clinicID)
          .orderBy(
            'name',
            descending: false,
          );
      emit(DoctorState.queryLoaded(query));
    } catch (e) {
      emit(DoctorState.error(e.toString()));
    }
  }

  Future<void> loadDoctors() async {
    try {
      emit(const DoctorState.loading());
      final doctors = await doctorRepository.getDoctors();
      emit(DoctorState.listLoaded(doctors));
    } catch (e) {
      emit(DoctorState.error(e.toString()));
    }
  }

  Future<void> uploadDoctorProfilePicture(File profilePicture, String doctorID) async {
    try {
      emit(const DoctorState.loading());
      final downloadURL =
          await doctorRepository.uploadDoctorProfilePicture(profilePicture, doctorID);
      emit(DoctorState.profilePictureUploaded(downloadURL));
    } catch (e) {
      emit(DoctorState.error(e.toString()));
    }
  }

  Future<void> addDoctor(Doctor doctor) async {
    try {
      emit(const DoctorState.loading());
      await doctorRepository.addDoctor(doctor);
      emit(const DoctorState.success('Doctor added'));
    } catch (e) {
      emit(DoctorState.error(e.toString()));
    }
  }

  Future<void> updateDoctor(Doctor doctor) async {
    try {
      emit(const DoctorState.loading());
      await doctorRepository.updateDoctor(doctor);
      emit(const DoctorState.success('Doctor updated'));
    } catch (e) {
      emit(DoctorState.error(e.toString()));
    }
  }

  Future<void> loadDoctor(String id) async {
    try {
      emit(const DoctorState.loading());
      final doctor = await doctorRepository.getDoctorById(id);
      emit(DoctorState.loaded(doctor));
    } catch (e) {
      emit(DoctorState.error(e.toString()));
    }
  }
}
