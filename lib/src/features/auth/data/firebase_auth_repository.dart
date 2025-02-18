import 'package:firebase_auth/firebase_auth.dart';
import 'package:red_line/src/features/auth/data/auth_repository.dart';

class FirebaseAuthRepository implements AuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Stream<User?> get onAuthStateChanged => _firebaseAuth.authStateChanges();

  @override
  User? get currentUser => _firebaseAuth.currentUser;

  @override
  Future<void> loginUser(String email, String password) {
    try {
      return _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> logoutUser() {
    try {
      return _firebaseAuth.signOut();
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> resetPassword(String email) {
    try {
      return _firebaseAuth.sendPasswordResetEmail(email: email);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> signUp(
      String email, String password, String name, String? image) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      await _firebaseAuth.currentUser!
          .updateProfile(displayName: name, photoURL: image);
    } catch (e) {
      throw Exception(e);
    }
  }
}
