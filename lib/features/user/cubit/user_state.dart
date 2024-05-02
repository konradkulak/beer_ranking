part of 'user_cubit.dart';

class UserState {
  UserState({
    this.userStatus = UserStatus.initial,
    this.errorMessage,
  });

  final UserStatus userStatus;
  final String? errorMessage;
}
