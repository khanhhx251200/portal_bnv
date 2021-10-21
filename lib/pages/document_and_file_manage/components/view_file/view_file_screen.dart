import 'package:app_mobile/pages/document_and_file_manage/components/view_file/components/app_bar_view_file.dart';
import 'package:app_mobile/pages/document_and_file_manage/components/view_file/components/view_file.dart';
import 'package:flutter/material.dart';

class ViewFileScreen extends StatelessWidget {
  const ViewFileScreen({Key key,
    @required this.nodeId,@required  this.typeFile,@required  this.name})
      : super(key: key);

  final String nodeId;
  final String typeFile;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, typeFile, name),
      body: ViewFile(nodeId: nodeId, displayName: name, ),
    );
  }
}
