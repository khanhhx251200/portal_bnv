import 'package:app_mobile/components/loading_widget.dart';
import 'package:app_mobile/core/constants/size_constant.dart';
import 'package:app_mobile/pages/document_and_file_manage/components/folder/folder_info_card.dart';
import 'package:app_mobile/pages/document_and_file_manage/components/provider/document_and_file_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FolderInfoCardGridView extends StatefulWidget {
  const FolderInfoCardGridView({
    Key key,
    this.crossAxisCount,
    this.childAspectRatio,
  }) : super(key: key);

  final int crossAxisCount;
  final double childAspectRatio;

  @override
  _FolderInfoCardGridViewState createState() => _FolderInfoCardGridViewState();
}

class _FolderInfoCardGridViewState extends State<FolderInfoCardGridView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final FolderAndFileProvider _documentAndFileProvider =
        Provider.of<FolderAndFileProvider>(context, listen: true);

    return _documentAndFileProvider.status == EventLoadingStatus.Loading
        ? LoadingWidget()
        : Consumer(builder: (context, FolderAndFileProvider provider, child) {
            return GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: provider.listFolder.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: widget.crossAxisCount,
                crossAxisSpacing: defaultPadding,
                mainAxisSpacing: defaultPadding,
                childAspectRatio: widget.childAspectRatio,
              ),
              itemBuilder: (context, index) =>
                  FolderInfoCard(info: provider.listFolder[index], typeUser: provider.typeMyDocument,),
            );
          });
  }
}
