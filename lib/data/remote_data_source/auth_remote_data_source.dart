import 'package:beer_ranking/domain/models/auth_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRemoteDataSource {
  AuthRemoteDataSource();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<AuthModel> signInWithEmailAndPassword(
      String email, String password) async {
    var result = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    return AuthModel(
      id: result.user!.uid,
      email: result.user!.uid,
    );
  }

  Future<AuthModel> registerWithEmailAndPassword(
      String email, String password) async {
    var result = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    return AuthModel(
      id: result.user!.uid,
      email: result.user!.email!,
    );
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<void> deleteAccount() async {
    await _firebaseAuth.currentUser?.delete();
  }
}
