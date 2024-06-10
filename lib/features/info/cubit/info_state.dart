part of 'info_cubit.dart';

@freezed
class InfoState with _$InfoState {
  const factory InfoState({
    BeerModel? beer,
    InfoStatus? infoStatus,
    required ImageStatus imageStatus,
    String? errorMessage,
  }) = _InfoState;

  factory InfoState.fromJson(Map<String, dynamic> json) =>
      _$InfoStateFromJson(json);
}
