class FolderEntry {
  FolderEntry({
    this.id,
    this.active,
    this.createDate,
    this.updateDate,
    this.createBy,
    this.updateBy,
    this.clientId,
    this.name,
    this.title,
    this.description,
    this.nodeId,
    this.parentNodeId,
    this.isHidden,
    this.treePath,
    this.typeBpmn,
    this.children,
    this.codeShare,
  });

  int id;
  bool active;
  int createDate;
  int updateDate;
  int createBy;
  int updateBy;
  int clientId;
  String name;
  String title;
  String description;
  String nodeId;
  String parentNodeId;
  bool isHidden;
  String treePath;
  dynamic typeBpmn;
  dynamic children;
  dynamic codeShare;

  factory FolderEntry.fromJson(Map<String, dynamic> json) => FolderEntry(
    id: json["id"] == null ? null : json["id"],
    active: json["active"] == null ? null : json["active"],
    createDate: json["createDate"] == null ? null : json["createDate"],
    updateDate: json["updateDate"] == null ? null : json["updateDate"],
    createBy: json["createBy"] == null ? null : json["createBy"],
    updateBy: json["updateBy"] == null ? null : json["updateBy"],
    clientId: json["clientId"] == null ? null : json["clientId"],
    name: json["name"] == null ? null : json["name"],
    title: json["title"] == null ? null : json["title"],
    description: json["description"] == null ? null : json["description"],
    nodeId: json["nodeId"] == null ? null : json["nodeId"],
    parentNodeId: json["parentNodeId"] == null ? null : json["parentNodeId"],
    isHidden: json["isHidden"] == null ? null : json["isHidden"],
    treePath: json["treePath"] == null ? null : json["treePath"],
    typeBpmn: json["typeBpmn"],
    children: json["children"],
    codeShare: json["codeShare"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "active": active == null ? null : active,
    "createDate": createDate == null ? null : createDate,
    "updateDate": updateDate == null ? null : updateDate,
    "createBy": createBy == null ? null : createBy,
    "updateBy": updateBy == null ? null : updateBy,
    "clientId": clientId == null ? null : clientId,
    "name": name == null ? null : name,
    "title": title == null ? null : title,
    "description": description == null ? null : description,
    "nodeId": nodeId == null ? null : nodeId,
    "parentNodeId": parentNodeId == null ? null : parentNodeId,
    "isHidden": isHidden == null ? null : isHidden,
    "treePath": treePath == null ? null : treePath,
    "typeBpmn": typeBpmn,
    "children": children,
    "codeShare": codeShare,
  };
}
