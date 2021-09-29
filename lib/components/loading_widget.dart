import 'dart:io';
import 'package:app_mobile/core/constants/color_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  final Colors color;

  const LoadingWidget({Key key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Platform.isAndroid
          ? CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                  color != null ? color : kPrimaryColor),
            )
          : CupertinoActivityIndicator(),
    );
  }
}
