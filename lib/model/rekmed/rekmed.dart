import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rekmed/utlis/poli.dart';

part 'rekmed.freezed.dart';

part 'rekmed.g.dart';

@freezed
abstract class Rekmed with _$Rekmed {
  const factory Rekmed(
      {required String id,
      required String name,
      required int phone,
      required int nik,
      required int str,
      required Poli poli}) = _Rekmed;

  factory Rekmed.fromJson(Map<String, dynamic> json) => _$RekmedFromJson(json);
}
