// To parse this JSON data, do
//
//     final propertiesResponse = propertiesResponseFromJson(jsonString);

import 'dart:convert';

PropertiesResponse propertiesResponseFromJson(String str) => PropertiesResponse.fromJson(json.decode(str));

String propertiesResponseToJson(PropertiesResponse data) => json.encode(data.toJson());

class PropertiesResponse {
  PropertiesResponse({
    this.resultCode,
    this.message,
    this.responseTime,
    this.data,
  });

  int resultCode;
  String message;
  int responseTime;
  Data data;

  factory PropertiesResponse.fromJson(Map<String, dynamic> json) => PropertiesResponse(
    resultCode: json["resultCode"] == null ? null : json["resultCode"],
    message: json["message"] == null ? null : json["message"],
    responseTime: json["responseTime"] == null ? null : json["responseTime"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "resultCode": resultCode == null ? null : resultCode,
    "message": message == null ? null : message,
    "responseTime": responseTime == null ? null : responseTime,
    "data": data == null ? null : data.toJson(),
  };
}

class Data {
  Data({
    this.metadata,
    this.item,
  });

  Metadata metadata;
  Item item;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    metadata: json["metadata"] == null ? null : Metadata.fromJson(json["metadata"]),
    item: json["item"] == null ? null : Item.fromJson(json["item"]),
  );

  Map<String, dynamic> toJson() => {
    "metadata": metadata == null ? null : metadata.toJson(),
    "item": item == null ? null : item.toJson(),
  };
}

class Item {
  Item({
    this.node,
    this.parent,
    this.version,
    this.webdavUrl,
    this.isFavourite,
    this.likes,
    this.location,
  });

  Node node;
  ItemParent parent;
  String version;
  String webdavUrl;
  bool isFavourite;
  Likes likes;
  Location location;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    node: json["node"] == null ? null : Node.fromJson(json["node"]),
    parent: json["parent"] == null ? null : ItemParent.fromJson(json["parent"]),
    version: json["version"] == null ? null : json["version"],
    webdavUrl: json["webdavUrl"] == null ? null : json["webdavUrl"],
    isFavourite: json["isFavourite"] == null ? null : json["isFavourite"],
    likes: json["likes"] == null ? null : Likes.fromJson(json["likes"]),
    location: json["location"] == null ? null : Location.fromJson(json["location"]),
  );

  Map<String, dynamic> toJson() => {
    "node": node == null ? null : node.toJson(),
    "parent": parent == null ? null : parent.toJson(),
    "version": version == null ? null : version,
    "webdavUrl": webdavUrl == null ? null : webdavUrl,
    "isFavourite": isFavourite == null ? null : isFavourite,
    "likes": likes == null ? null : likes.toJson(),
    "location": location == null ? null : location.toJson(),
  };
}

class Likes {
  Likes({
    this.isLiked,
    this.totalLikes,
  });

  bool isLiked;
  int totalLikes;

  factory Likes.fromJson(Map<String, dynamic> json) => Likes(
    isLiked: json["isLiked"] == null ? null : json["isLiked"],
    totalLikes: json["totalLikes"] == null ? null : json["totalLikes"],
  );

  Map<String, dynamic> toJson() => {
    "isLiked": isLiked == null ? null : isLiked,
    "totalLikes": totalLikes == null ? null : totalLikes,
  };
}

class Location {
  Location({
    this.repositoryId,
    this.path,
    this.repoPath,
    this.file,
    this.parent,
  });

  String repositoryId;
  String path;
  String repoPath;
  String file;
  LocationParent parent;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    repositoryId: json["repositoryId"] == null ? null : json["repositoryId"],
    path: json["path"] == null ? null : json["path"],
    repoPath: json["repoPath"] == null ? null : json["repoPath"],
    file: json["file"] == null ? null : json["file"],
    parent: json["parent"] == null ? null : LocationParent.fromJson(json["parent"]),
  );

  Map<String, dynamic> toJson() => {
    "repositoryId": repositoryId == null ? null : repositoryId,
    "path": path == null ? null : path,
    "repoPath": repoPath == null ? null : repoPath,
    "file": file == null ? null : file,
    "parent": parent == null ? null : parent.toJson(),
  };
}

