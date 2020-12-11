import 'package:flutter/material.dart';
import 'package:laundryapp/components/rounded_button.dart';
import 'package:laundryapp/constants.dart';

class TransactionDetail extends StatelessWidget {
  final String id;
  const TransactionDetail({Key key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text("Transaction Date"),
          centerTitle: true,
        ),
        body: TransactionDetailBody(size: size, id: id));
  }
}

class TransactionDetailBody extends StatelessWidget {
  const TransactionDetailBody({
    Key key,
    @required this.size,
    @required this.id,
  }) : super(key: key);

  final Size size;
  final String id;

  @override
  Widget build(BuildContext context) {
    const double defaultMargin = 12;
    return Container(
      width: size.width,
      height: double.infinity,
      color: Colors.grey.withOpacity(.4),
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text("Order ID"), Text(id)],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        "assets/icons/privacy.png",
                        width: 36,
                        height: 36,
                      ),
                      SizedBox(
                        width: defaultMargin * 2,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Lightning Service - Rp. 17.500 per Kilogram",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: defaultMargin / 2,
                          ),
                          Text(
                            "Waiting for Payment",
                            style: TextStyle(color: kPrimaryColor),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: defaultMargin * .7,
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  width: size.width,
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Text(
                              "Address",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: defaultMargin,
                            ),
                            Text(
                              "Jl. Raden Saleh, Baleharjo, Pacitan",
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: defaultMargin * .7,
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  width: size.width,
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(bottom: 20),
                        child: Text(
                          "Order Summary",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Clothing 2Kg "),
                              Text("35.000"),
                            ],
                          ),
                          SizedBox(
                            height: defaultMargin / 2,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Jacket "),
                              Text("5.000"),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: defaultMargin * .7,
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  width: size.width,
                  color: Colors.white,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Text("Subtotal"), Text("40.000")],
                      ),
                      SizedBox(
                        height: defaultMargin,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Text("Delivery Fee"), Text("2.000")],
                      ),
                      SizedBox(
                        height: defaultMargin,
                      ),
                      Container(
                        height: 1,
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(1),
                        ),
                      ),
                      SizedBox(
                        height: defaultMargin,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Rp. 42.000",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: defaultMargin * .7,
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  width: size.width,
                  color: Colors.white,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Payment Method",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: [
                              Image.asset(
                                "assets/icons/payment.png",
                                width: 32,
                                height: 32,
                              ),
                              Text(
                                "SLR WALLET",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: defaultMargin * .7,
                ),
                RoundedButton(
                  color: kPrimaryColor,
                  onPress: () {
                    print("User Wants to pay!!");
                    // Navigator.pushReplacement(context,
                    //     MaterialPageRoute(builder: (context) {
                    //   return HistoryScreen();
                    // }));
                  },
                  textColor: Colors.white,
                  text: "Pay Now",
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
