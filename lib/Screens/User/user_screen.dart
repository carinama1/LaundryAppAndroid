import 'package:flutter/material.dart';
import 'package:laundryapp/Screens/User/component/account_bar.dart';
import 'package:laundryapp/Screens/User/component/history_list_container.dart';
import 'package:laundryapp/api/user.dart';
import 'package:laundryapp/components/bottom_wave.dart';
import 'package:laundryapp/constants.dart';

const defualtImage =
    'https://www.hostinger.co.id/tutorial/wp-content/uploads/sites/11/2017/05/create-default-wordpress-htaccess-file-1280x720.png';

class UserScreen extends StatefulWidget {
  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  String _username, _image, _email;
  int _monetary;
  @override
  void initState() {
    super.initState();
    _loadUser();
  }

  void _loadUser() async {
    try {
      Map<String, dynamic> response = await whoImIRequest();
      _username = response["data"]["username"];
      _image = response["data"]["image"];
      _email = response["data"]["email"];
      _monetary = response["data"]["monetary"];
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
    final double appBarSize = size.height - 56;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0,
      ),
      body: Stack(children: <Widget>[
        Container(
          height: appBarSize,
          width: size.width,
          color: kPrimaryColor,
          child: Stack(
            children: <Widget>[
              SingleChildScrollView(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 40, top: 5),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AccountBar(
                                size: size,
                                image: defualtImage,
                                username: _username ?? '',
                                email: _email ?? 'carinama1@gmail.com',
                              ),
                              SizedBox(height: size.height * defaultMargin),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 12, horizontal: 20),
                                  decoration:
                                      BoxDecoration(color: kSecondaryColor),
                                  child: Text(
                                    "Rp. $_monetary",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1),
                                  ),
                                ),
                              ),
                            ]),
                      ),
                      SizedBox(height: size.height * defaultMargin * 3),
                      HistoryListContainer(size: size),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: appBarSize / 8,
                right: 0,
                child: Image.asset(
                  "assets/images/user-side.png",
                  height: size.height * .67,
                ),
              )
            ],
          ),
        ),
        Positioned(
            bottom: 0, child: Container(width: size.width, child: BottomWave()))
      ]),
    );
  }
}
