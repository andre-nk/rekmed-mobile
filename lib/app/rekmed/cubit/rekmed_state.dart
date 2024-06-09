part of 'rekmed_cubit.dart';

@freezed
class RekmedState with _$RekmedState {
  const factory RekmedState.initial() = _Initial;
  const factory RekmedState.loading() = _Loading;
  const factory RekmedState.loaded(Rekmed rekmed) = _Loaded;
  const factory RekmedState.countLoaded(int count) = _CountLoaded;
  const factory RekmedState.queryLoaded(Query rekmedQuery) = _QueryLoaded;
  const factory RekmedState.error(String message) = _Error;
  const factory RekmedState.success() = _Success;
}
