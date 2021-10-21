import 'dart:ui';

import 'package:app_mobile/core/constants/string_constants.dart';
import 'package:get/get.dart';

showSnackBar(
  String title,
  String content,
  Color backgroundColor,
  Color colorText,
  String snackPosition,
) {
  Get.snackbar(title, content,
      backgroundColor: backgroundColor,
      colorText: colorText,
      snackPosition:
          snackPosition == kTOP ? SnackPosition.TOP : SnackPosition.BOTTOM);
}
