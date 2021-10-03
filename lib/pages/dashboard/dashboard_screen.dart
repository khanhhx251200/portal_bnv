import 'package:app_mobile/core/constants/color_constants.dart';
import 'package:app_mobile/core/constants/size_constant.dart';
import 'package:app_mobile/pages/account_menu/account_menu_screen.dart';
import 'package:app_mobile/pages/auth/forgot_password/forgot_password_screen.dart';
import 'package:app_mobile/pages/auth/password_manager/password_manager_screen.dart';
import 'package:app_mobile/pages/home/home_screen.dart';
import 'package:app_mobile/pages/notifications/notification_screen.dart';
import 'package:app_mobile/pages/update_account/update_screen.dart';
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

  getNotification(){
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      notification++;
    });
    final items = <Widget>[
      Icon(Icons.home, size: iconBottomSize),
      Icon(Icons.folder_open, size: iconBottomSize),
      Stack(
        children: [
          Icon(Icons.notifications, size: iconBottomSize),
          Positioned(
              top: 0.5,
              right: 1,
              child: Container(
                padding: EdgeInsets.all(defaultPadding / 2.5),
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: kErrorColor),
                child: Center(
                  child: Text("$notification", style: TextStyle(color: kWhiteColors, fontSize: smallSize, fontWeight: FontWeight.bold)),
                ),
              ))
        ],
      ),
      Icon(Icons.person, size: iconBottomSize),
    ];

    final screens = [
      HomeScreen(),
      ForgotPasswordScreen(),
      NotificationScreen(),
      AccountMenu()
    ];
    return SafeArea(
      top: false,
      child: Scaffold(
        body: screens[_index],
        bottomNavigationBar: Theme(
          data: Theme.of(context)
              .copyWith(iconTheme: IconThemeData(color: kWhiteColors)),
          child: CurvedNavigationBar(
            key: _navigationKey,
            color: kPrimaryColors,
            backgroundColor: Colors.transparent,
            height: 55,
            index: _index,
            items: items,
            onTap: (index) {
              setState(() {
                _index = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
