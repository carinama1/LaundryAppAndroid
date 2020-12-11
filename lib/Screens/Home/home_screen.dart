import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:laundryapp/Screens/Home/components/home_body.dart';
import 'package:laundryapp/Screens/User/user_screen.dart';
import 'package:laundryapp/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        leading: IconButton(
          icon: SvgPicture.asset("assets/icons/menu.svg", color: Colors.white),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return UserScreen();
            }));
          },
        ),
        centerTitle: true,
        title: Image.asset("assets/icons/selondry.png"),
        // title: Text(
        //   "LaundryApp",
        //   style: TextStyle(color: Colors.white),
        // ),
      ),
      body: Container(
        height: double.infinity,
        child: Column(
          children: [BodyLayoutV2()],
        ),
      ),
    );
  }
}
