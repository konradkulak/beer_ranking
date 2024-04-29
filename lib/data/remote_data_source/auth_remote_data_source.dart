import 'package:beer_ranking/domain/models/auth_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRemoteDataSource {
  AuthRemoteDataSource();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<AuthModel> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      var result = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return AuthModel(
        id: result.user!.uid,
        email: result.user!.uid,
      );
    } catch (error) {
      throw Exception('Failed to sign in: $error');
    }
  }

  Future<AuthModel> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      var result = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return AuthModel(
        id: result.user!.uid,
        email: result.user!.email!,
      );
    } catch (error) {
      throw Exception('Failed to register: $error');
    }
  }

  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (error) {
      throw Exception('Failed to sign out: $error');
    }
  }

  Future<void> deleteAccount() async {
    try {
      await _firebaseAuth.currentUser?.delete();
    } catch (error) {
      throw Exception('Failed to delete an account: $error');
    }
  }
}
