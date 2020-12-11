import 'package:flutter/material.dart';
import 'package:laundryapp/Screens/History/history_screen.dart';
import 'package:laundryapp/Screens/Home/home_screen.dart';
import 'package:laundryapp/Screens/Login/login_screen.dart';
import 'package:laundryapp/Screens/User/edit/user_edit_screen.dart';
import 'package:laundryapp/api/user.dart';

const menus = ['Main', 'Account', 'History', 'Setting', 'Logout'];
final List<Widget> navigation = [
  HomeScreen(),
  UserEditScreen(),
  HistoryScreen(),
  HomeScreen(),
  LoginScreen(),
];

class HistoryListContainer extends StatefulWidget {
  const HistoryListContainer({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  _HistoryListContainerState createState() => _HistoryListContainerState();
}

class _HistoryListContainerState extends State<HistoryListContainer> {
  int activePage = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: widget.size.width * .65,
        height: widget.size.height * .5,
        child: ListView.builder(
            itemCount: menus.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    activePage = index;
                    if (activePage == 0) {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                        return navigation[index];
                      }));
                    } else if (activePage == menus.length - 1) {
                      doLogout();
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()),
                          (Route<dynamic> route) => false);
                    } else {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return navigation[index];
                      }));
                    }
                  });
                },
                child: Container(
                  decoration: activePage == index
                      ? BoxDecoration(
                          color: Colors.white.withOpacity(.1),
                        )
                      : BoxDecoration(),
                  padding: EdgeInsets.only(left: 40, top: 20, bottom: 20),
                  child: Text(
                    menus[index],
                    style: TextStyle(
                        color: Colors.white, fontSize: 18, letterSpacing: .6),
                  ),
                ),
              );
            }));
  }
}
