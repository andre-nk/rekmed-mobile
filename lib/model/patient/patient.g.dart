// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PatientImpl _$$PatientImplFromJson(Map<String, dynamic> json) =>
    _$PatientImpl(
      id: json['id'] as String?,
      clinicID: json['clinicID'] as String,
      name: json['name'] as String,
      date: DateTime.parse(json['date'] as String),
      address: json['address'] as String,
      rekmed:
          (json['rekmed'] as List<dynamic>).map((e) => e as String).toList(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$PatientImplToJson(_$PatientImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'clinicID': instance.clinicID,
      'name': instance.name,
      'date': instance.date.toIso8601String(),
      'address': instance.address,
      'rekmed': instance.rekmed,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
