import 'package:app_mobile/components/loading_widget.dart';
import 'package:app_mobile/core/constants/string_constants.dart';
import 'package:app_mobile/pages/document_and_file_manage/components/files/file_info_card.dart';
import 'package:app_mobile/pages/document_and_file_manage/components/provider/document_and_file_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FileInfoCardList extends StatefulWidget {
  const FileInfoCardList({Key key}) : super(key: key);

  @override
  _FileInfoCardListState createState() => _FileInfoCardListState();
}

class _FileInfoCardListState extends State<FileInfoCardList> {
  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    final FolderAndFileProvider _documentProvider =
        Provider.of<FolderAndFileProvider>(context, listen: true);
    return _documentProvider.status == EventLoadingStatus.Loading
        ? LoadingWidget()
        : Consumer(
            builder: (context, FolderAndFileProvider documentProvider, child) {
            return documentProvider.listFile.isEmpty
                ? Center(
                    child: Text(kDataEmpty),
                  )
                : ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: documentProvider.listFile.length,
                    itemBuilder: (context, index) {
                      final documentInfo = documentProvider.listFile[index];
                      return ItemListFile(
                        fileInfo: documentInfo,
                      );
                    },
                  );
          });
  }
}
