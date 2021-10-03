import 'dart:io';

import 'package:app_mobile/core/constants/color_constants.dart';
import 'package:app_mobile/core/constants/size_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonLoadingWidget extends StatelessWidget {
  final color;

  const ButtonLoadingWidget({Key key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.all(0),
      child: Container(
        width: double.infinity,
        height: 40,
        padding: EdgeInsets.all(defaultPadding/2),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: color!= null ? [Colors.green.shade400, Colors.green.shade300]  : [kPrimaryColors, kPrimaryColors] ,
              end: Alignment.centerLeft,
              begin: Alignment.centerRight),
          borderRadius: BorderRadius.all(
            Radius.circular(100),
          ),
        ),
        alignment: Alignment.center,
        child: Platform.isAndroid ? CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(kWhiteColors)) : CupertinoActivityIndicator(),
      ),
    );
  }
}