class LocationParent {
  LocationParent();

  factory LocationParent.fromJson(Map<String, dynamic> json) => LocationParent(
  );

  Map<String, dynamic> toJson() => {
  };
}

class Node {
  Node({
    this.isLink,
    this.aspects,
    this.isContainer,
    this.type,
    this.encoding,
    this.contentUrl,
    this.size,
    this.nodeRef,
    this.permissions,
    this.isLocked,
    this.mimetype,
    this.properties,
    this.mimetypeDisplayName,
  });

  bool isLink;
  List<String> aspects;
  bool isContainer;
  String type;
  String encoding;
  String contentUrl;
  int size;
  String nodeRef;
  Permissions permissions;
  bool isLocked;
  String mimetype;
  NodeProperties properties;
  String mimetypeDisplayName;

  factory Node.fromJson(Map<String, dynamic> json) => Node(
    isLink: json["isLink"] == null ? null : json["isLink"],
    aspects: json["aspects"] == null ? null : List<String>.from(json["aspects"].map((x) => x)),
    isContainer: json["isContainer"] == null ? null : json["isContainer"],
    type: json["type"] == null ? null : json["type"],
    encoding: json["encoding"] == null ? null : json["encoding"],
    contentUrl: json["contentURL"] == null ? null : json["contentURL"],
    size: json["size"] == null ? null : json["size"],
    nodeRef: json["nodeRef"] == null ? null : json["nodeRef"],
    permissions: json["permissions"] == null ? null : Permissions.fromJson(json["permissions"]),
    isLocked: json["isLocked"] == null ? null : json["isLocked"],
    mimetype: json["mimetype"] == null ? null : json["mimetype"],
    properties: json["properties"] == null ? null : NodeProperties.fromJson(json["properties"]),
    mimetypeDisplayName: json["mimetypeDisplayName"] == null ? null : json["mimetypeDisplayName"],
  );

  Map<String, dynamic> toJson() => {
    "isLink": isLink == null ? null : isLink,
    "aspects": aspects == null ? null : List<dynamic>.from(aspects.map((x) => x)),
    "isContainer": isContainer == null ? null : isContainer,
    "type": type == null ? null : type,
    "encoding": encoding == null ? null : encoding,
    "contentURL": contentUrl == null ? null : contentUrl,
    "size": size == null ? 0 : size,
    "nodeRef": nodeRef == null ? null : nodeRef,
    "permissions": permissions == null ? null : permissions.toJson(),
    "isLocked": isLocked == null ? null : isLocked,
    "mimetype": mimetype == null ? null : mimetype,
    "properties": properties == null ? null : properties.toJson(),
    "mimetypeDisplayName": mimetypeDisplayName == null ? null : mimetypeDisplayName,
  };
}

class Permissions {
  Permissions({
    this.inherited,
    this.roles,
    this.user,
  });

  bool inherited;
  List<String> roles;
  User user;

  factory Permissions.fromJson(Map<String, dynamic> json) => Permissions(
    inherited: json["inherited"] == null ? null : json["inherited"],
    roles: json["roles"] == null ? null : List<String>.from(json["roles"].map((x) => x)),
    user: json["user"] == null ? null : User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "inherited": inherited == null ? null : inherited,
    "roles": roles == null ? null : List<dynamic>.from(roles.map((x) => x)),
    "user": user == null ? null : user.toJson(),
  };
}

class User {
  User({
    this.delete,
    this.write,
    this.cancelCheckOut,
    this.changePermissions,
    this.createChildren,
    this.unlock,
  });

  bool delete;
  bool write;
  bool cancelCheckOut;
  bool changePermissions;
  bool createChildren;
  bool unlock;

