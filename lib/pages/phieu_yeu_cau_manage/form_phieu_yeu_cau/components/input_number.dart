import 'package:app_mobile/core/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InputNumber extends StatelessWidget {
  const InputNumber({Key key, this.controller, this.label, this.isEnable}) : super(key: key);
  final TextEditingController controller;
  final String label;
  final bool isEnable;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: TextField(
        controller: controller,
        enabled: isEnable,
        keyboardType: TextInputType.number,
        textInputAction: TextInputAction.next,
        style: GoogleFonts.roboto(),
        decoration: InputDecoration(
          border: new OutlineInputBorder(
              borderSide: new BorderSide(color: kBlackColors)),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: label ,
          labelStyle: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
