import 'dart:convert';

import 'package:app_mobile/core/api/document_and_file_api.dart';
import 'package:app_mobile/core/constants/size_constant.dart';
import 'package:app_mobile/core/models/domain/document_and_file/document_and_file.dart';
import 'package:app_mobile/pages/document_and_file_manage/components/child_folder/components/app_bar.dart';
import 'package:app_mobile/pages/document_and_file_manage/components/child_folder/components/child_files.dart';
import 'package:app_mobile/pages/document_and_file_manage/components/child_folder/components/child_folders.dart';
import 'package:flutter/material.dart';

class ChildFolderScreen extends StatefulWidget {
  final String parentNodeId;
  final String name;
  final int typeUser;

  const ChildFolderScreen(
      {Key key, this.parentNodeId, this.name, this.typeUser})
      : super(key: key);

  @override
  _ChildFolderScreenState createState() => _ChildFolderScreenState();
}

class _ChildFolderScreenState extends State<ChildFolderScreen> {
  final _documentAndFileApi = FolderAndFileApi();

  List<FolderAndFile> _listAll = [];
  List<FolderAndFile> _listFolder = [];
  List<FolderAndFile> _listFile = [];

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getAllDocument(widget.parentNodeId, widget.typeUser);
  }

  getAllDocument(String parentNodeId, int typeUser) async {
    final response = await _documentAndFileApi.getAllDocumentByPermission(
        parentNodeId, typeUser, 1, false);
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
      }
        if(mounted){
          setState(() => _isLoading = false);
        }
    }
    print('_listFolder: $_listFolder');
    print('_listFile: $_listFile');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBarChildFolder(widget.name),
        body: SafeArea(
            child: SingleChildScrollView(
          padding: EdgeInsets.all(mediumSize),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      flex: 5,
                      child: Column(
                        children: [
                          ChildFolders(
                            listFolder: _listFolder,
                            typeUser: widget.typeUser,
                            isLoading: _isLoading,
                          ),
                          SizedBox(height: defaultPadding),
                          ChildFiles(
                            listFile: _listFile,
                            isLoading: _isLoading,
                          )
                        ],
                      ))
                ],
              )
            ],
          ),
        )));
  }
}