  factory User.fromJson(Map<String, dynamic> json) => User(
    delete: json["Delete"] == null ? null : json["Delete"],
    write: json["Write"] == null ? null : json["Write"],
    cancelCheckOut: json["CancelCheckOut"] == null ? null : json["CancelCheckOut"],
    changePermissions: json["ChangePermissions"] == null ? null : json["ChangePermissions"],
    createChildren: json["CreateChildren"] == null ? null : json["CreateChildren"],
    unlock: json["Unlock"] == null ? null : json["Unlock"],
  );

  Map<String, dynamic> toJson() => {
    "Delete": delete == null ? null : delete,
    "Write": write == null ? null : write,
    "CancelCheckOut": cancelCheckOut == null ? null : cancelCheckOut,
    "ChangePermissions": changePermissions == null ? null : changePermissions,
    "CreateChildren": createChildren == null ? null : createChildren,
    "Unlock": unlock == null ? null : unlock,
  };
}

class NodeProperties {
  NodeProperties({
    this.cmCreator,
    this.cmAutoVersion,
    this.cmTitle,
    this.cmModifier,
    this.cmVersionType,
    this.cmCreated,
    this.cmVersionLabel,
    this.cmAutoVersionOnUpdateProps,
    this.sysStoreProtocol,
    this.sysStoreIdentifier,
    this.cmContent,
    this.cmLastThumbnailModification,
    this.cmDescription,
    this.sysNodeUuid,
    this.cmName,
    this.sysNodeDbid,
    this.cmInitialVersion,
    this.sysLocale,
    this.cmModified,
  });

  CmCreatorClass cmCreator;
  String cmAutoVersion;
  String cmTitle;
  CmCreatorClass cmModifier;
  String cmVersionType;
  CmCreatedClass cmCreated;
  String cmVersionLabel;
  String cmAutoVersionOnUpdateProps;
  dynamic sysStoreProtocol;
  dynamic sysStoreIdentifier;
  dynamic cmContent;
  List<String> cmLastThumbnailModification;
  String cmDescription;
  dynamic sysNodeUuid;
  String cmName;
  dynamic sysNodeDbid;
  String cmInitialVersion;
  dynamic sysLocale;
  CmCreatedClass cmModified;

  factory NodeProperties.fromJson(Map<String, dynamic> json) => NodeProperties(
    cmCreator: json["cm:creator"] == null ? null : CmCreatorClass.fromJson(json["cm:creator"]),
    cmAutoVersion: json["cm:autoVersion"] == null ? null : json["cm:autoVersion"],
    cmTitle: json["cm:title"] == null ? null : json["cm:title"],
    cmModifier: json["cm:modifier"] == null ? null : CmCreatorClass.fromJson(json["cm:modifier"]),
    cmVersionType: json["cm:versionType"] == null ? null : json["cm:versionType"],
    cmCreated: json["cm:created"] == null ? null : CmCreatedClass.fromJson(json["cm:created"]),
    cmVersionLabel: json["cm:versionLabel"] == null ? null : json["cm:versionLabel"],
    cmAutoVersionOnUpdateProps: json["cm:autoVersionOnUpdateProps"] == null ? null : json["cm:autoVersionOnUpdateProps"],
    sysStoreProtocol: json["sys:store-protocol"],
    sysStoreIdentifier: json["sys:store-identifier"],
    cmContent: json["cm:content"],
    cmLastThumbnailModification: json["cm:lastThumbnailModification"] == null ? null : List<String>.from(json["cm:lastThumbnailModification"].map((x) => x)),
    cmDescription: json["cm:description"] == null ? null : json["cm:description"],
    sysNodeUuid: json["sys:node-uuid"],
    cmName: json["cm:name"] == null ? null : json["cm:name"],
    sysNodeDbid: json["sys:node-dbid"],
    cmInitialVersion: json["cm:initialVersion"] == null ? null : json["cm:initialVersion"],
    sysLocale: json["sys:locale"],
    cmModified: json["cm:modified"] == null ? null : CmCreatedClass.fromJson(json["cm:modified"]),
  );

