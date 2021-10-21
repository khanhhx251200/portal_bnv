import 'package:app_mobile/core/constants/color_constants.dart';
import 'package:app_mobile/core/constants/size_constant.dart';
import 'package:app_mobile/core/constants/string_constants.dart';
import 'package:app_mobile/core/models/response/phieu_yeu_cau_response.dart';
import 'package:flutter/material.dart';

AppBar appBarFormPhieuYeuCau(PhieuYeuCau phieuYeuCau) {
  return AppBar(
    backgroundColor: kPrimaryColors,
    leading: BackButton(color: kWhiteColors),
    title: Text(
      phieuYeuCau != null ?
          (phieuYeuCau.status == 0 || phieuYeuCau.status == 1 ||
              phieuYeuCau.status == 3) ? kUpdate : kViewDetail :kAddNew,
      style: TextStyle(color: kWhiteColors, fontSize: veryHighSize),
    ),
  );
}