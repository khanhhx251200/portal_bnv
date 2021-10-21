import 'package:app_mobile/core/constants/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EmptyDataWidget extends StatelessWidget {
  const EmptyDataWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        kDataEmpty,
        style: GoogleFonts.roboto(),
      ),
    );
  }
}
