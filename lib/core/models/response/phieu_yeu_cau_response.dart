// To parse this JSON data, do
//
//     final phieuYeuCauResponse = phieuYeuCauResponseFromJson(jsonString);

import 'dart:convert';

PhieuYeuCauResponse phieuYeuCauResponseFromJson(String str) => PhieuYeuCauResponse.fromJson(json.decode(str));

String phieuYeuCauResponseToJson(PhieuYeuCauResponse data) => json.encode(data.toJson());

class PhieuYeuCauResponse {
  PhieuYeuCauResponse({
    this.resultCode,
    this.message,
    this.data,
  });

  int resultCode;
  String message;
  Data data;

  factory PhieuYeuCauResponse.fromJson(Map<String, dynamic> json) => PhieuYeuCauResponse(
    resultCode: json["resultCode"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "resultCode": resultCode,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    this.total,
    this.data,
  });

  int total;
  List<PhieuYeuCau> data;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    total: json["total"],
    data: List<PhieuYeuCau>.from(json["data"].map((x) => PhieuYeuCau.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "total": total,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class PhieuYeuCau {
  PhieuYeuCau({
    this.phieuId,
    this.tongSoHoSoNopLuu,
    this.thoiGianNopLuu,
    this.cachThucNopLuu,
    this.nguonNopLuu,
    this.nguoiDuyetId,
    this.tenPhieu,
    this.lyDoDuyet,
    this.tenNguoiDuyet,
    this.diaChiLienHe,
    this.ngayDuyet,
    this.modifiedDate,
    this.soTrang,
    this.soLanNopLuu,
    this.dungLuong,
    this.status,
    this.ghiChu,
    this.tenCoQuan,
    this.fileDinhKems,
    this.mucLucHoSos,
  });

  int phieuId;
  int tongSoHoSoNopLuu;
  int thoiGianNopLuu;
  String cachThucNopLuu;
  String nguonNopLuu;
  int nguoiDuyetId;
  String tenPhieu;
  String lyDoDuyet;
  String tenNguoiDuyet;
  String diaChiLienHe;
  dynamic ngayDuyet;
  int modifiedDate;
  int soLanNopLuu;
  int soTrang;
  int dungLuong;
  int status;
  String ghiChu;
  String tenCoQuan;
  List<FileDinhKem> fileDinhKems;
  List<FileDinhKem> mucLucHoSos;

  factory PhieuYeuCau.fromJson(Map<String, dynamic> json) => PhieuYeuCau(
    phieuId: json["phieuId"],
    tongSoHoSoNopLuu: json["tongSoHoSoNopLuu"],
    thoiGianNopLuu: json["thoiGianNopLuu"],
    cachThucNopLuu: json["cachThucNopLuu"],
    nguonNopLuu: json["nguonNopLuu"],
    nguoiDuyetId: json["nguoiDuyetId"],
    tenPhieu: json["tenPhieu"],
    lyDoDuyet: json["lyDoDuyet"],
    tenNguoiDuyet: json["tenNguoiDuyet"],
    diaChiLienHe: json["diaChiLienHe"],
    ngayDuyet: json["ngayDuyet"],
    modifiedDate: json["modifiedDate"],
    soTrang: json["soTrang"],
    soLanNopLuu: json["soLanNopLuu"],
    dungLuong: json["dungLuong"],
    status: json["status"],
    ghiChu: json["ghiChu"],
    tenCoQuan: json["tenCoQuan"],
    fileDinhKems: List<FileDinhKem>.from(json["fileDinhKems"].map((x) => FileDinhKem.fromJson(x))),
    mucLucHoSos: List<FileDinhKem>.from(json["mucLucHoSos"].map((x) => FileDinhKem.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "phieuId": phieuId,
    "tongSoHoSoNopLuu": tongSoHoSoNopLuu,
    "thoiGianNopLuu": thoiGianNopLuu,
    "cachThucNopLuu": cachThucNopLuu,
    "nguonNopLuu": nguonNopLuu,
    "mucLucHoSos": mucLucHoSos,
    "nguoiDuyetId": nguoiDuyetId,
    "tenPhieu": tenPhieu,
    "lyDoDuyet": lyDoDuyet,
    "tenNguoiDuyet": tenNguoiDuyet,
    "diaChiLienHe": diaChiLienHe,
    "ngayDuyet": ngayDuyet,
    "modifiedDate": modifiedDate,
    "soTrang": soTrang,
    "soLanNopLuu": soLanNopLuu,
    "dungLuong": dungLuong,
    "status": status,
    "ghiChu": ghiChu,
    "tenCoQuan": tenCoQuan,
    "fileDinhKems": fileDinhKems,
  };
}

class FileDinhKem {
  FileDinhKem({
    this.tenFile,
    this.urlFile,
    this.ngayTao,
    this.kichThuocFile,
    this.dinhDangFile,
  });

  String tenFile;
  String urlFile;
  String ngayTao;
  String kichThuocFile;
  String dinhDangFile;

  factory FileDinhKem.fromJson(Map<String, dynamic> json) => FileDinhKem(
    tenFile: json["tenFile"],
    urlFile: json["urlFile"],
    ngayTao: json["ngayTao"],
    kichThuocFile: json["kichThuocFile"],
    dinhDangFile: json["dinhDangFile"],
  );

  Map<String, dynamic> toJson() => {
    "tenFile": tenFile,
    "urlFile": urlFile,
    "ngayTao": ngayTao,
    "kichThuocFile": kichThuocFile,
    "dinhDangFile": dinhDangFile,
  };
}

