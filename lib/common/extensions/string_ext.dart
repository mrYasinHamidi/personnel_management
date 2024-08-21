extension EmailValidation on String {
  bool isValidEmail() {
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );

    return emailRegex.hasMatch(this);
  }

  bool isValidPassword() {
    return length > 7;
  }

  bool isValidUsername() {
    final usernameRegex = RegExp(
      r'^[a-zA-Z0-9._]+$',
    );

    return usernameRegex.hasMatch(this);
  }
}
