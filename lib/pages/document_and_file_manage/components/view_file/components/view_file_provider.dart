import 'package:app_mobile/core/constants/size_constant.dart';
import 'package:app_mobile/core/constants/string_constants.dart';
import 'package:app_mobile/core/models/response/properties_response.dart';
import 'package:app_mobile/pages/document_and_file_manage/components/view_file/components/rename_dialog.dart';
import 'package:app_mobile/pages/document_and_file_manage/components/view_file/components/view_file_bottom_sheet_action.dart';
import 'package:flutter/material.dart';

class ViewFileProvider extends ChangeNotifier {
  //Khởi tạo biến
  Item _propertiesFile;
  String _typeFile;

  //get giá trị biến
  Item get properties => _propertiesFile;

  String get typeFile => _typeFile;

  Future<void> setProperties(Item properties) async {
    _propertiesFile = null;
    _propertiesFile = properties;
  }

  Future<void> setTypeFile(String type) async {
    type = '';
    _typeFile = type;
  }

  Future<void> showActionBottom(BuildContext context) async {
    showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(highSize))),
      context: context,
      builder: (context) {
        return ViewFileBottomSheetAction(
            typeFile: _typeFile, properties: properties);
      },
    );
  }

  Future<void> showDialogRename(BuildContext context) async {
    showDialog(
        barrierDismissible: false,
        context: context, builder: (context) {
      return AlertDialog(

        content: RenameFileDialog(),
      );
    });
  }
}


