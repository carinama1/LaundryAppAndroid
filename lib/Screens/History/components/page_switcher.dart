import 'package:flutter/material.dart';
import 'package:laundryapp/constants.dart';

class PageSwitcherWidget extends StatefulWidget {
  const PageSwitcherWidget({
    Key key,
  }) : super(key: key);

  @override
  _PageSwitcherWidgetState createState() => _PageSwitcherWidgetState();
}

class _PageSwitcherWidgetState extends State<PageSwitcherWidget> {
  int selectedPage = 0;
  final List<String> pages = ['NEW', 'DONE'];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: pages.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedPage = index;
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                decoration: index == selectedPage
                    ? BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: kPrimaryColor, width: 3)))
                    : BoxDecoration(),
                child: Align(
                  alignment: Alignment.center,
                  child: Opacity(
                    opacity: index == selectedPage ? 1 : .4,
                    child: Text(
                      pages[index],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
