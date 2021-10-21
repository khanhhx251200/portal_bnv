import 'dart:convert';

import 'package:app_mobile/core/api/document_and_file_api.dart';
import 'package:app_mobile/core/models/domain/document_and_file/document_and_file.dart';
import 'package:flutter/material.dart';

enum EventLoadingStatus { NotLoaded, Loading, Loaded }

class FolderAndFileProvider extends ChangeNotifier {
  FolderAndFileApi _documentAndFileApi = FolderAndFileApi();

  //Khởi tạo
  List<FolderAndFile> _listAll = [];
  List<FolderAndFile> _listFolder = [];
  List<FolderAndFile> _listFile = [];

  int _lengthList = 0;
  int _typeMyDocument = 0;

  //get dữ liệu
  List<FolderAndFile> get listAll => _listAll;

  List<FolderAndFile> get listFolder => _listFolder;

  List<FolderAndFile> get listFile => _listFile;

  int get lengthList => _lengthList;

  int get typeMyDocument => _typeMyDocument;

  EventLoadingStatus _eventLoadingStatus = EventLoadingStatus.NotLoaded;

  EventLoadingStatus get status => _eventLoadingStatus;

  Future<void> getAllDocument(
      String parentNodeId, int typeUser, int page, bool isSort) async {
    markAsLoading();
    _listAll.clear();
    _listFile.clear();
    _listFolder.clear();
    final response = await _documentAndFileApi.getAllDocumentByPermission(
        parentNodeId, typeUser, page, isSort);
    var decoded = utf8.decode(response.bodyBytes);
    var responseJson = json.decode(decoded);
    if (response.statusCode == 200) {
      if (responseJson['data']['objList'] != null) {
        _listAll = (responseJson['data']['objList'] as List)
            .map((p) => FolderAndFile.fromJson(p))
            .toList();
        for (FolderAndFile document in _listAll) {
          if (document.type == 2) {
            _listFolder.add(document);
          } else if (document.type == 1) {
            _listFile.add(document);
          }
        }
        print('_listFolder: $_listFolder}');
        print('_listFile: $_listFile}');
        _eventLoadingStatus = EventLoadingStatus.Loaded;
        notifyListeners();
      }
    }
  }

  Future<void> getDocuments() async {
    for (FolderAndFile element in _listAll) {
      if (element.type == 2) {
        _listFolder.add(element);
      }
    }
  }

  Future<void> getFiles() {
    for (FolderAndFile element in _listAll) {
      if (element.type == 2) {
        _listFile.add(element);
      }
    }
  }

  Future<void> seeMore() async {
    if (lengthList == 4) {
      _lengthList = _listFolder.length;
    } else {
      _lengthList = 4;
    }
    _eventLoadingStatus = EventLoadingStatus.Loaded;
    notifyListeners();
  }

  void markAsLoading() {
    _eventLoadingStatus = EventLoadingStatus.Loading;
    notifyListeners();
  }
}
