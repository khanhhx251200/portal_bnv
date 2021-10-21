import 'package:app_mobile/core/constants/color_constants.dart';
import 'package:app_mobile/core/constants/size_constant.dart';
import 'package:app_mobile/core/constants/string_constants.dart';
import 'package:app_mobile/core/providers/document_provider.dart';
import 'package:app_mobile/pages/document_and_file_manage/components/files/file_info_card_list.dart';
import 'package:app_mobile/pages/document_and_file_manage/components/provider/document_and_file_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Files extends StatelessWidget {
  const Files({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Consumer(
      builder: (context, FolderAndFileProvider documentProvider, child){
        return Container(
          width: _size.width,
          padding: EdgeInsets.all(defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    kDocuments,
                    style: Theme.of(context).textTheme.button,
                  ),
                  ElevatedButton.icon(
                    style: TextButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                            horizontal: defaultPadding * 1.5,
                            vertical: defaultPadding / 2)),
                    onPressed: () {
                    },
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
              FileInfoCardList(),
            ],
          ),
        );
      }
       ,
    );
  }
}
