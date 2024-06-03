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
        result.user!.uid,
        result.user!.email ?? "no email",
      );
    } on FirebaseAuthException catch (error) {
      if (error.code == 'user=not-found') {
        throw Exception('No user found for that email');
      } else if (error.code == 'wrong-password') {
        throw Exception('Wrong password');
      } else {
        throw Exception(error.message ?? 'Failed to sign in');
      }
    }
  }

  Future<AuthModel> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      var result = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return AuthModel(
        result.user!.uid,
        result.user!.email!,
      );
    } on FirebaseAuthException catch (error) {
      if (error.code == 'email-already-in-use') {
        throw Exception('The email is already in use by another account');
      } else {
        throw Exception(error.message ?? 'Failed to register');
      }
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
