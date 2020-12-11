import 'package:form_validator/form_validator.dart';

final usernameValidator =
    ValidationBuilder().minLength(6).maxLength(32).build();

final passwordValidator =
    ValidationBuilder().minLength(6).maxLength(24).build();

final emailValidator = ValidationBuilder().email().build();

final phoneValidator = ValidationBuilder().phone().build();

final matchValidator = (String s1, String s2) {
  if (s1 != s2) {
    return 'Password Must Match';
  }
  return null;
};
