part of 'add_cubit.dart';

@freezed
class AddState with _$AddState {
  const factory AddState({
    BeerModel? beer,
    @Default(AddStatus.initial) AddStatus addStatus,
    String? errorMessage,
  }) = _AddState;

  factory AddState.fromJson(Map<String, dynamic> json) =>
      _$AddStateFromJson(json);
}
