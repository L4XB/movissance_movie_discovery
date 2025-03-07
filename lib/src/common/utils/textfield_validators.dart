class TextfieldValidators {
  /// validator for email
  /// [email] the email to validate
  /// [returns] null if the email is valid, otherwise an error message
  static String? emailValidator(String? email) {
    if (email == null || email.isEmpty) {
      return 'Email is required';
    }
    if (!email.contains('@')) {
      return 'Invalid email';
    }
    return null;
  }

  /// validator for password
  /// [password] the password to validate
  /// [returns] null if the password is valid, otherwise an error message
  static String? passwordValidator(String? password) {
    if (password == null || password.isEmpty) {
      return 'Password is required';
    }
    if (password.length < 6) {
      return 'Password must be at least 6 characters';
    }
    if (password.contains(' ')) {
      return 'Password must not contain spaces';
    }

    return null;
  }
}
