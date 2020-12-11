import 'package:flutter/material.dart';
import 'package:laundryapp/Screens/History/components/transaction_detail.dart';
import 'package:laundryapp/constants.dart';
import 'package:laundryapp/misc.dart';

const List<String> assets = ['assets/icons/coming-soon.png'];

class TransactionCard extends StatelessWidget {
  final bool status;
  final dynamic item;
  const TransactionCard({
    Key key,
    this.status,
    this.item,
  }) : super(key: key);
  final id = 'LDR-0000928';

  @override
  Widget build(BuildContext context) {
    print(item);
    final Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return TransactionDetail(id: id);
        }));
      },
      child: Container(
          width: size.width,
          height: size.height * .12,
          decoration: BoxDecoration(
              color: status ? kPrimaryMediumColor : Colors.white,
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: <Widget>[
              Expanded(
                  child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                      height: size.height * .12,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Transaction ${item["orderID"]}",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: status ? Colors.white : Colors.black)),
                          Opacity(
                            opacity: .6,
                            child: Text("Using name,phone number or email",
                                style: TextStyle(
                                    fontSize: 14,
                                    color:
                                        status ? Colors.white : Colors.black)),
                          )
                        ],
                      ))),
              StatusWidget(
                size: size,
                status: status,
                statusLabel: item["status"]["label"],
              )
            ],
          )),
    );
  }
}

class StatusWidget extends StatelessWidget {
  final String statusLabel;
  const StatusWidget({
    Key key,
    @required this.size,
    this.status,
    this.statusLabel,
  }) : super(key: key);

  final Size size;
  final bool status;

  @override
  Widget build(BuildContext context) {
    return status
        ? Done(
            size: size,
            status: statusLabel,
          )
        : NotDone(
            size: size,
            status: statusLabel,
          );
  }
}

class Done extends StatelessWidget {
  final String status;
  final Size size;
  const Done({Key key, this.size, this.status}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
          bottomLeft: Radius.circular(60)),
      child: Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.only(top: 10),
        color: kPrimaryColor,
        height: size.height * .12,
        width: size.width * .26,
        child: Text(
          status.capitalizeFirstofEach,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}

class NotDone extends StatelessWidget {
  final String status;
  final Size size;
  const NotDone({
    Key key,
    @required this.size,
    this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kPrimaryLightColor,
      child: Column(
        children: <Widget>[
          Container(
            height: size.height * .06,
            width: size.width * .26,
            child: Stack(
              children: [
                Positioned(
                    top: 10,
                    right: 14,
                    child: Image.asset(
                      "assets/icons/coming-soon.png",
                      width: size.width * .05,
                    ))
              ],
            ),
          ),
          ClipPath(
            clipper: TopMidWaveClipper(),
            child: Container(
                height: size.height * .06,
                width: size.width * .26,
                decoration: BoxDecoration(color: kPrimaryColor),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    margin: EdgeInsets.only(right: 10, bottom: 10),
                    child: Text(
                      status.capitalizeFirstofEach,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}

class TopMidWaveClipper extends CustomClipper<Path> {
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);

    var firstControlPoint = Offset(size.width * .75, size.height * .1);
    var firstEndPoint = Offset(size.width * .5, 0);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint = Offset(size.width * .1, 0);
    var secondEndPoint = Offset(0, size.height);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(0.0, size.height);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
