import 'package:app_mobile/core/constants/color_constants.dart';
import 'package:flutter/material.dart';

AppBar asksAppBar(BuildContext context){
  return AppBar(
    backgroundColor: kPrimaryColors,
    elevation: 0,
    leading: IconButton(
        icon: Icon(Icons.arrow_back_ios, color: kWhiteColors),
        onPressed: () => Navigator.pop(context)),
  );
}
