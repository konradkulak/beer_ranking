part of 'auth_cubit.dart';

class AuthState {
  AuthState({
    this.authStatus,
    this.authModel,
    this.errorMessage,
  });
  final AuthStatus? authStatus;
  final AuthModel? authModel;
  final String? errorMessage;
}
