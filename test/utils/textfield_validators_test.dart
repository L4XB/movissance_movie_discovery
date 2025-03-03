import 'package:flutter_test/flutter_test.dart';
import 'package:red_line/src/common/utils/textfield_validators.dart';

void main() {
  group('TextfieldValidators', () {
    group('emailValidator', () {
      test('should return error if email is null', () {
        final result = TextfieldValidators.emailValidator(null);
        expect(result, 'Email is required');
      });

      test('should return error if email is empty', () {
        final result = TextfieldValidators.emailValidator('');
        expect(result, 'Email is required');
      });

      test('should return error if email does not contain @', () {
        final result = TextfieldValidators.emailValidator('example.com');
        expect(result, 'Invalid email');
      });

      test('should return null if email is valid', () {
        final result =
            TextfieldValidators.emailValidator('example@example.com');
        expect(result, null);
      });
    });

    group('passwordValidator', () {
      test('should return error if password is null', () {
        final result = TextfieldValidators.passwordValidator(null);
        expect(result, 'Password is required');
      });

      test('should return error if password is empty', () {
        final result = TextfieldValidators.passwordValidator('');
        expect(result, 'Password is required');
      });

      test('should return error if password is less than 6 characters', () {
        final result = TextfieldValidators.passwordValidator('12345');
        expect(result, 'Password must be at least 6 characters');
      });

      test('should return error if password contains spaces', () {
        final result = TextfieldValidators.passwordValidator('pass word');
        expect(result, 'Password must not contain spaces');
      });

      test('should return null if password is valid', () {
        final result = TextfieldValidators.passwordValidator('password123');
        expect(result, null);
      });
    });
  });
}
