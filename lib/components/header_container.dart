import 'package:app_mobile/core/constants/color_constants.dart';
import 'package:app_mobile/core/constants/size_constant.dart';
import 'package:app_mobile/core/constants/string_constants.dart';
import 'package:flutter/material.dart';

class HeaderContainer extends StatelessWidget {
  final String text;

  const HeaderContainer({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.25,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [kPrimaryColor, kSecondColors],
              end: Alignment.bottomCenter,
              begin: Alignment.topCenter),
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100))),
      child: Stack(
        children: <Widget>[
          Positioned(
              bottom: bigSize,
              right: bigSize,
              child: Text(
                text,
                style: TextStyle(color: Colors.white, fontSize: bigSize, fontWeight: FontWeight.bold),
              )),
          Center(
            child: Hero(
                tag: kLogo,
                child: Image.asset("assets/images/logo_ecoit.png", height: 80, width: 80,)),
          ),
        ],
      ),
    );
  }
}
