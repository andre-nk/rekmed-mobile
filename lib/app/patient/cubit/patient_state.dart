part of 'patient_cubit.dart';

@freezed
class PatientState with _$PatientState {
  const factory PatientState.initial() = _Initial;
  const factory PatientState.loading() = _Loading;
  const factory PatientState.queryLoaded(Query patientQuery) = _QueryLoaded;
  const factory PatientState.listLoaded(List<Patient> patients) = _ListLoaded;
  const factory PatientState.loaded(Patient patient) = _Loaded;
  const factory PatientState.error(String message) = _Error;
  const factory PatientState.success(String message) = _Success;
}
