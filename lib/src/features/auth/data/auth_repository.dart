import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  /// stream of [User] which will emit the current user when the auth state changes.
  /// if the user is signed out, it will emit [NULL].
  Stream<User?> get onAuthStateChanged;

  /// returns the current user.
  /// if the user is signed out, it will return [NULL].
  User? get currentUser;

  /// logs in the user with the given [email] and [password].
  /// throws an exception if the login fails.
  Future<void> loginUser(String email, String password);

  /// logs out the current user.
  /// throws an exception if the logout fails.
  Future<void> logoutUser();

  /// sends a password reset email to the user with the given [email].
  /// throws an exception if the email could not be sent.
  Future<void> signUp(
      String email, String password, String name, String? image);

  /// sends a password reset email to the user with the given [email].
  /// throws an exception if the email could not be sent.
  Future<void> resetPassword(String email);

  /// deletes the current user.
  /// throws an exception if the user could not be deleted.
  /// [password] is the password of the user.
  Future<void> deleteUser(String password);
}
