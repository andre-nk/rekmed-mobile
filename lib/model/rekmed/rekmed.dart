import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'rekmed.freezed.dart';

part 'rekmed.g.dart';

@freezed
abstract class Rekmed with _$Rekmed {
  @HiveType(typeId: 1, adapterName: 'RekmedAdapter')
  const factory Rekmed({
    @HiveField(1) String? id,
    @HiveField(2) required String clinicID,
    @HiveField(3) required DateTime birthday,
    @HiveField(4) required String address,
    @HiveField(5) required String famFolder,
    @HiveField(6) required String name,
    @HiveField(7) required String jenisPasien,
    @HiveField(8) required String unit,
    @HiveField(9) required String noJaminan,
    @HiveField(10) required String providerBPJS,
    @HiveField(11) required String kunjungan,
    @HiveField(12) required String petugasMedis,
    @HiveField(13) required int tinggiBadan,
    @HiveField(14) required int beratBadan,
    @HiveField(15) required int suhuTubuh,
    @HiveField(16) required int tekananDarah,
    @HiveField(17) required String diagnosis1,
    @HiveField(18) required String kodeDiagnosis1,
    @HiveField(19) required String blkk1,
    @HiveField(20) required String diagnosis2,
    @HiveField(21) required String kodeDiagnosis2,
    @HiveField(22) required String blkk2,
    @HiveField(23) required String obat,
    @HiveField(24) required String kodeObat,
    @HiveField(25) required int dosis,
    @HiveField(26) required int jumlah,
    @HiveField(27) required String alergi,
    @HiveField(28) required DateTime createdAt,
    @HiveField(29) required DateTime updatedAt,
    @HiveField(30) required DateTime date,
    @HiveField(31) required String tindakLanjut,
    @HiveField(32) required String patientID,
  }) = _Rekmed;

  factory Rekmed.fromJson(Map<String, dynamic> json) => _$RekmedFromJson(json);
}
