import 'package:dio/dio.dart';

class PhieuYeuCauRequest{
  String tenPhieu;
  String diaChiLienHe;
  String cachThucNopLuu;
  String ghiChu;
  String nguonNopLuu;
  String thoiGianNopLuu;
  int dungLuong;
  int soLanNopLuu;
  int soTrang;
  int tongSoHoSoNop;
  List<MultipartFile> mucLucsFile;
  List<MultipartFile> dinhKemFiles;

  PhieuYeuCauRequest(
      {this.tenPhieu,
      this.diaChiLienHe,
      this.cachThucNopLuu,
      this.ghiChu,
      this.nguonNopLuu,
      this.thoiGianNopLuu,
      this.dungLuong,
      this.soLanNopLuu,
      this.soTrang,
      this.tongSoHoSoNop,
      this.mucLucsFile,
      this.dinhKemFiles});

  Map<String, dynamic> toJson()  {

    Map<String, dynamic> map = {
      'tenPhieu': tenPhieu.trim(),
      'diaChiLienHe': diaChiLienHe.trim(),
      'cachThucNopLuu': cachThucNopLuu.trim(),
      'ghiChu': ghiChu.trim(),
      'nguonNopLuu': nguonNopLuu.trim(),
      'thoiGianNopLuu': thoiGianNopLuu.trim(),
      'dungLuong': dungLuong,
      'soLanNopLuu': soLanNopLuu,
      'soTrang': soTrang,
      'tongSoHoSoNop': tongSoHoSoNop,
      'mucLucsFile': mucLucsFile,
      'dinhKemFiles': dinhKemFiles,
    };
    return map;
  }
}