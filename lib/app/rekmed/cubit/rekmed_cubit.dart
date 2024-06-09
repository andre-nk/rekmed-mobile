import 'dart:async';

import 'package:async/async.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rekmed/model/rekmed/rekmed.dart';
import 'package:rekmed/repository/rekmed/rekmed_repository.dart';

part 'rekmed_state.dart';
part 'rekmed_cubit.freezed.dart';

class RekmedCubit extends Cubit<RekmedState> {
  final RekmedRepository rekmedRepository;

  RekmedCubit(this.rekmedRepository) : super(const RekmedState.initial());

  Future<void> getRekmedQueryByUserID(String userID) async {
    emit(const RekmedState.loading());
    try {
      final query = FirebaseFirestore.instance
          .collection('rekmeds')
          .where('patientID', isEqualTo: userID);

      emit(RekmedState.queryLoaded(query));
    } catch (e) {
      emit(RekmedState.error(e.toString()));
    }
  }

  Future<void> getRekmedQueryByClinicIDAndDateRange(
      String clinicID, DateTime startDate, DateTime endDate) async {
    emit(const RekmedState.loading());
    try {
      final query = FirebaseFirestore.instance
          .collection('rekmeds')
          .where('clinicID', isEqualTo: clinicID);

      emit(RekmedState.queryLoaded(query));
    } catch (e) {
      emit(RekmedState.error(e.toString()));
    }
  }

  Future<void> getRekmedVersionQuery(String rekmedID) async {
    emit(const RekmedState.loading());
    try {
      final query = FirebaseFirestore.instance
          .collection('rekmeds')
          .doc(rekmedID)
          .collection('versions')
          .orderBy(
            'updatedAt',
            descending: true,
          );
      emit(RekmedState.queryLoaded(query));
    } catch (e) {
      emit(RekmedState.error(e.toString()));
    }
  }

  Future<void> getRekmedCountByClinic(String clinicID) async {
    emit(const RekmedState.loading());
    try {
      final rekmedCount =
          await rekmedRepository.getRekmedCountByClinicID(clinicID, DateTime.now());
      emit(RekmedState.countLoaded(rekmedCount));
    } catch (e) {
      emit(RekmedState.error(e.toString()));
    }
  }

  Future<void> addRekmed(Rekmed rekmed) async {
    emit(const RekmedState.loading());
    try {
      var cancellableOperation = CancelableOperation.fromFuture(
        Future.delayed(const Duration(seconds: 5), () {
          emit(const RekmedState.success());
        }),
      );

      await rekmedRepository.addRekmed(rekmed);
      cancellableOperation.cancel();
      emit(const RekmedState.success());
    } catch (e) {
      emit(RekmedState.error(e.toString()));
    }
  }

  Future<void> updateRekmed(Rekmed rekmed, bool isOffline, {String? overrideID}) async {
    emit(const RekmedState.loading());
    try {
      var cancellableOperation = CancelableOperation.fromFuture(
        Future.delayed(const Duration(seconds: 5), () {
          emit(const RekmedState.success());
        }),
      );

      if (overrideID != null) {
        await rekmedRepository.overrideUpdateRekmed(rekmed, overrideID);
      } else {
        await rekmedRepository.updateRekmed(rekmed, isOffline);
      }

      cancellableOperation.cancel();
      emit(const RekmedState.success());
    } catch (e) {
      emit(RekmedState.error(e.toString()));
    }
  }
}
