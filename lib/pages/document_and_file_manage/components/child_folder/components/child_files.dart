import 'package:app_mobile/components/loading_widget.dart';
import 'package:app_mobile/core/constants/color_constants.dart';
import 'package:app_mobile/core/constants/size_constant.dart';
import 'package:app_mobile/core/constants/string_constants.dart';
import 'package:app_mobile/core/models/domain/document_and_file/document_and_file.dart';
import 'package:app_mobile/pages/document_and_file_manage/components/files/file_info_card.dart';
import 'package:flutter/material.dart';

class ChildFiles extends StatefulWidget {
  const ChildFiles({
    Key key,
    @required this.listFile,
    @required this.isLoading,
  }) : super(key: key);

  final List<FolderAndFile> listFile;
  final bool isLoading;

  @override
  State<ChildFiles> createState() => _ChildFilesState();
}

class _ChildFilesState extends State<ChildFiles> {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Container(
      width: _size.width,
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
          widget.isLoading ? LoadingWidget() :widget.listFile.isEmpty
              ? Center(
            child: Text(kDataEmpty),
          )
              : ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: widget.listFile.length,
            itemBuilder: (context, index) {
              final documentInfo = widget.listFile[index];
              return ItemListFile(
                fileInfo: documentInfo,
              );
            },
          )
        ],
      ),
    );
  }
}