import 'package:flutter/material.dart';

class RegisterBackground extends StatelessWidget {
  final Widget child;
  const RegisterBackground({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset("assets/images/main_top.png"),
            width: size.width * .4,
          ),
          Positioned(
              bottom: 0,
              right: 0,
              child: Image.asset("assets/images/login_bottom.png",
                  width: size.width * .4)),
          child,
        ],
      ),
    );
  }
}
