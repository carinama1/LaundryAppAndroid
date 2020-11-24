import 'package:flutter/material.dart';
import 'package:laundryapp/constants.dart';

class PackageCard extends StatelessWidget {
  final String title;
  final String subTitle;
  final String day;
  final int price;
  final List<Color> bgColor;
  final String asset;

  const PackageCard({
    Key key,
    this.title,
    this.subTitle,
    this.day,
    this.price,
    this.bgColor,
    this.asset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AspectRatio(
        aspectRatio: 1.8,
        child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.center,
          children: <Widget>[
            FractionallySizedBox(
              widthFactor: .94,
              heightFactor: .94,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 32, horizontal: 24),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: bgColor),
                  ),
                  child: InnerCard(
                    size: size,
                    title: title,
                    subTitle: subTitle,
                    day: day,
                    price: price,
                  ),
                ),
              ),
            ),
            Positioned(
              top: -0,
              right: -14,
              child: Image.asset(asset, width: size.width * .38),
            ),
          ],
        ));
  }
}

class InnerCard extends StatelessWidget {
  final String title;
  final String subTitle;
  final String day;
  final int price;
  final Size size;
  const InnerCard({
    Key key,
    @required this.size,
    this.title,
    this.subTitle,
    this.day,
    this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      alignment: Alignment.topLeft,
      widthFactor: .7,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          CardDescriptionWidget(
            size: size,
            title: title,
            subTitle: subTitle,
          ),
          PriceTimeWidget(
            size: size,
            price: price,
            day: day,
          )
        ],
      ),
    );
  }
}

class CardDescriptionWidget extends StatelessWidget {
  final String title;
  final String subTitle;
  const CardDescriptionWidget({
    Key key,
    @required this.size,
    this.title,
    this.subTitle,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style:
                TextStyle(fontSize: 22, color: Colors.black, letterSpacing: 1),
          ),
          SizedBox(height: size.height * .01),
          Text(
            subTitle,
            style: TextStyle(
              fontSize: 14,
              color: kSubTextColor,
              letterSpacing: 1,
            ),
          ),
        ]);
  }
}

class PriceTimeWidget extends StatelessWidget {
  final String day;
  final int price;
  const PriceTimeWidget({
    Key key,
    @required this.size,
    this.day,
    this.price,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Image.asset(
                "assets/icons/payment.png",
                width: size.width * .06,
              ),
              SizedBox(width: size.width * .05),
              Text("Rp. $price / Kg",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      letterSpacing: .4))
            ],
          ),
          SizedBox(height: size.height * .015),
          Row(
            children: <Widget>[
              Image.asset(
                "assets/icons/waiting.png",
                width: size.width * .06,
              ),
              SizedBox(width: size.width * .05),
              Text(day,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      letterSpacing: .4))
            ],
          )
        ]);
  }
}
