import 'package:app_mobile/core/constants/color_constants.dart';
import 'package:app_mobile/core/constants/size_constant.dart';
import 'package:app_mobile/pages/account_menu/account_menu_screen.dart';
import 'package:app_mobile/pages/frequently_asked_questions/submit_a_help_request/submit_a_help_request_screen.dart';
import 'package:app_mobile/pages/home/home_screen.dart';
import 'package:app_mobile/pages/notifications/notification_screen.dart';
import 'package:app_mobile/pages/statistics/statistics_screen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key key}) : super(key: key);

  @override
  _DashBoardScreenState createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  final _navigationKey = GlobalKey<CurvedNavigationBarState>();
  int _index = 0;
  int notification = 0;

  @override
  void initState() {
    super.initState();
  }

  getNotification() {
    setState(() {});
  }

  final itemIcons = [
    Icons.home,
    Icons.stacked_line_chart,
    Icons.notifications,
    Icons.person
  ];

  final screens = [
    HomeScreen(),
    StatisticsScreen(),
    NotificationScreen(),
    AccountMenu()
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
        top: false,
        child: Scaffold(
          body: screens[_index],
          bottomNavigationBar: Theme(
            data: Theme.of(context)
                .copyWith(iconTheme: IconThemeData(color: kWhiteColors)),
            child: BottomBar(),
          ),
        ),
      ),
    );
  }

  Widget BottomBar() {
    return BottomNavigationBar(
      currentIndex: _index,
      onTap: (index) => setState(() => _index = index),
      type: BottomNavigationBarType.fixed,
      backgroundColor: kWhiteColors,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: kWhiteColors,
      unselectedItemColor: kGreyColors,
      elevation: 0.0,
      items: [
        Icons.home,
        Icons.stacked_line_chart,
        Icons.notifications,
        Icons.person
      ]
          .asMap()
          .map((key, value) => MapEntry(
              key,
              BottomNavigationBarItem(
                  title: Text(''),
                  icon: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 6.0, horizontal: 16.0),
                    decoration: BoxDecoration(
                      color:
                          _index == key ? kPrimaryColors : Colors.transparent,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Icon(value, size: iconBottomSize),
                  ))))
          .values
          .toList(),
    );
  }
}
