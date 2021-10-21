import 'package:app_mobile/components/loading_widget.dart';
import 'package:app_mobile/core/constants/color_constants.dart';
import 'package:app_mobile/core/constants/size_constant.dart';
import 'package:app_mobile/core/constants/string_constants.dart';
import 'package:app_mobile/core/models/domain/document_and_file/document_and_file.dart';
import 'package:app_mobile/pages/document_and_file_manage/components/folder/folder_info_card.dart';
import 'package:flutter/material.dart';

class ChildFolders extends StatefulWidget {
  const ChildFolders({
    Key key,
    @required this.listFolder,
    @required this.typeUser,
    @required this.isLoading
  }) : super(key: key);

  final List<FolderAndFile> listFolder;
  final int typeUser;
  final bool isLoading;

  @override
  State<ChildFolders> createState() => _ChildFoldersState();
}

class _ChildFoldersState extends State<ChildFolders> {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              kFiles,
              style: Theme.of(context).textTheme.button,
            ),
            // Spacer(),
            ElevatedButton.icon(
              style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                      horizontal: defaultPadding * 1.5,
                      vertical: defaultPadding / 2)),
              onPressed: () {},
              icon: Icon(
                Icons.add,
                color: kWhiteColors,
              ),
              label: Text(
                kAddNew,
                style: TextStyle(color: kWhiteColors),
              ),
            ),
          ],
        ),
        widget.isLoading ? LoadingWidget() : widget.listFolder.isEmpty ? Center(
          child: Text(kDataEmpty),
        ) :GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: widget.listFolder.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: _size.width < 650 ? 2 : 4,
            crossAxisSpacing: defaultPadding,
            mainAxisSpacing: defaultPadding,
            childAspectRatio: _size.width < 650 ? 1.3 : 1,
          ),
          itemBuilder: (context, index) =>
              FolderInfoCard(info: widget.listFolder[index], typeUser: widget.typeUser,),
        )
      ],
    );
  }
}