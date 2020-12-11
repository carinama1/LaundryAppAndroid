import 'package:flutter/material.dart';
import 'package:laundryapp/Screens/Home/components/package_card.dart';

class RegularPackage extends StatelessWidget {
  const RegularPackage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PackageCard(
      title: "Regular Service",
      subTitle: "Nice service",
      price: 12500,
      halo: "asd",
      day: "2-3 Hari",
      bgColor: [Colors.blue, Colors.blue[200]],
      asset: "assets/images/shipping-package-colour-nobg.png",
    );
  }
}

class MediumPackage extends StatelessWidget {
  const MediumPackage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PackageCard(
      title: "Lightning Service",
      subTitle:
          "Lightning Fast laundry services perfect for you in a tight schedule",
      price: 17500,
      day: "Next Day Guarantee",
      bgColor: [Colors.lightGreen, Colors.lightGreenAccent],
      asset: "assets/images/sprinter.png",
    );
  }
}

class TravellerPackage extends StatelessWidget {
  const TravellerPackage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PackageCard(
      title: "Vacation Service",
      subTitle: "Best service choice if you are planning on leaving",
      price: 10000,
      day: "7+ Hari",
      bgColor: [Colors.green, Colors.greenAccent],
      asset: "assets/images/hiker.png",
    );
  }
}
