import 'package:app_mobile/core/constants/color_constants.dart';
import 'package:app_mobile/core/constants/size_constant.dart';
import 'package:app_mobile/core/constants/string_constants.dart';
import 'package:app_mobile/core/models/response/phieu_yeu_cau_response.dart';
import 'package:app_mobile/pages/phieu_yeu_cau_manage/form_phieu_yeu_cau/form_phieu_yeu_cau.dart';
import 'package:app_mobile/pages/phieu_yeu_cau_manage/components/popup_phieu_yeu_cau.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:popover/popover.dart';

class ItemPhieuYeuCau extends StatelessWidget {
  const ItemPhieuYeuCau({Key key, this.phieuYeuCau}) : super(key: key);

  final PhieuYeuCau phieuYeuCau;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 0, vertical: defaultPadding / 2),
      child: Row(
        children: [
          Expanded(
            child: ListTile(
              onTap: () {
                EasyLoading.show(status: 'Đang tải...');
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FormPhieuYeuCau(
                              phieuYeuCau: phieuYeuCau,
                            )));
              },
              title: Text(
                phieuYeuCau.tenPhieu,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: smallSize),
              ),
              subtitle: Text(phieuYeuCau.cachThucNopLuu,
                  style: TextStyle(fontSize: smallSize)),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  phieuYeuCau.status == 5
                      ? Container(
                          color: kSuccessColor,
                          padding: EdgeInsets.symmetric(
                              horizontal: defaultPadding,
                              vertical: defaultPadding / 2),
                          child: Text(
                            getStatus(phieuYeuCau.status),
                            style: GoogleFonts.roboto(
                                color: getColor(phieuYeuCau.status)),
                          ))
                      : Text(
                          getStatus(phieuYeuCau.status),
                          style: GoogleFonts.roboto(
                              color: getColor(phieuYeuCau.status)),
                        )
                ],
              ),
            ),
          ),
          phieuYeuCau.status != 0 &&
                  phieuYeuCau.status != 1 &&
                  phieuYeuCau.status != 3
              ? SizedBox.shrink()
              : IconButton(
                  onPressed: () {
                    showPopover(
                      context: context,
                      bodyBuilder: (context) => PopupPhieuYeuCau(
                        userId: 20129,
                        groupId: 20125,
                        companyId: 20100,
                        phieuYeuCau: phieuYeuCau,
                      ),
                      direction: PopoverDirection.top,
                      width: 200,
                      height: 250,
                      arrowHeight: 15,
                      arrowWidth: 30,
                    );
                  },
                  icon: Icon(Icons.more_vert))
        ],
      ),
    );
  }

  String getStatus(int status) {
    if (status == 0) {
      return kError;
    } else if (status == 1) {
      return kCreateNew;
    } else if (status == 2) {
      return kPending;
    } else if (status == 3) {
      return kAdditional;
    } else if (status == 4) {
      return kRefuse;
    } else if (status == 5) {
      return kAccept;
    } else {
      return kErrorServer;
    }
  }

  Color getColor(int status) {
    if (status == 0) {
      return kErrorColor;
    } else if (status == 1) {
      return Colors.green;
    } else if (status == 2) {
      return kWarningColor;
    } else if (status == 3) {
      return kWarningColor;
    } else if (status == 4) {
      return kErrorColor;
    } else if (status == 5) {
      return kWhiteColors;
    } else {
      return kPrimaryColors;
    }
  }
}
