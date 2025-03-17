class EmailValidator {
  static String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return 'E-mail is required';
    }

    final RegExp emailRegExp =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

    if (!emailRegExp.hasMatch(value)) {
      return 'Invalid e-mail format';
    }

    return null;
  }
}

class PasswordValidator {
  static String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }

    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }

    final RegExp lowerCaseRegExp = RegExp(r'[a-z]');
    if (!lowerCaseRegExp.hasMatch(value)) {
      return 'Password must contain at least one lowercase letter';
    }

    final RegExp upperCaseRegExp = RegExp(r'[A-Z]');
    if (!upperCaseRegExp.hasMatch(value)) {
      return 'Password must contain at least one uppercase letter';
    }

    final RegExp specialCharRegExp = RegExp(r'[!@#$%^&*(),.?":{}|<>]');
    if (!specialCharRegExp.hasMatch(value)) {
      return 'Password must contain at least one special character';
    }

    return null; // Senha válida
  }
}
