import 'package:app_mobile/components/always_disable_focus_node.dart';
import 'package:app_mobile/core/constants/color_constants.dart';
import 'package:app_mobile/core/constants/size_config.dart';
import 'package:app_mobile/core/constants/size_constant.dart';
import 'package:app_mobile/core/constants/string_constants.dart';
import 'package:app_mobile/core/utils/keyboard_utils.dart';
import 'package:app_mobile/pages/home/components/search_all_in_app.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      width: SizeConfig.screenWidth ,
      decoration: BoxDecoration(
        color: kSecondColor.withOpacity(0.5),
        borderRadius: BorderRadius.circular(48),
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
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            hintText: kSearch,
            hintStyle: GoogleFonts.roboto(color: kWhiteColors),
            prefixIcon: Icon(Icons.search, color: kWhiteColors)),
      ),
    );
  }
}
