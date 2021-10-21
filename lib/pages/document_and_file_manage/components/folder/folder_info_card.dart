import 'package:app_mobile/core/constants/color_constants.dart';
import 'package:app_mobile/core/constants/size_constant.dart';
import 'package:app_mobile/core/constants/string_constants.dart';
import 'package:app_mobile/core/models/domain/document_and_file/document_and_file.dart';
import 'package:app_mobile/pages/document_and_file_manage/components/child_folder/child_folder_screen.dart';
import 'package:flutter/material.dart';

class FolderInfoCard extends StatelessWidget {
  const FolderInfoCard({
    Key key,
    @required this.info,
    @required this.typeUser,
  }) : super(key: key);

  final FolderAndFile info;
  final int typeUser;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ChildFolderScreen(
                      parentNodeId: info.nodeId,
                      name: info.name,
                      typeUser: typeUser,
                    )));
      },
      child: Container(
        padding: EdgeInsets.all(defaultPadding),
        decoration: BoxDecoration(
          color: kSecondColor,
          borderRadius: const BorderRadius.all(Radius.circular(xSmallSize)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(defaultPadding * 0.75),
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: kGreyColors.withOpacity(0.1),
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Icon(
                    Icons.folder,
                    color: kGreyColors,
                  ),
                ),
                Icon(Icons.more_vert, color: kBlackColors)
              ],
            ),
            Hero(
              tag: info.name,
              child: Text(
                info.folderEntry.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context)
                    .textTheme
                    .button
                    .copyWith(color: kBlackColors),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  convertDateDetail(info.folderEntry.createDate, ),
                  style: Theme.of(context)
                      .textTheme
                      .caption
                      .copyWith(color: kBlackColors),
                ),
                Text(
                  "0",
                  style: Theme.of(context)
                      .textTheme
                      .button
                      .copyWith(color: kBlackColors),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
