import 'package:flutter/material.dart';
import 'package:laundryapp/Screens/History/components/page_switcher.dart';
import 'package:laundryapp/Screens/History/components/transaction_card.dart';
import 'package:laundryapp/constants.dart';

class HistoryScreen extends StatelessWidget {
  HistoryScreen({Key key}) : super(key: key);

  final List<bool> statuses = [true, false, false, false, true];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        // iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: kPrimaryColor,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.grey[350], Colors.grey[100]])),
        child: Column(
          children: <Widget>[
            ClipPath(
              clipper: BottomWaveClipper(),
              child: Container(
                width: size.width,
                height: size.height * .14,
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                ),
                child: Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Text(
                    "HISTORY",
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
            Container(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Column(
                  children: <Widget>[
                    PageSwitcherWidget(),
                    SizedBox(height: size.height * .03),
                    Container(
                      width: size.width,
                      height: size.height - 277,
                      child: ListView.builder(
                        itemCount: statuses.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: <Widget>[
                              TransactionCard(status: statuses[index]),
                              SizedBox(height: size.height * .03),
                            ],
                          );
                        },
                      ),
                    ),
                    // TransactionCard(),
                    // SizedBox(height: size.height * .03),
                    // TransactionCard(),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

class BottomWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 20);

    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstEndPoint = Offset(size.width / 2, size.height - 20.0);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint =
        Offset(size.width - (size.width / 3.25), size.height - 40);
    var secondEndPoint = Offset(size.width, size.height - 20);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height - 20);
    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
