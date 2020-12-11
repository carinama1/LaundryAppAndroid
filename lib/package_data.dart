import 'package:flutter/material.dart';

class PackageInformation {
  String title;
  String subTitle;
  int price;
  int orderType;
  String day;
  List<Color> bgColor;
  String asset;

  PackageInformation(
      {this.title,
      this.subTitle,
      this.price,
      this.orderType,
      this.day,
      this.bgColor,
      this.asset});
}

final regularService = PackageInformation(
  title: "Regular Service",
  subTitle: "Nice service",
  price: 12500,
  orderType: 100,
  day: "2-3 Hari",
  bgColor: [Colors.blue, Colors.blue[200]],
  asset: "assets/images/shipping-package-colour-nobg.png",
);

final lightningService = PackageInformation(
  title: "Lightning Service",
  subTitle:
      "Lightning Fast laundry services perfect for you in a tight schedule",
  price: 17500,
  orderType: 200,
  day: "Next Day Guarantee",
  bgColor: [Colors.lightGreen, Colors.lightGreenAccent],
  asset: "assets/images/sprinter.png",
);

final vacationService = PackageInformation(
  title: "Vacation Service",
  subTitle: "Best service choice if you are planning on leaving",
  price: 10000,
  orderType: 300,
  day: "7+ Hari",
  bgColor: [Colors.green, Colors.greenAccent],
  asset: "assets/images/hiker.png",
);

List<PackageInformation> laundryServices = [
  regularService,
  lightningService,
  vacationService,
];
