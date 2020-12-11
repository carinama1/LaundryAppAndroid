import 'package:flutter/material.dart';
import 'package:laundryapp/constants.dart';

class RoundedInput extends StatelessWidget {
  final Widget child;
  final String error;
  const RoundedInput({Key key, this.child, this.error}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (error != null)
          Container(
            margin: EdgeInsets.only(left: 20),
            child: Text(
              error,
              style: (TextStyle(color: Colors.red)),
            ),
          ),
        Container(
          width: size.width * .8,
          margin: EdgeInsets.symmetric(vertical: 10),
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 18),
          decoration: BoxDecoration(
              color: kPrimaryLightColor,
              borderRadius: BorderRadius.circular(30),
              border: error != null
                  ? Border.all(color: Colors.red, width: 1)
                  : null),
          child: child,
        ),
      ],
    );
  }
}
