import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rekmed/utlis/poli.dart';

part 'patient.freezed.dart';

part 'patient.g.dart';

@freezed
abstract class Patient with _$Patient {
  const factory Patient({
    required String id,
    required String name,
    required DateTime date,
    required String address,
    required Poli poli,
    required List<String> rekmed,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Patient;

  factory Patient.fromJson(Map<String, dynamic> json) => _$PatientFromJson(json);
}
