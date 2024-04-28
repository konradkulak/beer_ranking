import 'package:beer_ranking/app/core/enums.dart';
import 'package:beer_ranking/domain/models/auth_model.dart';
import 'package:beer_ranking/domain/repositories/auth_repository.dart';
import 'package:bloc/bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._authRepository) : super(AuthState());

  final AuthRepository _authRepository;

  Future<void> signIn(String email, String password) async {
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
}
