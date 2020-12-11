import 'package:flutter/material.dart';
import 'package:laundryapp/Screens/User/edit/components/user_edit_body.dart';
import 'package:laundryapp/constants.dart';

class UserEditScreen extends StatelessWidget {
  const UserEditScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kPrimaryColor,
      ),
      body: UserEditBody(),
    );
  }
}
