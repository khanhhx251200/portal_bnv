import 'package:app_mobile/core/constants/color_constants.dart';
import 'package:app_mobile/core/constants/size_constant.dart';
import 'package:app_mobile/core/constants/string_constants.dart';
import 'package:flutter/material.dart';

AppBar appBarPhieuYeuCau() {
  return AppBar(
    backgroundColor: kPrimaryColors,
    leading: BackButton(color: kWhiteColors),
    title: Text(
      kPhieuYeuCauManage,
      style: TextStyle(color: kWhiteColors, fontSize: veryHighSize),
    ),
  );
}