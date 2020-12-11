import 'package:flutter/material.dart';

class AccountBar extends StatelessWidget {
  final String image, email, username;
  const AccountBar({
    Key key,
    @required this.size,
    this.image,
    this.email,
    this.username,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 82,
          height: 82,
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(colors: [
                Colors.white.withOpacity(.02),
                Colors.white.withOpacity(.5),
              ])),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(360),
              child: Image.network(image, fit: BoxFit.cover)),
        ),
        Container(
          margin: EdgeInsets.only(left: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                username ?? '',
                style: TextStyle(
                    color: Colors.white, fontSize: 20, letterSpacing: 1),
              ),
              SizedBox(
                height: size.height * .01,
              ),
              Text(
                email ?? '',
                style: TextStyle(
                    color: Colors.white, fontSize: 14, letterSpacing: 1),
              )
            ],
          ),
        )
      ],
    );
  }
}
