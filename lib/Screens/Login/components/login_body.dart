import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:laundryapp/Screens/Home/home_screen.dart';
import 'package:laundryapp/Screens/Login/components/login_background.dart';
import 'package:laundryapp/Screens/Register/register_screen.dart';
import 'package:laundryapp/api/user.dart';
import 'package:laundryapp/components/rounded_button.dart';
import 'package:laundryapp/components/rounded_input.dart';
import 'package:laundryapp/constants.dart';
import 'package:laundryapp/misc.dart';

class LoginBody extends StatefulWidget {
  final String message;
  const LoginBody({Key key, this.message}) : super(key: key);

  @override
  _LoginBodyState createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  String _username = '';
  String _password = '';
  String _error = '';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return LoginBackground(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child:
                  Text("LOGIN", style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: size.height * .03),
            SvgPicture.asset(
              "assets/icons/login.svg",
              height: size.height * .4,
            ),
            SizedBox(height: size.height * .03),
            if (_error.isNotEmpty)
              Text(
                _error.capitalizeFirstofEach,
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
            if (widget.message != null && _error.isEmpty)
              Text(
                widget.message,
                style:
                    TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
              ),
            RoundedInput(
              child: TextField(
                onChanged: (value) {
                  _username = value;
                },
                decoration: InputDecoration(
                    icon: Icon(Icons.person, color: kPrimaryColor),
                    hintText: "Username",
                    border: InputBorder.none),
              ),
            ),
            RoundedInput(
              child: TextField(
                onChanged: (value) {
                  _password = value;
                },
                obscureText: true,
                decoration: InputDecoration(
                    icon: Icon(Icons.lock, color: kPrimaryColor),
                    hintText: "Password",
                    border: InputBorder.none,
                    suffixIcon: Icon(Icons.visibility, color: kPrimaryColor)),
              ),
            ),
            RoundedButton(
              color: kPrimaryColor,
              onPress: () async {
                print('calling login');
                Map<String, dynamic> response = await loginRequest(
                    username: _username, password: _password);
                print(response);
                if (!response["succes"]) {
                  print('failed');
                  setState(() {
                    _error = response["error"];
                  });
                } else {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return HomeScreen();
                  }));
                }
              },
              textColor: Colors.white,
              text: "LOGIN",
            ),
            SizedBox(height: size.height * .03),
            GestureDetector(
              onTap: () {
                // whoImIRequest();
                Navigator.of(context).popUntil((route) => route.isFirst);
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return RegisterScreen();
                }));
              },
              child: Text(
                "Don't have an Account ? Sign Up",
                style: TextStyle(
                    fontSize: 12,
                    color: kPrimaryColor,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