  Map<String, dynamic> toJson() => {
    "cm:creator": cmCreator == null ? null : cmCreator.toJson(),
    "cm:autoVersion": cmAutoVersion == null ? null : cmAutoVersion,
    "cm:title": cmTitle == null ? null : cmTitle,
    "cm:modifier": cmModifier == null ? null : cmModifier.toJson(),
    "cm:versionType": cmVersionType == null ? null : cmVersionType,
    "cm:created": cmCreated == null ? null : cmCreated.toJson(),
    "cm:versionLabel": cmVersionLabel == null ? null : cmVersionLabel,
    "cm:autoVersionOnUpdateProps": cmAutoVersionOnUpdateProps == null ? null : cmAutoVersionOnUpdateProps,
    "sys:store-protocol": sysStoreProtocol,
    "sys:store-identifier": sysStoreIdentifier,
    "cm:content": cmContent,
    "cm:lastThumbnailModification": cmLastThumbnailModification == null ? null : List<dynamic>.from(cmLastThumbnailModification.map((x) => x)),
    "cm:description": cmDescription == null ? null : cmDescription,
    "sys:node-uuid": sysNodeUuid,
    "cm:name": cmName == null ? null : cmName,
    "sys:node-dbid": sysNodeDbid,
    "cm:initialVersion": cmInitialVersion == null ? null : cmInitialVersion,
    "sys:locale": sysLocale,
    "cm:modified": cmModified == null ? null : cmModified.toJson(),
  };
}

class CmCreatedClass {
  CmCreatedClass({
    this.iso8601,
    this.value,
  });

  DateTime iso8601;
  String value;

  factory CmCreatedClass.fromJson(Map<String, dynamic> json) => CmCreatedClass(
    iso8601: json["iso8601"] == null ? null : DateTime.parse(json["iso8601"]),
    value: json["value"] == null ? null : json["value"],
  );

  Map<String, dynamic> toJson() => {
    "iso8601": iso8601 == null ? null : iso8601.toIso8601String(),
    "value": value == null ? null : value,
  };
}

class CmCreatorClass {
  CmCreatorClass({
    this.firstName,
    this.lastName,
    this.displayName,
    this.userName,
  });

  String firstName;
  String lastName;
  String displayName;
  String userName;

  factory CmCreatorClass.fromJson(Map<String, dynamic> json) => CmCreatorClass(
    firstName: json["firstName"] == null ? null : json["firstName"],
    lastName: json["lastName"] == null ? null : json["lastName"],
    displayName: json["displayName"] == null ? null : json["displayName"],
    userName: json["userName"] == null ? null : json["userName"],
  );

  Map<String, dynamic> toJson() => {
    "firstName": firstName == null ? null : firstName,
    "lastName": lastName == null ? null : lastName,
    "displayName": displayName == null ? null : displayName,
    "userName": userName == null ? null : userName,
  };
}

class ItemParent {
  ItemParent({
    this.isLink,
    this.nodeRef,
    this.permissions,
    this.isLocked,
    this.aspects,
    this.isContainer,
    this.type,
    this.properties,
  });

  bool isLink;
  String nodeRef;
  Permissions permissions;
  bool isLocked;
  List<String> aspects;
  bool isContainer;
  String type;
  ParentProperties properties;

  factory ItemParent.fromJson(Map<String, dynamic> json) => ItemParent(
    isLink: json["isLink"] == null ? null : json["isLink"],
    nodeRef: json["nodeRef"] == null ? null : json["nodeRef"],
    permissions: json["permissions"] == null ? null : Permissions.fromJson(json["permissions"]),
    isLocked: json["isLocked"] == null ? null : json["isLocked"],
    aspects: json["aspects"] == null ? null : List<String>.from(json["aspects"].map((x) => x)),
    isContainer: json["isContainer"] == null ? null : json["isContainer"],
    type: json["type"] == null ? null : json["type"],
    properties: json["properties"] == null ? null : ParentProperties.fromJson(json["properties"]),
  );

