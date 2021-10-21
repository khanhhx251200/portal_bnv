import 'package:app_mobile/core/constants/color_constants.dart';
import 'package:app_mobile/core/constants/component_constant.dart';
import 'package:app_mobile/core/constants/size_constant.dart';
import 'package:app_mobile/core/constants/string_constants.dart';
import 'package:app_mobile/core/models/domain/document_and_file/document_and_file.dart';
import 'package:app_mobile/pages/document_and_file_manage/components/view_file/view_file_screen.dart';
import 'package:flutter/material.dart';

class ItemListFile extends StatelessWidget {
  const ItemListFile({
    Key key,
    @required this.fileInfo,
  }) : super(key: key);

  final FolderAndFile fileInfo;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: defaultPadding / 2),
      decoration: BoxDecoration(
        color: kSecondColor,
        borderRadius: const BorderRadius.all(Radius.circular(xSmallSize)),
      ),
      child: ListTile(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ViewFileScreen(
                nodeId: fileInfo.nodeId,
                name: fileInfo.name,
                typeFile: fileInfo.fileEntry.extension,
              )));
        },
        contentPadding: EdgeInsets.symmetric(horizontal: defaultPadding),
        leading: Padding(
          padding: EdgeInsets.all(defaultPadding),
          child: documentIcon(fileInfo.fileEntry.extension, 30),
        ),
        title: Text(fileInfo.name,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: smallSize)),
        subtitle: Text(convertDateDetail(fileInfo.createDate, ),
            style: TextStyle(fontSize: smallSize)),
        trailing: IconButton(
          onPressed: () {},
          icon: Icon(Icons.more_vert),
        ),
      ),
    );
  }
}
