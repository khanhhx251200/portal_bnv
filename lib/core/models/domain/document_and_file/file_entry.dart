class FileEntry {
  FileEntry({
    this.id,
    this.active,
    this.createDate,
    this.updateDate,
    this.createBy,
    this.updateBy,
    this.clientId,
    this.name,
    this.userName,
    this.title,
    this.description,
    this.extension,
    this.minetype,
    this.fileId,
    this.folderId,
    this.luongId,
    this.isHidden,
    this.size,
    this.viewcount,
    this.favorite,
    this.isSign,
    this.checkOcr,
    this.share,
    this.treePath,
    this.shareDate,
    this.idUserShare,
    this.dateShareFile,
    this.contentType,
    this.isPdf2,
    this.listFileVersion,
    this.typeBpmn,
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
  dynamic userName;
  String title;
  String description;
  String extension;
  dynamic minetype;
  String fileId;
  String folderId;
  dynamic luongId;
  bool isHidden;
  int size;
  int viewcount;
  dynamic favorite;
  bool isSign;
  dynamic checkOcr;
  dynamic share;
  String treePath;
  dynamic shareDate;
  dynamic idUserShare;
  dynamic dateShareFile;
  dynamic contentType;
  dynamic isPdf2;
  List<dynamic> listFileVersion;
  dynamic typeBpmn;
  dynamic codeShare;

  factory FileEntry.fromJson(Map<String, dynamic> json) => FileEntry(
    id: json["id"] == null ? null : json["id"],
    active: json["active"] == null ? null : json["active"],
    createDate: json["createDate"] == null ? null : json["createDate"],
    updateDate: json["updateDate"] == null ? null : json["updateDate"],
    createBy: json["createBy"] == null ? null : json["createBy"],
    updateBy: json["updateBy"] == null ? null : json["updateBy"],
    clientId: json["clientId"] == null ? null : json["clientId"],
    name: json["name"] == null ? null : json["name"],
    userName: json["userName"],
    title: json["title"] == null ? null : json["title"],
    description: json["description"] == null ? null : json["description"],
    extension: json["extension"] == null ? null : json["extension"],
    minetype: json["minetype"],
    fileId: json["fileId"] == null ? null : json["fileId"],
    folderId: json["folderId"] == null ? null : json["folderId"],
    luongId: json["luongId"],
    isHidden: json["isHidden"] == null ? null : json["isHidden"],
    size: json["size"] == null ? null : json["size"],
    viewcount: json["viewcount"] == null ? null : json["viewcount"],
    favorite: json["favorite"],
    isSign: json["isSign"] == null ? null : json["isSign"],
    checkOcr: json["checkOcr"],
    share: json["share"],
    treePath: json["treePath"] == null ? null : json["treePath"],
    shareDate: json["shareDate"],
    idUserShare: json["idUserShare"],
    dateShareFile: json["dateShareFile"],
    contentType: json["contentType"],
    isPdf2: json["isPDF2"],
    listFileVersion: json["listFileVersion"] == null ? null : List<dynamic>.from(json["listFileVersion"].map((x) => x)),
    typeBpmn: json["typeBpmn"],
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
    "userName": userName,
    "title": title == null ? null : title,
    "description": description == null ? null : description,
    "extension": extension == null ? null : extension,
    "minetype": minetype,
    "fileId": fileId == null ? null : fileId,
    "folderId": folderId == null ? null : folderId,
    "luongId": luongId,
    "isHidden": isHidden == null ? null : isHidden,
    "size": size == null ? null : size,
    "viewcount": viewcount == null ? null : viewcount,
    "favorite": favorite,
    "isSign": isSign == null ? null : isSign,
    "checkOcr": checkOcr,
    "share": share,
    "treePath": treePath == null ? null : treePath,
    "shareDate": shareDate,
    "idUserShare": idUserShare,
    "dateShareFile": dateShareFile,
    "contentType": contentType,
    "isPDF2": isPdf2,
    "listFileVersion": listFileVersion == null ? null : List<dynamic>.from(listFileVersion.map((x) => x)),
    "typeBpmn": typeBpmn,
    "codeShare": codeShare,
  };
}