  Map<String, dynamic> toJson() => {
    "isLink": isLink == null ? null : isLink,
    "nodeRef": nodeRef == null ? null : nodeRef,
    "permissions": permissions == null ? null : permissions.toJson(),
    "isLocked": isLocked == null ? null : isLocked,
    "aspects": aspects == null ? null : List<dynamic>.from(aspects.map((x) => x)),
    "isContainer": isContainer == null ? null : isContainer,
    "type": type == null ? null : type,
    "properties": properties == null ? null : properties.toJson(),
  };
}

class ParentProperties {
  ParentProperties({
    this.cmTitle,
    this.cmCreator,
    this.cmModifier,
    this.cmCreated,
    this.cmName,
    this.sysStoreProtocol,
    this.sysNodeDbid,
    this.sysStoreIdentifier,
    this.sysLocale,
    this.cmModified,
    this.cmDescription,
    this.sysNodeUuid,
  });

  String cmTitle;
  CmCreatorClass cmCreator;
  CmCreatorClass cmModifier;
  CmCreatedClass cmCreated;
  String cmName;
  dynamic sysStoreProtocol;
  dynamic sysNodeDbid;
  dynamic sysStoreIdentifier;
  dynamic sysLocale;
  CmCreatedClass cmModified;
  String cmDescription;
  dynamic sysNodeUuid;

  factory ParentProperties.fromJson(Map<String, dynamic> json) => ParentProperties(
    cmTitle: json["cm:title"] == null ? null : json["cm:title"],
    cmCreator: json["cm:creator"] == null ? null : CmCreatorClass.fromJson(json["cm:creator"]),
    cmModifier: json["cm:modifier"] == null ? null : CmCreatorClass.fromJson(json["cm:modifier"]),
    cmCreated: json["cm:created"] == null ? null : CmCreatedClass.fromJson(json["cm:created"]),
    cmName: json["cm:name"] == null ? null : json["cm:name"],
    sysStoreProtocol: json["sys:store-protocol"],
    sysNodeDbid: json["sys:node-dbid"],
    sysStoreIdentifier: json["sys:store-identifier"],
    sysLocale: json["sys:locale"],
    cmModified: json["cm:modified"] == null ? null : CmCreatedClass.fromJson(json["cm:modified"]),
    cmDescription: json["cm:description"] == null ? null : json["cm:description"],
    sysNodeUuid: json["sys:node-uuid"],
  );

  Map<String, dynamic> toJson() => {
    "cm:title": cmTitle == null ? null : cmTitle,
    "cm:creator": cmCreator == null ? null : cmCreator.toJson(),
    "cm:modifier": cmModifier == null ? null : cmModifier.toJson(),
    "cm:created": cmCreated == null ? null : cmCreated.toJson(),
    "cm:name": cmName == null ? null : cmName,
    "sys:store-protocol": sysStoreProtocol,
    "sys:node-dbid": sysNodeDbid,
    "sys:store-identifier": sysStoreIdentifier,
    "sys:locale": sysLocale,
    "cm:modified": cmModified == null ? null : cmModified.toJson(),
    "cm:description": cmDescription == null ? null : cmDescription,
    "sys:node-uuid": sysNodeUuid,
  };
}

class Metadata {
  Metadata({
    this.repositoryId,
    this.custom,
    this.onlineEditing,
    this.workingCopyLabel,
    this.shareUrl,
    this.serverUrl,
  });

  String repositoryId;
  Custom custom;
  bool onlineEditing;
  String workingCopyLabel;
  String shareUrl;
  String serverUrl;

  factory Metadata.fromJson(Map<String, dynamic> json) => Metadata(
    repositoryId: json["repositoryId"] == null ? null : json["repositoryId"],
    custom: json["custom"] == null ? null : Custom.fromJson(json["custom"]),
    onlineEditing: json["onlineEditing"] == null ? null : json["onlineEditing"],
    workingCopyLabel: json["workingCopyLabel"] == null ? null : json["workingCopyLabel"],
    shareUrl: json["shareURL"] == null ? null : json["shareURL"],
    serverUrl: json["serverURL"] == null ? null : json["serverURL"],
  );

