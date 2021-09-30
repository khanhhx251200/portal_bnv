import 'package:app_mobile/core/constants/color_constants.dart';
import 'package:app_mobile/core/constants/size_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ItemMenu extends StatelessWidget {
  const ItemMenu({
    Key key,
    @required this.text,
    @required this.icon,
    this.onPress,
  }) : super(key: key);

  final String text;
  final IconData icon;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: mediumSize, vertical: xSmallSize/2),
      child: MaterialButton(
        padding: EdgeInsets.symmetric(horizontal: bigSize, vertical: xSmallSize),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: kWhiteColors,
        onPressed: onPress,
        child: Row(
          children: [
            Icon(
              icon,
              color: kSecondColors,
              size: iconBottomSize,
            ),
            SizedBox(width: bigSize),
            Expanded(child: Text(text, style: TextStyle(fontSize: highSize),)),
            Icon(Icons.arrow_forward_ios, size: bigSize,),
          ],
        ),
      ),
    );
  }
}
