class ValidationUtil {
  ValidationUtil._();

  static String? validateUsername(String value){
    return value.isEmpty ? 'Username is required' : null;
  }

  static String? validatePassword(String value){
    if(value.isEmpty) return 'Password is required';
    if(value.length < 6) return 'Password must be at least 6 characters';
    return null;
  }
}