  Map<String, dynamic> toJson() => {
    "repositoryId": repositoryId == null ? null : repositoryId,
    "custom": custom == null ? null : custom.toJson(),
    "onlineEditing": onlineEditing == null ? null : onlineEditing,
    "workingCopyLabel": workingCopyLabel == null ? null : workingCopyLabel,
    "shareURL": shareUrl == null ? null : shareUrl,
    "serverURL": serverUrl == null ? null : serverUrl,
  };
}

class Custom {
  Custom({
    this.googledocs,
    this.aos,
    this.vtiServer,
  });

  Googledocs googledocs;
  Aos aos;
  dynamic vtiServer;

  factory Custom.fromJson(Map<String, dynamic> json) => Custom(
    googledocs: json["googledocs"] == null ? null : Googledocs.fromJson(json["googledocs"]),
    aos: json["aos"] == null ? null : Aos.fromJson(json["aos"]),
    vtiServer: json["vtiServer"],
  );

  Map<String, dynamic> toJson() => {
    "googledocs": googledocs == null ? null : googledocs.toJson(),
    "aos": aos == null ? null : aos.toJson(),
    "vtiServer": vtiServer,
  };
}

class Aos {
  Aos({
    this.baseUrl,
  });

  String baseUrl;

  factory Aos.fromJson(Map<String, dynamic> json) => Aos(
    baseUrl: json["baseUrl"] == null ? null : json["baseUrl"],
  );

  Map<String, dynamic> toJson() => {
    "baseUrl": baseUrl == null ? null : baseUrl,
  };
}

class Googledocs {
  Googledocs({
    this.enabled,
    this.importFormats,
  });

  bool enabled;
  ImportFormats importFormats;

  factory Googledocs.fromJson(Map<String, dynamic> json) => Googledocs(
    enabled: json["enabled"] == null ? null : json["enabled"],
    importFormats: json["importFormats"] == null ? null : ImportFormats.fromJson(json["importFormats"]),
  );

  Map<String, dynamic> toJson() => {
    "enabled": enabled == null ? null : enabled,
    "importFormats": importFormats == null ? null : importFormats.toJson(),
  };
}

class ImportFormats {
  ImportFormats({
    this.applicationVndOpenxmlformatsOfficedocumentPresentationmlPresentation,
    this.applicationVndMsPowerpoint,
    this.textTabSeparatedValues,
    this.applicationVndSunXmlWriter,
    this.applicationVndMsExcel,
    this.applicationVndOpenxmlformatsOfficedocumentSpreadsheetmlSheet,
    this.applicationRtf,
    this.applicationMsword,
    this.applicationVndOasisOpendocumentText,
    this.textPlain,
    this.textCsv,
    this.textRtf,
    this.applicationXVndOasisOpendocumentSpreadsheet,
    this.applicationVndOasisOpendocumentSpreadsheet,
    this.applicationVndOpenxmlformatsOfficedocumentWordprocessingmlDocument,
  });

  String applicationVndOpenxmlformatsOfficedocumentPresentationmlPresentation;
  String applicationVndMsPowerpoint;
  String textTabSeparatedValues;
  String applicationVndSunXmlWriter;
  String applicationVndMsExcel;
  String applicationVndOpenxmlformatsOfficedocumentSpreadsheetmlSheet;
  String applicationRtf;
  String applicationMsword;
  String applicationVndOasisOpendocumentText;
  String textPlain;
  String textCsv;
  String textRtf;
  String applicationXVndOasisOpendocumentSpreadsheet;
  String applicationVndOasisOpendocumentSpreadsheet;
  String applicationVndOpenxmlformatsOfficedocumentWordprocessingmlDocument;

