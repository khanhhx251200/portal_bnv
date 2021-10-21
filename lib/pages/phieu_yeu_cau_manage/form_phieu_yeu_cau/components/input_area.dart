import 'package:app_mobile/core/constants/color_constants.dart';
import 'package:flutter/material.dart';

class InputArea extends StatelessWidget {
  const InputArea({Key key, this.controller, this.label, this.isEnable}) : super(key: key);
  final TextEditingController controller;
  final String label;
  final bool isEnable;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: TextField(
        controller: controller,
        minLines: 3,
        maxLines: null,
        expands: false,
        enabled: isEnable,
        keyboardType: TextInputType.multiline,
        textInputAction: TextInputAction.done,
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
