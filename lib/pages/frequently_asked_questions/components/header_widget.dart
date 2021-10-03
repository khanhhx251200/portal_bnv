import 'package:app_mobile/core/constants/color_constants.dart';
import 'package:app_mobile/core/constants/size_constant.dart';
import 'package:app_mobile/core/constants/string_constants.dart';
import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.12,
      width: double.infinity,
      color: kPrimaryColors,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: mediumSize, left: mediumSize),
            child: Text(kHello,
                style: TextStyle(
                    color: kWhiteColors,
                    fontWeight: FontWeight.bold,
                    fontSize: bigSize + 4)),
          ),
          Padding(
            padding:
            const EdgeInsets.only(top: defaultPadding, left: mediumSize),
            child: Text(kHowCanWeHelpYou,
                style: TextStyle(
                    color: kWhiteColors,
                    fontWeight: FontWeight.bold,
                    fontSize: bigSize)),
          ),
        ],
      ),
    );
  }
}
