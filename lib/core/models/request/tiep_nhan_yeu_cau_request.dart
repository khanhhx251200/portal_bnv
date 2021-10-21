import 'package:app_mobile/core/models/response/phieu_yeu_cau_response.dart';

class TiepNhanYeuCauRequest{
  int maYeuCau;
  String ngayTao;
  String userName;
  String userNameUpdate;
  String noiDung;
  String mucLucHoSo;
  String thoiGianDuKienNop;
  String diaChiLienHe;
  String congVanCoQuanToChuc;
  String ghiChu;
  String callBack;
  int userCreate;
  int userUpdate;
  int status;
  int toChucId;
  int nguonNopLuu;
  int soLanNopLuu;
  int tongSoHoSo;
  int tongSoTrang;
  int tongSoDungLuong;
  int cachThucNopLuu;
  List<FileDinhKem> dinhKem;

  TiepNhanYeuCauRequest(
      {this.maYeuCau,
      this.ngayTao,
      this.userName,
      this.userNameUpdate,
      this.noiDung,
      this.mucLucHoSo,
      this.thoiGianDuKienNop,
      this.diaChiLienHe,
      this.congVanCoQuanToChuc,
      this.ghiChu,
      this.callBack,
      this.userCreate,
      this.userUpdate,
      this.status,
      this.toChucId,
      this.nguonNopLuu,
      this.soLanNopLuu,
      this.tongSoHoSo,
      this.tongSoTrang,
      this.tongSoDungLuong,
      this.cachThucNopLuu,
      this.dinhKem});

  Map<String, dynamic> toJson()  {

    Map<String, dynamic> map = {
      'maYeuCau': maYeuCau,
      'ngayTao': ngayTao,
      'userCreate': userCreate,
      'userName': userName.trim(),
      'userUpdate': userUpdate,
      'userNameUpdate': userNameUpdate.trim(),
      'status': status,
      'noiDung': noiDung.trim(),
      'toChucId': toChucId,
      'nguonNopLuu': nguonNopLuu,
      'soLanNopLuu': soLanNopLuu,
      'tongSoHoSo': tongSoHoSo,
      'tongSoTrang': tongSoTrang,
      'tongSoDungLuong': tongSoDungLuong,
      'mucLucHoSo': mucLucHoSo.trim(),
      'cachThucNopLuu': cachThucNopLuu,
      'thoiGianDuKienNop': thoiGianDuKienNop,
      'diaChiLienHe': diaChiLienHe,
      'congVanCoQuanToChuc': congVanCoQuanToChuc,
      'ghiChu': ghiChu,
      'dinhKem': dinhKem,
      'callBack': callBack,
    };
    return map;
  }
}