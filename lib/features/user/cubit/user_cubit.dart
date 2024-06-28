import 'package:beer_ranking/app/core/enums.dart';
import 'package:beer_ranking/domain/repositories/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_state.dart';
part 'user_cubit.g.dart';
part 'user_cubit.freezed.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this._authRepository)
      : super(
          const UserState(
            userStatus: UserStatus.initial,
          ),
        );

  final AuthRepository _authRepository;

  Future<void> signOut() async {
    emit(
      const UserState(
        userStatus: UserStatus.loading,
      ),
    );
    try {
      await _authRepository.signOut();
      emit(
        const UserState(
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
      const UserState(
        userStatus: UserStatus.loading,
      ),
    );
    try {
      await _authRepository.deleteAccount();
      emit(
        const UserState(
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
