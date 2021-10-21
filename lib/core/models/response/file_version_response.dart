/// resultCode : 200
/// message : "Success"
/// responseTime : 1632711608381
/// data : [{"id":4592,"active":true,"createDate":1632451744673,"updateDate":1632451744673,"createBy":1,"updateBy":1,"clientId":1,"name":null,"nodeId":"9cf41648-0a2e-420a-8360-0823edfd57c9","versionNumber":10,"userName":"Administrator","fileEntryId":9964}]

class FileVersionResponse {
  FileVersionResponse({
    int resultCode,
    String message,
    int responseTime,
    List<FileVersion> data,}){
    _resultCode = resultCode;
    _message = message;
    _responseTime = responseTime;
    _data = data;
  }

  FileVersionResponse.fromJson(dynamic json) {
    _resultCode = json['resultCode'];
    _message = json['message'];
    _responseTime = json['responseTime'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data.add(FileVersion.fromJson(v));
      });
    }
  }
  int _resultCode;
  String _message;
  int _responseTime;
  List<FileVersion> _data;

  int get resultCode => _resultCode;
  String get message => _message;
  int get responseTime => _responseTime;
  List<FileVersion> get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['resultCode'] = _resultCode;
    map['message'] = _message;
    map['responseTime'] = _responseTime;
    if (_data != null) {
      map['data'] = _data.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 4592
/// active : true
/// createDate : 1632451744673
/// updateDate : 1632451744673
/// createBy : 1
/// updateBy : 1
/// clientId : 1
/// name : null
/// nodeId : "9cf41648-0a2e-420a-8360-0823edfd57c9"
/// versionNumber : 10
/// userName : "Administrator"
/// fileEntryId : 9964

class FileVersion {
  FileVersion({
    int id,
    bool active,
    int createDate,
    int updateDate,
    int createBy,
    int updateBy,
    int clientId,
    dynamic name,
    String nodeId,
    int versionNumber,
    String userName,
    int fileEntryId,}){
    _id = id;
    _active = active;
    _createDate = createDate;
    _updateDate = updateDate;
    _createBy = createBy;
    _updateBy = updateBy;
    _clientId = clientId;
    _name = name;
    _nodeId = nodeId;
    _versionNumber = versionNumber;
    _userName = userName;
    _fileEntryId = fileEntryId;
  }

  FileVersion.fromJson(dynamic json) {
    _id = json['id'];
    _active = json['active'];
    _createDate = json['createDate'];
    _updateDate = json['updateDate'];
    _createBy = json['createBy'];
    _updateBy = json['updateBy'];
    _clientId = json['clientId'];
    _name = json['name'];
    _nodeId = json['nodeId'];
    _versionNumber = json['versionNumber'];
    _userName = json['userName'];
    _fileEntryId = json['fileEntryId'];
  }
  int _id;
  bool _active;
  int _createDate;
  int _updateDate;
  int _createBy;
  int _updateBy;
  int _clientId;
  dynamic _name;
  String _nodeId;
  int _versionNumber;
  String _userName;
  int _fileEntryId;

  int get id => _id;
  bool get active => _active;
  int get createDate => _createDate;
  int get updateDate => _updateDate;
  int get createBy => _createBy;
  int get updateBy => _updateBy;
  int get clientId => _clientId;
  dynamic get name => _name;
  String get nodeId => _nodeId;
  int get versionNumber => _versionNumber;
  String get userName => _userName;
  int get fileEntryId => _fileEntryId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['active'] = _active;
    map['createDate'] = _createDate;
    map['updateDate'] = _updateDate;
    map['createBy'] = _createBy;
    map['updateBy'] = _updateBy;
    map['clientId'] = _clientId;
    map['name'] = _name;
    map['nodeId'] = _nodeId;
    map['versionNumber'] = _versionNumber;
    map['userName'] = _userName;
    map['fileEntryId'] = _fileEntryId;
    return map;
  }

}