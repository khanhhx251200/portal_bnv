import 'package:app_mobile/core/constants/color_constants.dart';
import 'package:app_mobile/core/constants/constant.dart';
import 'package:app_mobile/core/constants/size_constant.dart';
import 'package:app_mobile/core/constants/string_constants.dart';
import 'package:app_mobile/core/models/request/tiep_nhan_yeu_cau_request.dart';
import 'package:app_mobile/core/models/response/phieu_yeu_cau_response.dart';
import 'package:app_mobile/pages/phieu_yeu_cau_manage/form_phieu_yeu_cau/form_phieu_yeu_cau.dart';
import 'package:app_mobile/pages/phieu_yeu_cau_manage/components/phieu_yeu_cau_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class PopupPhieuYeuCau extends StatelessWidget {
  const PopupPhieuYeuCau({
    Key key,
    this.userId,
    this.groupId,
    this.companyId,
    this.phieuYeuCau,
  }) : super(key: key);
  final int userId;
  final int groupId;
  final int companyId;
  final PhieuYeuCau phieuYeuCau;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder:
          (BuildContext context, PhieuYeuCauProvider provider, Widget child) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(8),
            children: [
              ListTile(
                contentPadding: EdgeInsets.symmetric(
                  horizontal: defaultPadding,
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  EasyLoading.show(status: 'Đang tải...');
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FormPhieuYeuCau(
                                phieuYeuCau: phieuYeuCau,
                              )));
                },
                leading: Icon(Icons.search,
                    color: kWarningColor, size: veryHighSize),
                title: Text(kViewDetail,
                    style: GoogleFonts.roboto(fontSize: mediumSize)),
              ),
              ListTile(
                contentPadding: EdgeInsets.symmetric(
                  horizontal: defaultPadding,
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  provider.tiepNhanYeuCau(getTiepNhanYeuCau(phieuYeuCau));
                },
                leading: Icon(
                  Icons.check,
                  color: kSuccessColor,
                  size: veryHighSize,
                ),
                title: Text(
                  kSendRequest,
                  style: GoogleFonts.roboto(fontSize: mediumSize),
                ),
              ),
              ListTile(
                contentPadding: EdgeInsets.symmetric(
                  horizontal: defaultPadding,
                ),
                onTap: () {},
                leading: Icon(
                  Icons.edit,
                  size: veryHighSize,
                ),
                title: Text(kEdit,
                    style: GoogleFonts.roboto(fontSize: mediumSize)),
              ),
              ListTile(
                contentPadding: EdgeInsets.symmetric(
                  horizontal: defaultPadding,
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  provider.deletePhieuYeuCau(20129, 20125, 20100, phieuYeuCau);
                },
                leading:
                    Icon(Icons.delete, color: kErrorColor, size: veryHighSize),
                title:  Text(kDelete,
                    style: GoogleFonts.roboto(fontSize: mediumSize)),
              ),
            ],
          ),
        );
      },
    );
  }

  TiepNhanYeuCauRequest getTiepNhanYeuCau(PhieuYeuCau phieuYeuCau) {
    final df = new DateFormat("yyyy-MM-dd");
    List<FileDinhKem> dinhKem = phieuYeuCau.fileDinhKems;
    dinhKem.addAll(phieuYeuCau.mucLucHoSos);
    TiepNhanYeuCauRequest request = TiepNhanYeuCauRequest(
        maYeuCau: 1,
        ngayTao: df.format(DateTime.now()).toString(),
        userCreate: 20129,
        userName: "admin admin",
        userUpdate: 20129,
        userNameUpdate: "admin admin",
        status: phieuYeuCau.status,
        noiDung: phieuYeuCau.tenPhieu,
        toChucId: 1,
        nguonNopLuu: 0,
        soLanNopLuu: phieuYeuCau.soLanNopLuu,
        tongSoHoSo: phieuYeuCau.tongSoHoSoNopLuu,
        tongSoTrang: phieuYeuCau.soTrang,
        tongSoDungLuong: phieuYeuCau.dungLuong,
        cachThucNopLuu: 1,
        mucLucHoSo: '',
        thoiGianDuKienNop: df
            .format(
                DateTime.fromMillisecondsSinceEpoch(phieuYeuCau.thoiGianNopLuu))
            .toString(),
        diaChiLienHe: phieuYeuCau.diaChiLienHe,
        congVanCoQuanToChuc: '',
        ghiChu: '',
        dinhKem: dinhKem,
        callBack: Constant.API +
            Constant.CHANGE_STATUS_PHIEU_YEU_CAU +
            "/${phieuYeuCau.phieuId}");
    return request;
  }
}
