import 'package:app_mobile/components/always_disable_focus_node.dart';
import 'package:app_mobile/core/constants/color_constants.dart';
import 'package:app_mobile/core/constants/size_constant.dart';
import 'package:app_mobile/core/constants/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:regexpattern/regexpattern.dart';

class TextInput extends StatefulWidget {
  const TextInput({
    Key key,
    @required this.controller,
    @required this.labelAndHint,
    @required this.formKey,
  }) : super(key: key);

  final TextEditingController controller;
  final String labelAndHint;
  final GlobalKey<FormState> formKey;

  @override
  _TextInputState createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  FocusNode _focus = new FocusNode();
  bool isShowClear = false;

  @override
  void initState() {
    super.initState();
    _focus.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    super.dispose();

  }

  void _onFocusChange() {
    setState(() {
      isShowClear = !isShowClear;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: defaultPadding),
      color: kWhiteColors,
      child: TextFormField(
        focusNode: widget.labelAndHint == kDateCreatePassport
            ? AlwaysDisabledFocusNode()
            : _focus,
        keyboardType: widget.labelAndHint == kNumberPhone
            ? TextInputType.number
            : TextInputType.text,
        enabled: widget.labelAndHint == kPassport ||
                widget.labelAndHint == kCodeEnterprise
            ? false
            : true,
        controller: widget.controller,
        validator: (value) {
          return validator(value);
        },
        onChanged: (value) {
          setState(() {});
        },
        onTap: widget.labelAndHint == kDateCreatePassport ? () async {
          DateTime currentDate = DateFormat("dd/MM/yyyy").parse(widget.controller.text);
          await DatePicker.showDatePicker(context,
              showTitleActions: true,
              minTime: DateTime(1900, 1, 1),
              maxTime: DateTime.now(), onChanged: (date) {
              }, onConfirm: (date) {
                setState(() {
                  widget.controller.text = DateFormat('dd/MM/yyyy').format(date);
                });
                print('confirm $date');
              }, currentTime: currentDate, locale: LocaleType.vi);
        } : null,
        style: TextStyle(fontWeight: FontWeight.values[4]),
        decoration: InputDecoration(
            border: InputBorder.none,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            labelStyle: TextStyle(
                height: 1, fontWeight: FontWeight.bold, fontSize: veryHighSize),
            labelText: widget.labelAndHint +
                (widget.labelAndHint == kNumberPhone ? "" : " (*)"),
            hintText: widget.labelAndHint,
            contentPadding:
                EdgeInsets.only(left: bigSize, right: bigSize, top: bigSize),
            suffixIcon: widget.labelAndHint == kDateCreatePassport
                ? Icon(Icons.calendar_today)
                : isShowClear
                    ? IconButton(
                        icon: Icon(Icons.close),
                        onPressed: () {
                          widget.controller.clear();
                        })
                    : null),
      ),
    );
  }

  validator(String value) {
    if (value.isEmpty && widget.labelAndHint != kNumberPhone) {
      return kRequired;
    } else if (widget.labelAndHint == kFullName) {
      // Họ và tên
      if (patternOnlyText.hasMatch(value)) {
        return kNotCharacterAndNumber;
      } else
        return null;
    } else if (widget.labelAndHint == kNameEnterprise) {
      // Tên doanh nghiệp
      if (!patternCode.hasMatch(value)) {
        return kNotCharacter;
      } else
        return null;
    } else if (widget.labelAndHint == kEmail) {
      // Thư điện tử
      if (!value.isEmail()) {
        return kNotEmail;
      } else
        return null;
    } else if (widget.labelAndHint == kNumberPhone && widget.controller.text.isNotEmpty) {
      // Số điện thoại
        if (value.length != 10) {
          return kLengthPhone;
        } else if (!value.isPhone()) {
          return kNotPhone;
        } else
          return null;
    } else {
      return null;
    }
  }
}
