import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:laundryapp/Screens/Login/login_screen.dart';
import 'package:laundryapp/Screens/Register/register_screen.dart';
import 'package:laundryapp/Screens/Welcome/components/background.dart';
import 'package:laundryapp/components/rounded_button.dart';
import 'package:laundryapp/constants.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "WELCOME",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: size.height * .03),
            SvgPicture.asset("assets/icons/chat.svg", height: size.height * .5),
            SizedBox(height: size.height * .03),
            RoundedButton(
              text: "LOGIN",
              onPress: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return LoginScreen();
                }));
              },
            ),
            RoundedButton(
              text: "REGISTER",
              onPress: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return RegisterScreen();
                }));
              },
              color: kPrimaryLightColor,
              textColor: Colors.black,
            )
          ],
        ),
      ),
    );
  }
}
