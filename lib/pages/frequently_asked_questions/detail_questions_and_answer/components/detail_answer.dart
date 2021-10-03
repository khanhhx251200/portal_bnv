import 'package:app_mobile/core/constants/color_constants.dart';
import 'package:app_mobile/core/constants/string_constants.dart';
import 'package:flutter/material.dart';

AppBar detailAnswerAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: kPrimaryColors,
    leading: IconButton(
      icon: Icon(
        Icons.arrow_back_ios,
        color: kWhiteColors,
      ),
      onPressed: () => Navigator.pop(context),
    ),
    title: Text(
      kAnswers,
      style: TextStyle(color: kWhiteColors),
    ),
    centerTitle: true,
  );
}
