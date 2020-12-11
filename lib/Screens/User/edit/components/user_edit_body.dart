import 'package:flutter/material.dart';
import 'package:laundryapp/api/user.dart';
import 'package:laundryapp/components/body_input.dart';
import 'package:laundryapp/constants.dart';

const defualtImage =
    'https://www.hostinger.co.id/tutorial/wp-content/uploads/sites/11/2017/05/create-default-wordpress-htaccess-file-1280x720.png';

class UserEditBody extends StatefulWidget {
  const UserEditBody({Key key}) : super(key: key);

  @override
  _UserEditBodyState createState() => _UserEditBodyState();
}

class _UserEditBodyState extends State<UserEditBody> {
  String _username, _phone, _image, _name, _email;
  @override
  void initState() {
    _loadUser();
    super.initState();
  }

  void _loadUser() async {
    try {
      Map<String, dynamic> response = await whoImIRequest();
      print(response);
      _username = response["data"]["username"];
      _name = response["data"]["name"];
      _phone = response["data"]["phone"];
      _image = response["data"]["image"];
      _email = response["data"]["email"];
      if (_image.isEmpty) {
        _image = defualtImage;
      }
      setState(() {});
    } catch (err) {
      print(err);
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      color: kBgGreyColor,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Column(
            children: [
              Container(
                height: size.height * .12,
                decoration: BoxDecoration(color: kPrimaryColor),
              ),
              Container(
                margin: EdgeInsets.only(top: 60),
                child: Column(
                  children: [
                    Text(
                      _username ?? '',
                      style: TextStyle(color: Colors.black.withOpacity(.7)),
                    ),
                    SizedBox(
                      height: size.height * .02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/icons/protection.png",
                          width: 24,
                          height: 24,
                        ),
                        Text(" PIN Enabled",
                            style:
                                TextStyle(color: Colors.black.withOpacity(.7)))
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 40,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BodyInput(
                                label: 'Name',
                                placeholder: _name ?? 'default name',
                                handleChange: (value) {
                                  print("Name : $value");
                                },
                              ),
                              SizedBox(
                                height: size.height * .02,
                              ),
                              BodyInput(
                                label: 'Mobile Number',
                                placeholder: _phone ?? '',
                                handleChange: (value) {
                                  print("Mobile Number : $value");
                                },
                              ),
                              SizedBox(
                                height: size.height * .02,
                              ),
                              BodyInput(
                                label: 'Email Address',
                                placeholder: _email ?? 'default email',
                                handleChange: (value) {
                                  print("Email Address : $value");
                                },
                              ),
                            ],
                          ),
                        ),
                        Container(
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.only(top: 20, left: 20),
                            child: Text(
                              "Linked Accounts",
                              style: TextStyle(
                                  color: Colors.black.withOpacity(.7),
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            )),
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          alignment: Alignment.topLeft,
                          child: Column(
                            children: [
                              ExternalLoginWidget(
                                size: size,
                                icon: "assets/icons/facebook.png",
                                label: 'Facebook',
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Container(
                                  height: 1,
                                  color: Colors.grey.withOpacity(.4),
                                ),
                              ),
                              ExternalLoginWidget(
                                size: size,
                                icon: "assets/icons/google.png",
                                label: 'Google',
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          Positioned(
              top: size.height * .12 - 45,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(360),
                child: Container(
                  height: 90,
                  width: 90,
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.green),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(360),
                      child: Image.network(_image ?? defualtImage,
                          fit: BoxFit.cover)),
                ),
              )),
        ],
      ),
    );
  }
}

class ExternalLoginWidget extends StatefulWidget {
  const ExternalLoginWidget({
    Key key,
    @required this.size,
    this.icon,
    this.label,
  }) : super(key: key);

  final Size size;
  final String icon;
  final String label;

  @override
  _ExternalLoginWidgetState createState() => _ExternalLoginWidgetState();
}

class _ExternalLoginWidgetState extends State<ExternalLoginWidget> {
  bool isLinked;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.size.width,
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      decoration: BoxDecoration(color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                widget.icon,
                width: 24,
                height: 24,
              ),
              SizedBox(
                width: 20,
              ),
              Text(widget.label)
            ],
          ),
          Container(
            child: Text("slider icon"),
          )
        ],
      ),
    );
  }
}

class Save1 extends StatelessWidget {
  const Save1({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            height: size.height * .12,
            decoration: BoxDecoration(color: kPrimaryColor),
          ),
          Positioned(
              top: size.height * .12 - 45,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(360),
                child: Container(
                  height: 90,
                  width: 90,
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.green),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(360),
                      child: Image.network(defualtImage, fit: BoxFit.cover)),
                ),
              )),
          SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(top: size.height * .12 + 55),
            ),
          ),
        ],
      ),
    );
  }
}
