import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:laundryapp/Screens/Login/login_screen.dart';
import 'package:laundryapp/Screens/Register/components/register_background.dart';
import 'package:laundryapp/api/user.dart';
import 'package:laundryapp/components/rounded_button.dart';
import 'package:laundryapp/components/rounded_input.dart';
import 'package:laundryapp/constants.dart';
import 'package:laundryapp/services/validator.dart';

import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:laundryapp/misc.dart';

class ErrorClass {
  String label;
  String key;

  ErrorClass({this.label, this.key});
}

class RegisterBody extends StatefulWidget {
  const RegisterBody({Key key}) : super(key: key);

  @override
  _RegisterBodyState createState() => _RegisterBodyState();
}

class _RegisterBodyState extends State<RegisterBody> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  String _username = '';
  String _password = '';
  String _cPassword = '';
  String _name = '';
  String _phone = '';
  String _email = '';
  String _mainError = '';
  ErrorClass _error = ErrorClass(label: '', key: "");

  void _onRefresh() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    setState(() {
      _username = '';
      _password = '';
      _cPassword = '';
      _name = '';
      _phone = '';
      _email = '';
    });
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    if (mounted)

      // if failed,use loadFailed(),if no data return,use LoadNodata()
      _refreshController.loadComplete();
  }

  void handleSubmit() async {
    try {
      var error = usernameValidator(_username);
      if (error != null) {
        _error.label = error;
        _error.key = "username";
        throw (error);
      }
      error = passwordValidator(_password);
      if (error != null) {
        _error.label = error;
        _error.key = "password";
        throw (error);
      }
      error = passwordValidator(_cPassword);
      if (error != null) {
        _error.label = error;
        _error.key = "cPassword";
        throw (error);
      }
      error = matchValidator(_password, _cPassword);
      if (error != null) {
        _error.label = error;
        _error.key = "cPassword";
        throw (error);
      }
      error = usernameValidator(_name);
      if (error != null) {
        _error.label = error;
        _error.key = "name";
        throw (error);
      }
      error = emailValidator(_email);
      if (error != null) {
        _error.label = error;
        _error.key = "email";
        throw (error);
      }
      error = phoneValidator(_phone);
      if (error != null) {
        _error.label = error;
        _error.key = "phone";
        throw ("phone");
      }
      if (error == null) {
        setState(() {
          _error.label = null;
          _error.key = null;
        });
        Map<String, dynamic> response = await registerRequest(
            email: _email,
            password: _password,
            username: _username,
            phone: _phone,
            name: _name);

        if (!response["succes"]) {
          print('failed');
          setState(() {
            _mainError = response["error"];
          });
        } else {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return LoginScreen(message: 'User registered succesfully!');
          }));
        }
      }
    } catch (err) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return RegisterBackground(
      child: Container(
        padding: EdgeInsets.only(top: 20, bottom: 20),
        child: SmartRefresher(
          enablePullDown: true,
          controller: _refreshController,
          onRefresh: _onRefresh,
          onLoading: _onLoading,
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
                if (_mainError.isNotEmpty)
                  Text(
                    _mainError.capitalizeFirstofEach,
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold),
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
                  error: _error.key == "username" ? _error.label : null,
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
                        suffixIcon:
                            Icon(Icons.visibility, color: kPrimaryColor)),
                  ),
                  error: _error.key == "password" ? _error.label : null,
                ),
                RoundedInput(
                  child: TextField(
                    onChanged: (value) {
                      _cPassword = value;
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                        icon: Icon(Icons.lock, color: kPrimaryColor),
                        hintText: "Password Confirmation",
                        border: InputBorder.none,
                        suffixIcon:
                            Icon(Icons.visibility, color: kPrimaryColor)),
                  ),
                  error: _error.key == "cPassword" ? _error.label : null,
                ),
                RoundedInput(
                  child: TextField(
                    onChanged: (value) {
                      _name = value;
                    },
                    decoration: InputDecoration(
                        icon: Icon(Icons.person, color: kPrimaryColor),
                        hintText: "Name",
                        border: InputBorder.none),
                  ),
                  error: _error.key == "name" ? _error.label : null,
                ),
                RoundedInput(
                  child: TextField(
                    onChanged: (value) {
                      _email = value;
                    },
                    decoration: InputDecoration(
                        icon: Icon(Icons.email, color: kPrimaryColor),
                        hintText: "Email",
                        border: InputBorder.none),
                  ),
                  error: _error.key == "email" ? _error.label : null,
                ),
                RoundedInput(
                  child: TextField(
                    onChanged: (value) {
                      _phone = value;
                    },
                    decoration: InputDecoration(
                        icon: Icon(Icons.phone_android, color: kPrimaryColor),
                        hintText: "Phone",
                        border: InputBorder.none),
                  ),
                  error: _error.key == "phone" ? _error.label : null,
                ),
                RoundedButton(
                  color: kPrimaryColor,
                  onPress: () {
                    handleSubmit();
                  },
                  textColor: Colors.white,
                  text: "REGISTER",
                ),
                SizedBox(height: size.height * .03),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).popUntil((route) => route.isFirst);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return LoginScreen();
                    }));
                  },
                  child: Text(
                    "Allready have an Account ? Sign In",
                    style: TextStyle(
                        fontSize: 12,
                        color: kPrimaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
