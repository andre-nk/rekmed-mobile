// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rekmed.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Rekmed _$RekmedFromJson(Map<String, dynamic> json) {
  return _Rekmed.fromJson(json);
}

/// @nodoc
mixin _$Rekmed {
  @HiveField(1)
  String? get id => throw _privateConstructorUsedError;
  @HiveField(2)
  String get clinicID => throw _privateConstructorUsedError;
  @HiveField(3)
  String get name => throw _privateConstructorUsedError;
  @HiveField(4)
  int get phone => throw _privateConstructorUsedError;
  @HiveField(5)
  int get nik => throw _privateConstructorUsedError;
  @HiveField(6)
  int get str => throw _privateConstructorUsedError;
  @HiveField(7)
  Poli get poli => throw _privateConstructorUsedError;
  @HiveField(8)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @HiveField(9)
  DateTime get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RekmedCopyWith<Rekmed> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RekmedCopyWith<$Res> {
  factory $RekmedCopyWith(Rekmed value, $Res Function(Rekmed) then) =
      _$RekmedCopyWithImpl<$Res, Rekmed>;
  @useResult
  $Res call(
      {@HiveField(1) String? id,
      @HiveField(2) String clinicID,
      @HiveField(3) String name,
      @HiveField(4) int phone,
      @HiveField(5) int nik,
      @HiveField(6) int str,
      @HiveField(7) Poli poli,
      @HiveField(8) DateTime createdAt,
      @HiveField(9) DateTime updatedAt});
}

/// @nodoc
class _$RekmedCopyWithImpl<$Res, $Val extends Rekmed>
    implements $RekmedCopyWith<$Res> {
  _$RekmedCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? clinicID = null,
    Object? name = null,
    Object? phone = null,
    Object? nik = null,
    Object? str = null,
    Object? poli = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      clinicID: null == clinicID
          ? _value.clinicID
          : clinicID // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as int,
      nik: null == nik
          ? _value.nik
          : nik // ignore: cast_nullable_to_non_nullable
              as int,
      str: null == str
          ? _value.str
          : str // ignore: cast_nullable_to_non_nullable
              as int,
      poli: null == poli
          ? _value.poli
          : poli // ignore: cast_nullable_to_non_nullable
              as Poli,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RekmedImplCopyWith<$Res> implements $RekmedCopyWith<$Res> {
  factory _$$RekmedImplCopyWith(
          _$RekmedImpl value, $Res Function(_$RekmedImpl) then) =
      __$$RekmedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(1) String? id,
      @HiveField(2) String clinicID,
      @HiveField(3) String name,
      @HiveField(4) int phone,
      @HiveField(5) int nik,
      @HiveField(6) int str,
      @HiveField(7) Poli poli,
      @HiveField(8) DateTime createdAt,
      @HiveField(9) DateTime updatedAt});
}

/// @nodoc
class __$$RekmedImplCopyWithImpl<$Res>
    extends _$RekmedCopyWithImpl<$Res, _$RekmedImpl>
    implements _$$RekmedImplCopyWith<$Res> {
  __$$RekmedImplCopyWithImpl(
      _$RekmedImpl _value, $Res Function(_$RekmedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? clinicID = null,
    Object? name = null,
    Object? phone = null,
    Object? nik = null,
    Object? str = null,
    Object? poli = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$RekmedImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      clinicID: null == clinicID
          ? _value.clinicID
          : clinicID // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as int,
      nik: null == nik
          ? _value.nik
          : nik // ignore: cast_nullable_to_non_nullable
              as int,
      str: null == str
          ? _value.str
          : str // ignore: cast_nullable_to_non_nullable
              as int,
      poli: null == poli
          ? _value.poli
          : poli // ignore: cast_nullable_to_non_nullable
              as Poli,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 1, adapterName: 'RekmedAdapter')
class _$RekmedImpl implements _Rekmed {
  const _$RekmedImpl(
      {@HiveField(1) this.id,
      @HiveField(2) required this.clinicID,
      @HiveField(3) required this.name,
      @HiveField(4) required this.phone,
      @HiveField(5) required this.nik,
      @HiveField(6) required this.str,
      @HiveField(7) required this.poli,
      @HiveField(8) required this.createdAt,
      @HiveField(9) required this.updatedAt});

  factory _$RekmedImpl.fromJson(Map<String, dynamic> json) =>
      _$$RekmedImplFromJson(json);

  @override
  @HiveField(1)
  final String? id;
  @override
  @HiveField(2)
  final String clinicID;
  @override
  @HiveField(3)
  final String name;
  @override
  @HiveField(4)
  final int phone;
  @override
  @HiveField(5)
  final int nik;
  @override
  @HiveField(6)
  final int str;
  @override
  @HiveField(7)
  final Poli poli;
  @override
  @HiveField(8)
  final DateTime createdAt;
  @override
  @HiveField(9)
  final DateTime updatedAt;

  @override
  String toString() {
    return 'Rekmed(id: $id, clinicID: $clinicID, name: $name, phone: $phone, nik: $nik, str: $str, poli: $poli, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RekmedImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.clinicID, clinicID) ||
                other.clinicID == clinicID) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.nik, nik) || other.nik == nik) &&
            (identical(other.str, str) || other.str == str) &&
            (identical(other.poli, poli) || other.poli == poli) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, clinicID, name, phone, nik,
      str, poli, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RekmedImplCopyWith<_$RekmedImpl> get copyWith =>
      __$$RekmedImplCopyWithImpl<_$RekmedImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RekmedImplToJson(
      this,
    );
  }
}

abstract class _Rekmed implements Rekmed {
  const factory _Rekmed(
      {@HiveField(1) final String? id,
      @HiveField(2) required final String clinicID,
      @HiveField(3) required final String name,
      @HiveField(4) required final int phone,
      @HiveField(5) required final int nik,
      @HiveField(6) required final int str,
      @HiveField(7) required final Poli poli,
      @HiveField(8) required final DateTime createdAt,
      @HiveField(9) required final DateTime updatedAt}) = _$RekmedImpl;

  factory _Rekmed.fromJson(Map<String, dynamic> json) = _$RekmedImpl.fromJson;

  @override
  @HiveField(1)
  String? get id;
  @override
  @HiveField(2)
  String get clinicID;
  @override
  @HiveField(3)
  String get name;
  @override
  @HiveField(4)
  int get phone;
  @override
  @HiveField(5)
  int get nik;
  @override
  @HiveField(6)
  int get str;
  @override
  @HiveField(7)
  Poli get poli;
  @override
  @HiveField(8)
  DateTime get createdAt;
  @override
  @HiveField(9)
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$RekmedImplCopyWith<_$RekmedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
