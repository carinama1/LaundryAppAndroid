import 'package:flutter/material.dart';
import 'package:laundryapp/Screens/History/components/page_switcher.dart';
import 'package:laundryapp/Screens/History/components/transaction_card.dart';
import 'package:laundryapp/api/order.dart';
import 'package:laundryapp/api/user.dart';
import 'package:laundryapp/constants.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HistoryScreen extends StatefulWidget {
  HistoryScreen({Key key}) : super(key: key);

  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  String _username;
  List<dynamic> _items = [];
  List<bool> _itemsv2 = [true, false, true, false];

  @override
  void initState() {
    super.initState();
    _loadUser();
  }

  void _onRefresh() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _loadOrderByOwner();
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    if (mounted)
      // if failed,use loadFailed(),if no data return,use LoadNodata()
      _refreshController.loadComplete();
  }

  void _loadUser() async {
    try {
      Map<String, dynamic> response = await whoImIRequest();
      _username = response["data"]["username"];
      _loadOrderByOwner();
    } catch (err) {
      print(err);
    }
  }

  void _loadOrderByOwner() async {
    Map<String, dynamic> response =
        await findOrderByOwnerRequest(username: _username);
    if (response["succes"]) {
      this.setState(() {
        _items = response["data"];
      });
    } else {
      print(response["error"]);
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0,
      ),
      body: SmartRefresher(
        enablePullDown: true,
        controller: _refreshController,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        child: Container(
          height: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.grey[350], Colors.grey[100]])),
          child: Stack(
            children: [
              Column(
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
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                      child: Column(
                        children: <Widget>[
                          PageSwitcherWidget(),
                          SizedBox(height: size.height * .03),
                          Container(
                            width: size.width,
                            height: size.height - 325,
                            child: ListView.builder(
                              itemCount: _items.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Column(
                                  children: <Widget>[
                                    TransactionCard(
                                      status:
                                          _items[index]["status"]["code"] != 500
                                              ? false
                                              : true,
                                      item: _items[index],
                                    ),
                                    SizedBox(height: size.height * .03),
                                  ],
                                );
                              },
                            ),
                          ),
                        ],
                      ))
                ],
              ),
            ],
          ),
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
