import 'package:beer_ranking/data/remote_data_source/auth_remote_data_source.dart';
import 'package:beer_ranking/domain/models/auth_model.dart';

class AuthRepository {
  AuthRepository(this._authRemoteDataSource);

  final AuthRemoteDataSource _authRemoteDataSource;

  Future<AuthModel> signInWithEmailAndPassword(String email, String password) {
    return _authRemoteDataSource.signInWithEmailAndPassword(email, password);
  }

  Future<AuthModel> registerWithEmailAndPassword(
      String email, String password) {
    return _authRemoteDataSource.registerWithEmailAndPassword(email, password);
  }
}
