// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rekmed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RekmedImpl _$$RekmedImplFromJson(Map<String, dynamic> json) => _$RekmedImpl(
      id: json['id'] as String?,
      clinicID: json['clinicID'] as String,
      birthday: DateTime.parse(json['birthday'] as String),
      address: json['address'] as String,
      famFolder: json['famFolder'] as String,
      name: json['name'] as String,
      jenisPasien: json['jenisPasien'] as String,
      unit: json['unit'] as String,
      noJaminan: json['noJaminan'] as String,
      providerBPJS: json['providerBPJS'] as String,
      kunjungan: json['kunjungan'] as String,
      petugasMedis: json['petugasMedis'] as String,
      tinggiBadan: (json['tinggiBadan'] as num).toInt(),
      beratBadan: (json['beratBadan'] as num).toInt(),
      suhuTubuh: (json['suhuTubuh'] as num).toInt(),
      tekananDarah: (json['tekananDarah'] as num).toInt(),
      diagnosis1: json['diagnosis1'] as String,
      kodeDiagnosis1: json['kodeDiagnosis1'] as String,
      blkk1: json['blkk1'] as String,
      diagnosis2: json['diagnosis2'] as String,
      kodeDiagnosis2: json['kodeDiagnosis2'] as String,
      blkk2: json['blkk2'] as String,
      obat: json['obat'] as String,
      kodeObat: json['kodeObat'] as String,
      dosis: (json['dosis'] as num).toInt(),
      jumlah: (json['jumlah'] as num).toInt(),
      alergi: json['alergi'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      date: DateTime.parse(json['date'] as String),
      tindakLanjut: json['tindakLanjut'] as String,
      patientID: json['patientID'] as String,
    );

Map<String, dynamic> _$$RekmedImplToJson(_$RekmedImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'clinicID': instance.clinicID,
      'birthday': instance.birthday.toIso8601String(),
      'address': instance.address,
      'famFolder': instance.famFolder,
      'name': instance.name,
      'jenisPasien': instance.jenisPasien,
      'unit': instance.unit,
      'noJaminan': instance.noJaminan,
      'providerBPJS': instance.providerBPJS,
      'kunjungan': instance.kunjungan,
      'petugasMedis': instance.petugasMedis,
      'tinggiBadan': instance.tinggiBadan,
      'beratBadan': instance.beratBadan,
      'suhuTubuh': instance.suhuTubuh,
      'tekananDarah': instance.tekananDarah,
      'diagnosis1': instance.diagnosis1,
      'kodeDiagnosis1': instance.kodeDiagnosis1,
      'blkk1': instance.blkk1,
      'diagnosis2': instance.diagnosis2,
      'kodeDiagnosis2': instance.kodeDiagnosis2,
      'blkk2': instance.blkk2,
      'obat': instance.obat,
      'kodeObat': instance.kodeObat,
      'dosis': instance.dosis,
      'jumlah': instance.jumlah,
      'alergi': instance.alergi,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'date': instance.date.toIso8601String(),
      'tindakLanjut': instance.tindakLanjut,
      'patientID': instance.patientID,
    };
