import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  Stream<User?> get onAuthStateChanged;
  User? get currentUser;
  Future<void> loginUser(String email, String password);
  Future<void> logoutUser();
  Future<void> signUp(String email, String password);
  Future<void> resetPassword(String email);
}