  factory ImportFormats.fromJson(Map<String, dynamic> json) => ImportFormats(
    applicationVndOpenxmlformatsOfficedocumentPresentationmlPresentation: json["application/vnd.openxmlformats-officedocument.presentationml.presentation"] == null ? null : json["application/vnd.openxmlformats-officedocument.presentationml.presentation"],
    applicationVndMsPowerpoint: json["application/vnd.ms-powerpoint"] == null ? null : json["application/vnd.ms-powerpoint"],
    textTabSeparatedValues: json["text/tab-separated-values"] == null ? null : json["text/tab-separated-values"],
    applicationVndSunXmlWriter: json["application/vnd.sun.xml.writer"] == null ? null : json["application/vnd.sun.xml.writer"],
    applicationVndMsExcel: json["application/vnd.ms-excel"] == null ? null : json["application/vnd.ms-excel"],
    applicationVndOpenxmlformatsOfficedocumentSpreadsheetmlSheet: json["application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"] == null ? null : json["application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"],
    applicationRtf: json["application/rtf"] == null ? null : json["application/rtf"],
    applicationMsword: json["application/msword"] == null ? null : json["application/msword"],
    applicationVndOasisOpendocumentText: json["application/vnd.oasis.opendocument.text"] == null ? null : json["application/vnd.oasis.opendocument.text"],
    textPlain: json["text/plain"] == null ? null : json["text/plain"],
    textCsv: json["text/csv"] == null ? null : json["text/csv"],
    textRtf: json["text/rtf"] == null ? null : json["text/rtf"],
    applicationXVndOasisOpendocumentSpreadsheet: json["application/x-vnd.oasis.opendocument.spreadsheet"] == null ? null : json["application/x-vnd.oasis.opendocument.spreadsheet"],
    applicationVndOasisOpendocumentSpreadsheet: json["application/vnd.oasis.opendocument.spreadsheet"] == null ? null : json["application/vnd.oasis.opendocument.spreadsheet"],
    applicationVndOpenxmlformatsOfficedocumentWordprocessingmlDocument: json["application/vnd.openxmlformats-officedocument.wordprocessingml.document"] == null ? null : json["application/vnd.openxmlformats-officedocument.wordprocessingml.document"],
  );

  Map<String, dynamic> toJson() => {
    "application/vnd.openxmlformats-officedocument.presentationml.presentation": applicationVndOpenxmlformatsOfficedocumentPresentationmlPresentation == null ? null : applicationVndOpenxmlformatsOfficedocumentPresentationmlPresentation,
    "application/vnd.ms-powerpoint": applicationVndMsPowerpoint == null ? null : applicationVndMsPowerpoint,
    "text/tab-separated-values": textTabSeparatedValues == null ? null : textTabSeparatedValues,
    "application/vnd.sun.xml.writer": applicationVndSunXmlWriter == null ? null : applicationVndSunXmlWriter,
    "application/vnd.ms-excel": applicationVndMsExcel == null ? null : applicationVndMsExcel,
    "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet": applicationVndOpenxmlformatsOfficedocumentSpreadsheetmlSheet == null ? null : applicationVndOpenxmlformatsOfficedocumentSpreadsheetmlSheet,
    "application/rtf": applicationRtf == null ? null : applicationRtf,
    "application/msword": applicationMsword == null ? null : applicationMsword,
    "application/vnd.oasis.opendocument.text": applicationVndOasisOpendocumentText == null ? null : applicationVndOasisOpendocumentText,
    "text/plain": textPlain == null ? null : textPlain,
    "text/csv": textCsv == null ? null : textCsv,
    "text/rtf": textRtf == null ? null : textRtf,
    "application/x-vnd.oasis.opendocument.spreadsheet": applicationXVndOasisOpendocumentSpreadsheet == null ? null : applicationXVndOasisOpendocumentSpreadsheet,
    "application/vnd.oasis.opendocument.spreadsheet": applicationVndOasisOpendocumentSpreadsheet == null ? null : applicationVndOasisOpendocumentSpreadsheet,
    "application/vnd.openxmlformats-officedocument.wordprocessingml.document": applicationVndOpenxmlformatsOfficedocumentWordprocessingmlDocument == null ? null : applicationVndOpenxmlformatsOfficedocumentWordprocessingmlDocument,
  };
}
