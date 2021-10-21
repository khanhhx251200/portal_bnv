import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

toastUtils(
    {@required String message,
    @required BuildContext context,
    Color backgroundColor,
    Color textColor}) {
  Toast.show(message, context,
      backgroundColor: backgroundColor != null ? backgroundColor : null,
      textColor: textColor != null ? textColor : null,
      duration: Toast.LENGTH_LONG,
      gravity: Toast.BOTTOM);
}
