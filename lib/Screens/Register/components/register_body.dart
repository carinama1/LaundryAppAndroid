import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:laundryapp/Screens/Register/components/register_background.dart';
import 'package:laundryapp/components/rounded_button.dart';
import 'package:laundryapp/components/rounded_input.dart';
import 'package:laundryapp/constants.dart';

class RegisterBody extends StatefulWidget {
  const RegisterBody({Key key}) : super(key: key);

  @override
  _RegisterBodyState createState() => _RegisterBodyState();
}

class _RegisterBodyState extends State<RegisterBody> {
  String username = '';
  String password = '';
  String cPassword = '';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return RegisterBackground(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Text("REGISTER",
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: size.height * .03),
            SvgPicture.asset(
              "assets/icons/signup.svg",
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
            RoundedInput(
              child: TextField(
                onChanged: (value) {
                  cPassword = value;
                },
                obscureText: true,
                decoration: InputDecoration(
                    icon: Icon(Icons.lock, color: kPrimaryColor),
                    hintText: "Password Confirmation",
                    border: InputBorder.none,
                    suffixIcon: Icon(Icons.visibility, color: kPrimaryColor)),
              ),
            ),
            RoundedButton(
              color: kPrimaryColor,
              onPress: () {},
              textColor: Colors.white,
              text: "REGISTER",
            ),
            SizedBox(height: size.height * .03),
            Text(
              "Allready have an Account ? Sign In",
              style: TextStyle(
                  fontSize: 12,
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
