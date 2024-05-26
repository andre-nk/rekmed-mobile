import 'package:freezed_annotation/freezed_annotation.dart';

part 'clinic.freezed.dart';

part 'clinic.g.dart';

@freezed
abstract class Clinic with _$Clinic {
  const Clinic._(); // Added constructor

  const factory Clinic(
      {required String uid,
      required String name,
      required String username,
      required String email,
      required int phone,
      required String address,
      required String bpjs,
      required String satuSehat}) = _Clinic;

  factory Clinic.fromJson(Map<String, dynamic> json) => _$ClinicFromJson(json);
}
