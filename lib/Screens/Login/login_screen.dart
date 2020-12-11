import 'package:flutter/material.dart';
import 'package:laundryapp/Screens/Login/components/login_body.dart';

class LoginScreen extends StatelessWidget {
  final String message;

  const LoginScreen({Key key, this.message}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginBody(
        message: message,
      ),
    );
  }
}
