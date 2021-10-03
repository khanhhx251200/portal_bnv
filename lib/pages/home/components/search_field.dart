import 'package:app_mobile/components/always_disable_focus_node.dart';
import 'package:app_mobile/core/constants/color_constants.dart';
import 'package:app_mobile/core/constants/size_config.dart';
import 'package:app_mobile/core/constants/size_constant.dart';
import 'package:app_mobile/core/constants/string_constants.dart';
import 'package:app_mobile/core/utils/keyboard_utils.dart';
import 'package:app_mobile/pages/home/components/search_all_in_app.dart';
import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth*0.9,
      decoration: BoxDecoration(
        color: kPrimaryColors.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        focusNode: AlwaysDisabledFocusNode(),
        onTap: () async {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => SearchAllInApp()));
          KeyboardUtil.hideKeyboard(context);
        },
        onChanged: (value) => print(value),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20),
                vertical: getProportionateScreenWidth(9)),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            hintText: kSearch,
            prefixIcon: Icon(Icons.search)),
      ),
    );
  }
}