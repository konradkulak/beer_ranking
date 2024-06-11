part of 'user_cubit.dart';

@freezed
class UserState with _$UserState {
  const factory UserState({
    required UserStatus userStatus,
    String? errorMessage,
  }) = _UserState;

  factory UserState.fromJson(Map<String, dynamic> json) =>
      _$UserStateFromJson(json);
}
