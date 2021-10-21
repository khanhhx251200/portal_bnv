import 'package:app_mobile/pages/document_and_file_manage/components/folder/folder_info_card_grid.dart';
import 'package:flutter/material.dart';
import 'package:app_mobile/core/constants/color_constants.dart';
import 'package:app_mobile/core/constants/size_constant.dart';
import 'package:app_mobile/core/constants/string_constants.dart';

class Folders extends StatelessWidget {
  const Folders({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              kFiles,
              style: Theme.of(context).textTheme.button,
            ),
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
        SizedBox(height: defaultPadding),
        FolderInfoCardGridView(
          crossAxisCount: _size.width < 650 ? 2 : 4,
          childAspectRatio: _size.width < 650 ? 1.3 : 1,
        ),
        SizedBox(height: mediumSize),
        // Center(
        //   child: TextButton(
        //     onPressed: () {
        //       context.read<DocumentAndFileProvider>().seeMore();
        //     },
        //     child: Text(
        //       context.watch<DocumentAndFileProvider>().lengthList == 4 ? kSeeAll : kCollapse,
        //       style: Theme.of(context).textTheme.caption,
        //     ),
        //   ),
        // )
      ],
    );
  }
}
