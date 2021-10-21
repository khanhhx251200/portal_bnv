import 'package:app_mobile/core/models/domain/model.dart';
import 'package:app_mobile/core/models/domain/org_model.dart';

class UserCreate {
  UserCreate({
    this.id,
    this.active,
    this.clientId,
    this.fullName,
    this.userName,
    this.birthday,
    this.email,
    this.phone,
    this.gender,
    this.indentity,
    this.title,
    this.photo,
    this.signature,
    this.phoneCa,
    this.phoneCaProvider,
    this.serialToken,
    this.employeeId,
    this.employeeCode,
    this.lastLogin,
    this.nameToken,
    this.orgToken,
    this.startTimeToken,
    this.expiredTimeToken,
    this.roles,
    this.authorize,
    this.org,
    this.position,
    this.orgModel,
    this.groupId,
    this.group,
    this.positionModel,
    this.lead,
    this.defaultRole,
    this.currentRole,
    this.address,
    this.limitQuota,
    this.readers,
    this.limitTime,
    this.isDelete,
    this.dateOnGroup,
    this.ldap,
  });

  int id;
  bool active;
  int clientId;
  String fullName;
  String userName;
  dynamic birthday;
  String email;
  String phone;
  int gender;
  String indentity;
  dynamic title;
  dynamic photo;
  String signature;
  String phoneCa;
  String phoneCaProvider;
  dynamic serialToken;
  dynamic employeeId;
  dynamic employeeCode;
  int lastLogin;
  dynamic nameToken;
  dynamic orgToken;
  dynamic startTimeToken;
  dynamic expiredTimeToken;
  dynamic roles;
  dynamic authorize;
  int org;
  int position;
  OrgModel orgModel;
  dynamic groupId;
  dynamic group;
  Model positionModel;
  bool lead;
  int defaultRole;
  int currentRole;
  dynamic address;
  dynamic limitQuota;
  bool readers;
  dynamic limitTime;
  bool isDelete;
  dynamic dateOnGroup;
  bool ldap;

  factory UserCreate.fromJson(Map<String, dynamic> json) => UserCreate(
    id: json["id"] == null ? null : json["id"],
    active: json["active"] == null ? null : json["active"],
    clientId: json["clientId"] == null ? null : json["clientId"],
    fullName: json["fullName"] == null ? null : json["fullName"],
    userName: json["userName"] == null ? null : json["userName"],
    birthday: json["birthday"],
    email: json["email"] == null ? null : json["email"],
    phone: json["phone"] == null ? null : json["phone"],
    gender: json["gender"] == null ? null : json["gender"],
    indentity: json["indentity"] == null ? null : json["indentity"],
    title: json["title"],
    photo: json["photo"],
    signature: json["signature"] == null ? null : json["signature"],
    phoneCa: json["phoneCA"] == null ? null : json["phoneCA"],
    phoneCaProvider: json["phoneCAProvider"] == null ? null : json["phoneCAProvider"],
    serialToken: json["serialToken"],
    employeeId: json["employeeId"],
    employeeCode: json["employeeCode"],
    lastLogin: json["lastLogin"] == null ? null : json["lastLogin"],
    nameToken: json["nameToken"],
    orgToken: json["orgToken"],
    startTimeToken: json["startTimeToken"],
    expiredTimeToken: json["expiredTimeToken"],
    roles: json["roles"],
    authorize: json["authorize"],
    org: json["org"] == null ? null : json["org"],
    position: json["position"] == null ? null : json["position"],
    orgModel: json["orgModel"] == null ? null : OrgModel.fromJson(json["orgModel"]),
    groupId: json["groupId"],
    group: json["group"],
    positionModel: json["positionModel"] == null ? null : Model.fromJson(json["positionModel"]),
    lead: json["lead"] == null ? null : json["lead"],
    defaultRole: json["defaultRole"] == null ? null : json["defaultRole"],
    currentRole: json["currentRole"] == null ? null : json["currentRole"],
    address: json["address"],
    limitQuota: json["limitQuota"],
    readers: json["readers"] == null ? null : json["readers"],
    limitTime: json["limitTime"],
    isDelete: json["isDelete"] == null ? null : json["isDelete"],
    dateOnGroup: json["dateOnGroup"],
    ldap: json["ldap"] == null ? null : json["ldap"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "active": active == null ? null : active,
    "clientId": clientId == null ? null : clientId,
    "fullName": fullName == null ? null : fullName,
    "userName": userName == null ? null : userName,
    "birthday": birthday,
    "email": email == null ? null : email,
    "phone": phone == null ? null : phone,
    "gender": gender == null ? null : gender,
    "indentity": indentity == null ? null : indentity,
    "title": title,
    "photo": photo,
    "signature": signature == null ? null : signature,
    "phoneCA": phoneCa == null ? null : phoneCa,
    "phoneCAProvider": phoneCaProvider == null ? null : phoneCaProvider,
    "serialToken": serialToken,
    "employeeId": employeeId,
    "employeeCode": employeeCode,
    "lastLogin": lastLogin == null ? null : lastLogin,
    "nameToken": nameToken,
    "orgToken": orgToken,
    "startTimeToken": startTimeToken,
    "expiredTimeToken": expiredTimeToken,
    "roles": roles,
    "authorize": authorize,
    "org": org == null ? null : org,
    "position": position == null ? null : position,
    "orgModel": orgModel == null ? null : orgModel.toJson(),
    "groupId": groupId,
    "group": group,
    "positionModel": positionModel == null ? null : positionModel.toJson(),
    "lead": lead == null ? null : lead,
    "defaultRole": defaultRole == null ? null : defaultRole,
    "currentRole": currentRole == null ? null : currentRole,
    "address": address,
    "limitQuota": limitQuota,
    "readers": readers == null ? null : readers,
    "limitTime": limitTime,
    "isDelete": isDelete == null ? null : isDelete,
    "dateOnGroup": dateOnGroup,
    "ldap": ldap == null ? null : ldap,
  };
}
