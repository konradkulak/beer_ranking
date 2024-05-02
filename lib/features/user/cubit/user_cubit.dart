import 'package:beer_ranking/app/core/enums.dart';
import 'package:beer_ranking/domain/repositories/auth_repository.dart';
import 'package:bloc/bloc.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this._authRepository) : super(UserState());

  final AuthRepository _authRepository;

  Future<void> signOut() async {
    emit(
      UserState(
        userStatus: UserStatus.loading,
      ),
    );
    try {
      await _authRepository.signOut();
      emit(
        UserState(
          userStatus: UserStatus.success,
        ),
      );
    } catch (error) {
      emit(
        UserState(
          userStatus: UserStatus.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }
    Future<void> deleteAccount() async {
    emit(
      UserState(
        userStatus: UserStatus.loading,
      ),
    );
    try {
      await _authRepository.deleteAccount();
      emit(
        UserState(
          userStatus: UserStatus.success,
        ),
      );
    } catch (error) {
      emit(
        UserState(
          userStatus: UserStatus.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }
}
