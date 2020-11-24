import 'package:flutter/material.dart';
import 'package:laundryapp/Screens/Home/components/package_service.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 0),
      child: Column(
        children: <Widget>[
          RegularPackage(),
          MediumPackage(),
          TravellerPackage()
        ],
      ),
    );
  }
}
