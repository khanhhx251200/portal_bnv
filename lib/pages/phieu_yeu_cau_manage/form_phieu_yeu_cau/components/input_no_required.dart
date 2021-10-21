import 'package:app_mobile/core/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InputNoRequired extends StatelessWidget {
  const InputNoRequired({Key key, this.controller, this.label, this.isEnable}) : super(key: key);
  final TextEditingController controller;
  final String label;
  final bool isEnable;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: TextField(
        enabled: isEnable,
        controller: controller,
        textInputAction: TextInputAction.next,
        style: GoogleFonts.roboto(),
        decoration: InputDecoration(
          border: new OutlineInputBorder(
              borderSide: new BorderSide(color: kGreyColors)),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: label ,
          labelStyle: TextStyle(fontWeight: FontWeight.bold),
        ),

      ),
    );
  }
}
