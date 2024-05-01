import 'package:beer_ranking/app/core/enums.dart';
import 'package:beer_ranking/domain/models/auth_model.dart';
import 'package:beer_ranking/domain/repositories/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:email_validator/email_validator.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._authRepository) : super(AuthState());

  final AuthRepository _authRepository;

  Future<void> signIn(String email, String password) async {
    if (!EmailValidator.validate(email)) {
      emit(
        AuthState(
            authStatus: AuthStatus.error, errorMessage: 'Invalid email format'),
      );
      return;
    }
    if (password.length < 6) {
      emit(
        AuthState(
            authStatus: AuthStatus.error,
            errorMessage: 'Password must be at least 6 characters'),
      );
      return;
    }
    emit(
      AuthState(
        authStatus: AuthStatus.loading,
      ),
    );
    try {
      AuthModel authModel =
          await _authRepository.signInWithEmailAndPassword(email, password);
      emit(
        AuthState(
          authStatus: AuthStatus.success,
          authModel: authModel,
        ),
      );
    } catch (error) {
      emit(
        AuthState(
          authStatus: AuthStatus.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }

  Future<void> register(String email, String password) async {
    if (!EmailValidator.validate(email)) {
      emit(
        AuthState(
            authStatus: AuthStatus.error, errorMessage: 'Invalid email format'),
      );
      return;
    }
    if (password.length < 6) {
      emit(
        AuthState(
            authStatus: AuthStatus.error,
            errorMessage: 'Password must be at least 6 characters'),
      );
      return;
    }
    emit(
      AuthState(
        authStatus: AuthStatus.loading,
      ),
    );
    try {
      AuthModel authModel =
          await _authRepository.registerWithEmailAndPassword(email, password);
      emit(
        AuthState(
          authStatus: AuthStatus.success,
          authModel: authModel,
        ),
      );
    } catch (error) {
      emit(
        AuthState(
          authStatus: AuthStatus.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }
}
