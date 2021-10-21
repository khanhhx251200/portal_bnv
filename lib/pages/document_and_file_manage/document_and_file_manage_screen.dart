import 'package:app_mobile/core/constants/color_constants.dart';
import 'package:app_mobile/core/constants/size_constant.dart';
import 'package:app_mobile/core/constants/string_constants.dart';
import 'package:app_mobile/pages/document_and_file_manage/components/files/files.dart';
import 'package:app_mobile/pages/document_and_file_manage/components/folder/folders.dart';
import 'package:app_mobile/pages/document_and_file_manage/components/provider/document_and_file_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DocumentAndFileManageScreen extends StatefulWidget {
  final String parentNodeId;
  const DocumentAndFileManageScreen({Key key, this.parentNodeId}) : super(key: key);

  @override
  State<DocumentAndFileManageScreen> createState() => _DocumentAndFileManageScreenState();
}

class _DocumentAndFileManageScreenState extends State<DocumentAndFileManageScreen> {
  int typeUser = 2;
  int page = 1;
  bool isSort = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      Provider.of<FolderAndFileProvider>(context, listen: false)
          .getAllDocument(widget.parentNodeId, typeUser, page, isSort);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColors,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_rounded,
              color: kWhiteColors,
            ),
            onPressed: () => Navigator.pop(context)),
        centerTitle: true,
        title: Text(
          kFileAndDocument,
          style: TextStyle(color: kWhiteColors, fontSize: veryHighSize),
        ),
      ),
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
                        Folders(),
                        SizedBox(height: mediumSize),
                        Files()
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}






