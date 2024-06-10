part of 'beerpedia_cubit.dart';

@freezed
class BeerpediaState with _$BeerpediaState {
  const factory BeerpediaState({
    BeerpediaModel? beerpediaModel,
    BeerpediaStatus? beerpediaStatus,
    String? errorMessage,
  }) = _BeerpediaState;

  factory BeerpediaState.fromJson(Map<String, dynamic> json) =>
      _$BeerpediaStateFromJson(json);
}
