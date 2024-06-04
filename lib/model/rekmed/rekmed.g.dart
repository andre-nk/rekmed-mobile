// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rekmed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RekmedImpl _$$RekmedImplFromJson(Map<String, dynamic> json) => _$RekmedImpl(
      id: json['id'] as String?,
      clinicID: json['clinicID'] as String,
      name: json['name'] as String,
      phone: (json['phone'] as num).toInt(),
      nik: (json['nik'] as num).toInt(),
      str: (json['str'] as num).toInt(),
      poli: $enumDecode(_$PoliEnumMap, json['poli']),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$RekmedImplToJson(_$RekmedImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'clinicID': instance.clinicID,
      'name': instance.name,
      'phone': instance.phone,
      'nik': instance.nik,
      'str': instance.str,
      'poli': _$PoliEnumMap[instance.poli]!,
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
