class FirebaseErrorTextConverter {
  static String convertFirebaseError(String errorMessage) {
    final errorCode = errorMessage.split(" ").last;

    switch (errorCode) {
      case "invalid-email":
        return "The email address is invalid.";
      case "user-disabled":
        return "The user account has been disabled.";
      case "user-not-found":
        return "No user found with this email address.";
      case "wrong-password":
        return "The password is incorrect.";
      case "email-already-in-use":
        return "The email address is already in use by another account.";
      case "operation-not-allowed":
        return "This sign-in method is not enabled.";
      case "weak-password":
        return "The password is too weak.";
      case "account-exists-with-different-credential":
        return "An account already exists with a different credential.";
      case "invalid-credential":
        return "The provided credentials are invalid or have expired.";
      case "invalid-verification-code":
        return "The verification code is invalid.";
      case "invalid-verification-id":
        return "The verification ID is invalid.";
      case "too-many-requests":
        return "Too many requests. Try again later.";
      default:
        return "An unknown error occurred. Please try again later.";
    }
  }
}
