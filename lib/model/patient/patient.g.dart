// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PatientImpl _$$PatientImplFromJson(Map<String, dynamic> json) =>
    _$PatientImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      date: DateTime.parse(json['date'] as String),
      address: json['address'] as String,
      poli: $enumDecode(_$PoliEnumMap, json['poli']),
      rekmed:
          (json['rekmed'] as List<dynamic>).map((e) => e as String).toList(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$PatientImplToJson(_$PatientImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'date': instance.date.toIso8601String(),
      'address': instance.address,
      'poli': _$PoliEnumMap[instance.poli]!,
      'rekmed': instance.rekmed,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

const _$PoliEnumMap = {
  Poli.umum: 'umum',
  Poli.gigi: 'gigi',
  Poli.kandungan: 'kandungan',
  Poli.mata: 'mata',
  Poli.jantung: 'jantung',
  Poli.anak: 'anak',
  Poli.syaraf: 'syaraf',
  Poli.bedah: 'bedah',
  Poli.kulit: 'kulit',
  Poli.tht: 'tht',
  Poli.paru: 'paru',
  Poli.saraf: 'saraf',
  Poli.tulang: 'tulang',
  Poli.jiwa: 'jiwa',
  Poli.ginjal: 'ginjal',
  Poli.lambung: 'lambung',
  Poli.hati: 'hati',
  Poli.penyakitDalam: 'penyakitDalam',
  Poli.endokrin: 'endokrin',
};
