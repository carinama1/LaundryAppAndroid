import 'package:flutter/material.dart';
import 'package:laundryapp/Screens/Home/components/package_card.dart';
import 'package:laundryapp/api/services.dart';
import 'package:laundryapp/package_data.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
// class HomeBody extends StatelessWidget {
//   const HomeBody({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(vertical: 20, horizontal: 0),
//       child: Column(
//         children: <Widget>[
//           RegularPackage(),
//           MediumPackage(),
//           TravellerPackage(),
//         ],
//       ),
//     );
//   }
// }

class BodyLayout extends StatelessWidget {
  const BodyLayout({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<PackageInformation> _laundryServices = laundryServices;
    return Expanded(
      child: ListView.builder(
        itemCount: _laundryServices.length,
        itemBuilder: (context, index) {
          return PackageCard(
            title: laundryServices[index].title,
            subTitle: laundryServices[index].subTitle,
            price: laundryServices[index].price,
            day: laundryServices[index].day,
            bgColor: laundryServices[index].bgColor,
            asset: laundryServices[index].asset,
            orderType: laundryServices[index].orderType,
          );
        },
      ),
    );
  }
}

class BodyLayoutV2 extends StatefulWidget {
  const BodyLayoutV2({Key key}) : super(key: key);

  @override
  _BodyLayoutV2State createState() => _BodyLayoutV2State();
}

class _BodyLayoutV2State extends State<BodyLayoutV2> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  String _error;
  List<dynamic> _datas = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllService();
  }

  void _onRefresh() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    getAllService();
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    if (mounted)
      // if failed,use loadFailed(),if no data return,use LoadNodata()
      _refreshController.loadComplete();
  }

  void getAllService() async {
    Map<String, dynamic> response = await getAllServicesRequest();

    if (response["succes"]) {
      setState(() {
        _datas = response['data'];
      });
    } else {
      _error = response["error"];
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<PackageInformation> _laundryServices = laundryServices;
    return Expanded(
      child: _error == null && _datas.length > 0
          ? SmartRefresher(
              enablePullDown: true,
              controller: _refreshController,
              onRefresh: _onRefresh,
              onLoading: _onLoading,
              child: ListView.builder(
                itemCount: _datas?.length,
                itemBuilder: (context, index) {
                  return PackageCard(
                    title: _datas[index]["name"],
                    subTitle: _datas[index]["subDesc"],
                    price: _datas[index]["price"],
                    day: _datas[index]["day"],
                    bgColor: _laundryServices[index].bgColor,
                    asset: _laundryServices[index].asset,
                    orderType: _datas[index]["orderType"],
                  );
                },
              ),
            )
          : Text("Something Happened! :("),
    );
  }
}
