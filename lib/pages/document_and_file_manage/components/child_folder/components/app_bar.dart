import 'package:app_mobile/core/constants/color_constants.dart';
import 'package:app_mobile/core/constants/size_constant.dart';
import 'package:flutter/material.dart';

AppBar buildAppBarChildFolder(String name) {
  return AppBar(
    leading: BackButton(color: kWhiteColors,),
    title: Hero(
      tag: name,
      child: Text(
        name,
        style: TextStyle(color: kWhiteColors, fontSize: veryHighSize),
      ),
    ),
    backgroundColor: kPrimaryColors,
  );
}