import 'dart:async';

import 'package:app_mobile/components/loading_widget.dart';
import 'package:app_mobile/core/constants/color_constants.dart';
import 'package:app_mobile/core/constants/size_constant.dart';
import 'package:app_mobile/core/constants/string_constants.dart';
import 'package:app_mobile/pages/auth/auth_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  static final routeName = '/splash';

  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  bool _visible = false;

  AnimationController animationController;
  Animation<double> animation;

  startTime() async {
    var _duration = new Duration(seconds: 2);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    setState(() => _visible = !_visible);
    Future.delayed(defaultDuration, () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => AuthScreen()));
    });
  }

  @override
  void initState() {
    super.initState();

    animationController = new AnimationController(
        vsync: this, duration: new Duration(seconds: 1));
    animation =
        new CurvedAnimation(parent: animationController, curve: Curves.easeOut);

    animation.addListener(() => this.setState(() {}));
    animationController.forward();

    startTime();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColors,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              _visible ? LoadingWidget() : SizedBox(),
              SizedBox(
                height: highSize,
              ),
              // Padding(
              //   padding: EdgeInsets.only(bottom: defaultPadding),
              //   child: Text(
              //     'Bộ Nội Vụ',
              //     style: TextStyle(fontSize: highSize, color: kWhiteColors),
              //   ),
              // ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Hero(
                tag: kLogo,
                child: Image.asset(
                  'assets/images/logo_ecm.png',
                  width: animation.value * 250,
                  height: animation.value * 250,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
