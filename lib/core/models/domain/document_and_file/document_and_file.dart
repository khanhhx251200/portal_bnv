import 'package:app_mobile/core/models/domain/document_and_file/file_entry.dart';
import 'package:app_mobile/core/models/domain/document_and_file/folder_entry.dart';
import 'package:app_mobile/core/models/domain/user_create.dart';

class FolderAndFile {
  FolderAndFile({
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
    this.bpmnid,
    this.author,
    this.color,
    this.type,
    this.fileEntry,
    this.fileEntryId,
    this.folderEntry,
    this.folderEntryId,
    this.status,
    this.favorite,
    this.share,
    this.userCreate,
    this.isOcr,
    this.dateOcr,
    this.dateShare,
    this.treePath,
    this.isHide,
    this.typeBpmn,
    this.capacity,
    this.errorOcr,
    this.numberDocument,
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
  int bpmnid;
  dynamic author;
  String color;
  int type;
  FileEntry fileEntry;
  int fileEntryId;
  FolderEntry folderEntry;
  int folderEntryId;
  dynamic status;
  dynamic favorite;
  dynamic share;
  UserCreate userCreate;
  dynamic isOcr;
  dynamic dateOcr;
  dynamic dateShare;
  String treePath;
  bool isHide;
  String typeBpmn;
  dynamic capacity;
  dynamic errorOcr;
  dynamic numberDocument;

  factory FolderAndFile.fromJson(Map<String, dynamic> json) => FolderAndFile(
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
    bpmnid: json["bpmnid"] == null ? null : json["bpmnid"],
    author: json["author"],
    color: json["color"] == null ? null : json["color"],
    type: json["type"] == null ? null : json["type"],
    fileEntry: json["fileEntry"] == null ? null : FileEntry.fromJson(json["fileEntry"]),
    fileEntryId: json["fileEntryId"] == null ? null : json["fileEntryId"],
    folderEntry: json["folderEntry"] == null ? null : FolderEntry.fromJson(json["folderEntry"]),
    folderEntryId: json["folderEntryId"] == null ? null : json["folderEntryId"],
    status: json["status"],
    favorite: json["favorite"],
    share: json["share"],
    userCreate: json["userCreate"] == null ? null : UserCreate.fromJson(json["userCreate"]),
    isOcr: json["isOcr"],
    dateOcr: json["dateOcr"],
    dateShare: json["dateShare"],
    treePath: json["treePath"] == null ? null : json["treePath"],
    isHide: json["isHide"] == null ? null : json["isHide"],
    typeBpmn: json["typeBpmn"] == null ? null : json["typeBpmn"],
    capacity: json["capacity"],
    errorOcr: json["errorOcr"],
    numberDocument: json["numberDocument"],
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
    "bpmnid": bpmnid == null ? null : bpmnid,
    "author": author,
    "color": color == null ? null : color,
    "type": type == null ? null : type,
    "fileEntry": fileEntry == null ? null : fileEntry.toJson(),
    "fileEntryId": fileEntryId == null ? null : fileEntryId,
    "folderEntry": folderEntry == null ? null : folderEntry.toJson(),
    "folderEntryId": folderEntryId == null ? null : folderEntryId,
    "status": status,
    "favorite": favorite,
    "share": share,
    "userCreate": userCreate == null ? null : userCreate.toJson(),
    "isOcr": isOcr,
    "dateOcr": dateOcr,
    "dateShare": dateShare,
    "treePath": treePath == null ? null : treePath,
    "isHide": isHide == null ? null : isHide,
    "typeBpmn": typeBpmn == null ? null : typeBpmn,
    "capacity": capacity,
    "errorOcr": errorOcr,
    "numberDocument": numberDocument,
  };
}