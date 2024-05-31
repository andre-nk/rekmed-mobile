part of 'clinic_cubit.dart';

@freezed
class ClinicState with _$ClinicState {
  const factory ClinicState.initial() = _Initial;
  const factory ClinicState.loading() = _Loading;
  const factory ClinicState.loaded(Clinic clinic) = _Loaded;
}
