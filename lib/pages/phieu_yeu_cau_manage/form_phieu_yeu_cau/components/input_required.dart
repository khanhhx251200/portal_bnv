import 'package:app_mobile/components/always_disable_focus_node.dart';
import 'package:app_mobile/core/constants/color_constants.dart';
import 'package:app_mobile/core/constants/size_constant.dart';
import 'package:app_mobile/core/constants/string_constants.dart';
import 'package:app_mobile/core/utils/keyboard_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class InputRequired extends StatefulWidget {
  const InputRequired({Key key, this.controller, this.label, this.isDate, this.isEnable, this.error})
      : super(key: key);
  final TextEditingController controller;
  final String label;
  final String error;
  final bool isDate;
  final bool isEnable;

  @override
  State<InputRequired> createState() => _InputRequiredState();
}

class _InputRequiredState extends State<InputRequired> {
  String error = '';

  @override
  void initState() {
    super.initState();
    widget.error != null ? error = widget.error : error = '';
    if (widget.isDate) {
      String formattedDate = DateFormat('dd/MM/yyyy').format(DateTime.now());
      widget.controller.text = formattedDate;
    }
  }

  @override
  void didUpdateWidget(covariant InputRequired oldWidget) {
    super.didUpdateWidget(oldWidget);
    widget.error != null ? error = widget.error : error = '';
  }

  @override
  void dispose() {
    super.dispose();
    error = '';
  }

  Future<void> showDatePicker(TextEditingController controller) async {
    DateTime initTime = DateFormat('dd/MM/yyyy').parse(controller.text);
    print('initTime: $initTime');
    FocusScope.of(context).unfocus();
    await DatePicker.showDatePicker(context,
        showTitleActions: true,
        minTime: DateTime.now(),
        maxTime: DateTime(DateTime.now().year + 200, 1, 1),
        onChanged: (date) {}, onConfirm: (date) {
      setState(() {
        controller.text = DateFormat('dd/MM/yyyy').format(date);
        KeyboardUtil.hideKeyboard(context);
      });
    }, currentTime: initTime, locale: LocaleType.vi);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 40,
          child: TextFormField(
            enabled: widget.isEnable,
            focusNode: widget.isDate ? AlwaysDisabledFocusNode() : null,
            controller: widget.controller,
            style: GoogleFonts.roboto(),
            textInputAction: TextInputAction.next,
            onTap: widget.isDate
                ? () async {
                    showDatePicker(widget.controller);
                  }
                : null,
            decoration: InputDecoration(
              border: new OutlineInputBorder(
                  borderSide: new BorderSide(
                      color: error.isNotEmpty ? kErrorColor : kGreyColors)),
              focusedBorder: OutlineInputBorder(
                  borderSide: new BorderSide(
                      color: error.isNotEmpty ? kErrorColor : kPrimaryColors)),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              labelText: widget.label + " (*)",
              labelStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: error.isNotEmpty ? kErrorColor : null),
              suffixIcon: widget.isDate ? Icon(Icons.date_range) : null
            ),
            onChanged: (value) {
              setState(() {
                if (value.isEmpty) {
                  error = kRequired;
                } else if (patternCode.hasMatch(value)) {
                  error = kNotCharacter;
                } else {
                  error = '';
                }
              });
            },
          ),
        ),
        error.isNotEmpty
            ? Padding(
                padding: const EdgeInsets.only(top: 8.0, left: smallSize),
                child: Text(
                  widget.label + " " + error,
                  style: GoogleFonts.roboto(
                      color: kErrorColor, fontSize: smallSize),
                ),
              )
            : Container()
      ],
    );
  }
}
