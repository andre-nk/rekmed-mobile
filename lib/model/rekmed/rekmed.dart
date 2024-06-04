import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:rekmed/utlis/poli.dart';

part 'rekmed.freezed.dart';

part 'rekmed.g.dart';

@freezed
abstract class Rekmed with _$Rekmed {
  @HiveType(typeId: 1, adapterName: 'RekmedAdapter')
  const factory Rekmed({
    @HiveField(1) String? id,
    @HiveField(2) required String clinicID,
    @HiveField(3) required String name,
    @HiveField(4) required int phone,
    @HiveField(5) required int nik,
    @HiveField(6) required int str,
    @HiveField(7) required Poli poli,
    @HiveField(8) required DateTime createdAt,
    @HiveField(9) required DateTime updatedAt,
  }) = _Rekmed;

  factory Rekmed.fromJson(Map<String, dynamic> json) => _$RekmedFromJson(json);
}


