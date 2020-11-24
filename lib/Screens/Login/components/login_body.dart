import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:laundryapp/Screens/Home/home_screen.dart';
import 'package:laundryapp/Screens/Login/components/login_background.dart';
import 'package:laundryapp/Screens/Register/register_screen.dart';
import 'package:laundryapp/components/rounded_button.dart';
import 'package:laundryapp/components/rounded_input.dart';
import 'package:laundryapp/constants.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({Key key}) : super(key: key);

  @override
  _LoginBodyState createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  String username = '';
  String password = '';

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
            RoundedInput(
              child: TextField(
                onChanged: (value) {
                  username = value;
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
                  password = value;
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
              onPress: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return HomeScreen();
                }));
              },
              textColor: Colors.white,
              text: "LOGIN",
            ),
            SizedBox(height: size.height * .03),
            GestureDetector(
              onTap: () {
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
