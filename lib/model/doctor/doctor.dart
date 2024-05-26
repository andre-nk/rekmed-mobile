import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rekmed/utlis/poli.dart';

part 'doctor.freezed.dart';

part 'doctor.g.dart';

@freezed
abstract class Doctor with _$Doctor {
  const factory Doctor(
      {required String id,
      required String name,
      required int phone,
      required int nik,
      required int str,
      required Poli poli}) = _Doctor;

  factory Doctor.fromJson(Map<String, dynamic> json) => _$DoctorFromJson(json);
}
