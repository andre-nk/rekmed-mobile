part of 'doctor_cubit.dart';

@freezed
class DoctorState with _$DoctorState {
  const factory DoctorState.initial() = _Initial;
  const factory DoctorState.loading() = _Loading;
  const factory DoctorState.queryLoaded(Query patientQuery) = _QueryLoaded;
  const factory DoctorState.listLoaded(List<Doctor> patients) = _ListLoaded;
  const factory DoctorState.loaded(Doctor patient) = _Loaded;
  const factory DoctorState.error(String message) = _Error;
  const factory DoctorState.profilePictureUploaded(String downloadURL) = _ProfilePictureUploaded;
  const factory DoctorState.success(String message) = _Success;
}
