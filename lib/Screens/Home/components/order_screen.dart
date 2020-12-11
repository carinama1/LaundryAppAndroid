import 'package:flutter/material.dart';
import 'package:laundryapp/Screens/History/history_screen.dart';
import 'package:laundryapp/api/order.dart';
import 'package:laundryapp/api/user.dart';
import 'package:laundryapp/components/body_input.dart';
import 'package:laundryapp/components/rounded_button.dart';
import 'package:laundryapp/constants.dart';
import 'package:laundryapp/services/validator.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:laundryapp/misc.dart';

class UserClass {
  String username;
  String name;
  String phone;
  String email;
  String address;

  UserClass({this.name, this.username, this.phone, this.address});
}

class OrderScreen extends StatefulWidget {
  final String title;
  final int price;
  final int orderType;
  final String asset;
  final Color color;
  const OrderScreen({
    Key key,
    this.title,
    this.price,
    this.asset,
    this.color,
    this.orderType,
  }) : super(key: key);

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  UserClass user = UserClass();

  @override
  void initState() {
    super.initState();
    whoimi();
  }

  void _onRefresh() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    whoimi();
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    if (mounted)
      // if failed,use loadFailed(),if no data return,use LoadNodata()
      _refreshController.loadComplete();
  }

  void whoimi() async {
    Map<String, dynamic> response = await whoImIRequest();
    if (response["succes"]) {
      print("response");
      this.setState(() {
        user.address = response['data']['address'];
        user.name = response['data']['name'];
        user.username = response['data']['username'];
        user.phone = response['data']['phone'];
      });
    } else {
      print('error');
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text("Laundry Order"),
          elevation: 0,
        ),
        body: SmartRefresher(
          enablePullDown: true,
          controller: _refreshController,
          onRefresh: _onRefresh,
          onLoading: _onLoading,
          child: SingleChildScrollView(
            child: OrderScreenBody(
              size: size,
              title: widget.title,
              asset: widget.asset,
              color: widget.color,
              price: widget.price,
              name: user.name,
              phone: user.phone,
              address: user.address,
              username: user.username,
              orderType: widget.orderType,
            ),
          ),
        ));
  }
}

class OrderScreenBody extends StatefulWidget {
  final String title; // Laundry Service
  final int price;
  final int orderType;
  final String asset;
  final Size size;
  final Color color;
  final String name, phone, address, username;
  const OrderScreenBody({
    Key key,
    this.title,
    this.size,
    this.price,
    this.asset,
    this.color,
    this.name,
    this.phone,
    this.address,
    this.username,
    this.orderType,
  }) : super(key: key);

  @override
  _OrderScreenBodyState createState() => _OrderScreenBodyState();
}

class _OrderScreenBodyState extends State<OrderScreenBody> {
  String _name;
  String _address;
  String _error;
  bool _succes = false;

  void _handleSubmit() async {
    if (usernameValidator(_name) != null) {
      _name = widget.name;
    }
    if (usernameValidator(_address) != null) {
      if (widget.address != null && widget.address != '') {
        _address = widget.address;
      } else {
        setState(() {
          _error = 'Address must be filled';
        });
        return;
      }
    }
    setState(() {
      _error = null;
    });
    Map<String, dynamic> response = await createOrderRequest(
        address: _address,
        username: widget.username,
        phone: widget.phone,
        orderType: widget.orderType);
    if (response["succes"]) {
      setState(() {
        _succes = true;
      });
    } else {
      print(response["error"]);
      setState(() {
        _error = response["error"];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final readOnly = false;
    return Container(
      width: widget.size.width,
      child: Column(
        children: [
          HeaderCard(
            size: widget.size,
            id: widget.title,
            asset: widget.asset,
            color: widget.color,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            width: widget.size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Rp. ${widget.price} / Kilogram",
                  style: TextStyle(color: kPrimaryColor),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(widget.title,
              style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 24,
                  fontWeight: FontWeight.bold)),
          if (_error != null || _succes)
            SizedBox(
              height: 10,
            ),
          if (_error != null)
            Text(
              _error.capitalizeFirstofEach,
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
          if (_succes)
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return HistoryScreen();
                }));
              },
              child: Text(
                "Order succesfully created, redeirect me to History",
                style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline),
              ),
            ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Column(
              children: [
                BodyInput(
                  label: 'Name',
                  readOnly: readOnly,
                  placeholder: widget.name,
                  handleChange: (value) {
                    _name = value;
                  },
                ),
                SizedBox(
                  height: widget.size.height * defaultMargin,
                ),
                BodyInput(
                  label: 'Phone Number',
                  readOnly: true,
                  placeholder: widget.phone,
                  handleChange: (value) {
                    print(value);
                  },
                ),
                SizedBox(
                  height: widget.size.height * defaultMargin,
                ),
                BodyInput(
                  label: 'Address',
                  readOnly: readOnly,
                  placeholder: widget.address ?? 'Address curently is empty',
                  handleChange: (value) {
                    _address = value;
                  },
                ),
              ],
            ),
          ),
          RoundedButton(
            color: kPrimaryColor,
            onPress: () {
              _handleSubmit();
              // Navigator.pushReplacement(context,
              //     MaterialPageRoute(builder: (context) {
              //   return HistoryScreen();
              // }));
            },
            textColor: Colors.white,
            text: "Order Now",
          )
        ],
      ),
    );
  }
}

class HeaderCard extends StatelessWidget {
  final String id;
  final String asset;
  final Color color;
  const HeaderCard({
    Key key,
    @required this.size,
    this.id,
    this.asset,
    this.color,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topLeft,
      children: [
        Container(
          margin: EdgeInsets.all(20),
          child: AspectRatio(
            aspectRatio: 1.67,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                color: color,
                child: FractionallySizedBox(
                  alignment: Alignment.topLeft,
                  widthFactor: .67,
                  heightFactor: 1,
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      id,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
            bottom: 20,
            right: 20,
            child: Container(
              child: Image.asset(asset, width: size.width * .38),
            )),
      ],
    );
  }
}
