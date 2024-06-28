import 'package:beer_ranking/app/core/enums.dart';
import 'package:beer_ranking/domain/models/auth_model.dart';
import 'package:beer_ranking/domain/repositories/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:email_validator/email_validator.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.dart';
part 'auth_cubit.g.dart';
part 'auth_cubit.freezed.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._authRepository) : super(const AuthState());

  final AuthRepository _authRepository;

  Future<void> signIn(String email, String password) async {
    if (!EmailValidator.validate(email)) {
      emit(
        const AuthState(
          authStatus: AuthStatus.error,
          errorMessage: 'Invalid email format',
        ),
      );
      return;
    }
    if (password.length < 6) {
      emit(
        const AuthState(
            authStatus: AuthStatus.error,
            errorMessage: 'Password must be at least 6 characters'),
      );
      return;
    }
    emit(
      const AuthState(
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
        const AuthState(
            authStatus: AuthStatus.error, errorMessage: 'Invalid email format'),
      );
      return;
    }
    if (password.length < 6) {
      emit(
        const AuthState(
            authStatus: AuthStatus.error,
            errorMessage: 'Password must be at least 6 characters'),
      );
      return;
    }
    emit(
      const AuthState(
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
