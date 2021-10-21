import 'package:app_mobile/core/models/domain/model.dart';

class OrgModel {
  OrgModel({
    this.id,
    this.active,
    this.clientId,
    this.name,
    this.phone,
    this.address,
    this.level,
    this.parentId,
    this.email,
    this.shortcut,
    this.note,
    this.limitSize,
    this.orgType,
    this.orgTypeModel,
    this.expiryDate,
    this.idCat,
    this.rootId,
    this.order,
    this.isLdap,
    this.code,
    this.orgIdSync,
    this.orgCode,
  });

  int id;
  bool active;
  int clientId;
  String name;
  String phone;
  String address;
  int level;
  int parentId;
  String email;
  dynamic shortcut;
  dynamic note;
  int limitSize;
  int orgType;
  Model orgTypeModel;
  dynamic expiryDate;
  dynamic idCat;
  dynamic rootId;
  int order;
  dynamic isLdap;
  dynamic code;
  dynamic orgIdSync;
  String orgCode;

  factory OrgModel.fromJson(Map<String, dynamic> json) => OrgModel(
    id: json["id"] == null ? null : json["id"],
    active: json["active"] == null ? null : json["active"],
    clientId: json["clientId"] == null ? null : json["clientId"],
    name: json["name"] == null ? null : json["name"],
    phone: json["phone"] == null ? null : json["phone"],
    address: json["address"] == null ? null : json["address"],
    level: json["level"] == null ? null : json["level"],
    parentId: json["parentId"] == null ? null : json["parentId"],
    email: json["email"] == null ? null : json["email"],
    shortcut: json["shortcut"],
    note: json["note"],
    limitSize: json["limitSize"] == null ? null : json["limitSize"],
    orgType: json["orgType"] == null ? null : json["orgType"],
    orgTypeModel: json["orgTypeModel"] == null ? null : Model.fromJson(json["orgTypeModel"]),
    expiryDate: json["expiryDate"],
    idCat: json["idCat"],
    rootId: json["rootId"],
    order: json["order"] == null ? null : json["order"],
    isLdap: json["isLdap"],
    code: json["code"],
    orgIdSync: json["orgIdSync"],
    orgCode: json["orgCode"] == null ? null : json["orgCode"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "active": active == null ? null : active,
    "clientId": clientId == null ? null : clientId,
    "name": name == null ? null : name,
    "phone": phone == null ? null : phone,
    "address": address == null ? null : address,
    "level": level == null ? null : level,
    "parentId": parentId == null ? null : parentId,
    "email": email == null ? null : email,
    "shortcut": shortcut,
    "note": note,
    "limitSize": limitSize == null ? null : limitSize,
    "orgType": orgType == null ? null : orgType,
    "orgTypeModel": orgTypeModel == null ? null : orgTypeModel.toJson(),
    "expiryDate": expiryDate,
    "idCat": idCat,
    "rootId": rootId,
    "order": order == null ? null : order,
    "isLdap": isLdap,
    "code": code,
    "orgIdSync": orgIdSync,
    "orgCode": orgCode == null ? null : orgCode,
  };
}
