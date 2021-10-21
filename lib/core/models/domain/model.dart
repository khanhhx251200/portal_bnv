class Model {
  Model({
    this.id,
    this.active,
    this.clientId,
    this.name,
    this.order,
    this.categoryTypeId,
    this.isDefault,
    this.code,
    this.parentId,
    this.syncCode,
    this.isLdap,
  });

  int id;
  bool active;
  int clientId;
  String name;
  int order;
  int categoryTypeId;
  dynamic isDefault;
  String code;
  dynamic parentId;
  dynamic syncCode;
  dynamic isLdap;

  factory Model.fromJson(Map<String, dynamic> json) => Model(
    id: json["id"] == null ? null : json["id"],
    active: json["active"] == null ? null : json["active"],
    clientId: json["clientId"] == null ? null : json["clientId"],
    name: json["name"] == null ? null : json["name"],
    order: json["order"] == null ? null : json["order"],
    categoryTypeId: json["categoryTypeId"] == null ? null : json["categoryTypeId"],
    isDefault: json["isDefault"],
    code: json["code"] == null ? null : json["code"],
    parentId: json["parentId"],
    syncCode: json["syncCode"],
    isLdap: json["isLdap"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "active": active == null ? null : active,
    "clientId": clientId == null ? null : clientId,
    "name": name == null ? null : name,
    "order": order == null ? null : order,
    "categoryTypeId": categoryTypeId == null ? null : categoryTypeId,
    "isDefault": isDefault,
    "code": code == null ? null : code,
    "parentId": parentId,
    "syncCode": syncCode,
    "isLdap": isLdap,
  };
}
