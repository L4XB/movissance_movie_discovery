import 'package:flutter_test/flutter_test.dart';
import 'package:red_line/src/common/utils/firebase_error_text_converter.dart';

void main() {
  group('FirebaseErrorTextConverter', () {
    test('should return correct message for invalid-email error', () {
      final result = FirebaseErrorTextConverter.convertFirebaseError(
          'Error: invalid-email');
      expect(result, 'The email address is invalid.');
    });

    test('should return correct message for user-disabled error', () {
      final result = FirebaseErrorTextConverter.convertFirebaseError(
          'Error: user-disabled');
      expect(result, 'The user account has been disabled.');
    });

    test('should return correct message for user-not-found error', () {
      final result = FirebaseErrorTextConverter.convertFirebaseError(
          'Error: user-not-found');
      expect(result, 'No user found with this email address.');
    });

    test('should return correct message for wrong-password error', () {
      final result = FirebaseErrorTextConverter.convertFirebaseError(
          'Error: wrong-password');
      expect(result, 'The password is incorrect.');
    });

    test('should return correct message for email-already-in-use error', () {
      final result = FirebaseErrorTextConverter.convertFirebaseError(
          'Error: email-already-in-use');
      expect(result, 'The email address is already in use by another account.');
    });

    test('should return correct message for operation-not-allowed error', () {
      final result = FirebaseErrorTextConverter.convertFirebaseError(
          'Error: operation-not-allowed');
      expect(result, 'This sign-in method is not enabled.');
    });

    test('should return correct message for weak-password error', () {
      final result = FirebaseErrorTextConverter.convertFirebaseError(
          'Error: weak-password');
      expect(result, 'The password is too weak.');
    });

    test(
        'should return correct message for account-exists-with-different-credential error',
        () {
      final result = FirebaseErrorTextConverter.convertFirebaseError(
          'Error: account-exists-with-different-credential');
      expect(result, 'An account already exists with a different credential.');
    });

    test('should return correct message for invalid-credential error', () {
      final result = FirebaseErrorTextConverter.convertFirebaseError(
          'Error: invalid-credential');
      expect(result, 'The provided credentials are invalid or have expired.');
    });

    test('should return correct message for invalid-verification-code error',
        () {
      final result = FirebaseErrorTextConverter.convertFirebaseError(
          'Error: invalid-verification-code');
      expect(result, 'The verification code is invalid.');
    });

    test('should return correct message for invalid-verification-id error', () {
      final result = FirebaseErrorTextConverter.convertFirebaseError(
          'Error: invalid-verification-id');
      expect(result, 'The verification ID is invalid.');
    });

    test('should return correct message for too-many-requests error', () {
      final result = FirebaseErrorTextConverter.convertFirebaseError(
          'Error: too-many-requests');
      expect(result, 'Too many requests. Try again later.');
    });

    test('should return correct message for unknown error', () {
      final result = FirebaseErrorTextConverter.convertFirebaseError(
          'Error: unknown-error');
      expect(result, 'An unknown error occurred. Please try again later.');
    });
  });
}
