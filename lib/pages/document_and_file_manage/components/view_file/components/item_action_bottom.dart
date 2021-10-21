import 'package:app_mobile/core/constants/color_constants.dart';
import 'package:app_mobile/core/constants/size_constant.dart';
import 'package:flutter/material.dart';

class ItemActionBottom extends StatelessWidget {
  const ItemActionBottom({
    Key key,
    @required this.icon,
    @required this.title,
    @required this.onPressed,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap:  onPressed,
      leading: Icon(icon),
      title: Text(
        title,
        style: TextStyle(fontSize: smallSize, fontWeight: FontWeight.w500, color: kGreyColors),
      ),
    );
  }
}
