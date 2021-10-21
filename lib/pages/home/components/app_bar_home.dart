import 'package:app_mobile/core/constants/color_constants.dart';
import 'package:app_mobile/pages/home/components/search_all_in_app.dart';
import 'package:app_mobile/pages/home/components/search_field.dart';
import 'package:flutter/material.dart';

class AppBarHome extends StatelessWidget with PreferredSizeWidget {
  const AppBarHome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: kPrimaryColors,
      elevation: 0.0,
      automaticallyImplyLeading: false,
      title: SearchField(),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(100);
}
