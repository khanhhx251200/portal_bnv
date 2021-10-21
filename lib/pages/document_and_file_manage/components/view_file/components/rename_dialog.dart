import 'package:app_mobile/core/constants/color_constants.dart';
import 'package:app_mobile/core/constants/size_constant.dart';
import 'package:app_mobile/core/constants/string_constants.dart';
import 'package:app_mobile/pages/document_and_file_manage/components/view_file/components/view_file_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class RenameFileDialog extends StatefulWidget {
  const RenameFileDialog({
    Key key,
  }) : super(key: key);

  @override
  State<RenameFileDialog> createState() => _RenameFileDialogState();
}

class _RenameFileDialogState extends State<RenameFileDialog> {
  final renameController = TextEditingController();
  bool textEmpty = true;
  String nameFile;
  @override
  void initState() {
    super.initState();
    renameController.text = context.read<ViewFileProvider>().properties.node.properties.cmName;
    nameFile = renameController.text;
    renameController.selection = new TextSelection(
      baseOffset: 0,
      extentOffset: nameFile.length -4,
    );
  }

  @override
  void dispose() {
    super.dispose();
    renameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Center(
            child: Text(kRenameFile,
                style: TextStyle(
                    fontSize: highSize, fontWeight: FontWeight.bold))),
        TextField(
          controller: renameController,
          autofocus: true,
          decoration: InputDecoration(
            labelText: kName,
          ),
          onChanged: (value) {
            setState(() {
              if (value.isEmpty) {
                textEmpty = true;
              } else {
                textEmpty = false;
              }
            });
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
                child: Text(kCancel,
                    style:
                        TextStyle(color: kPrimaryColors, fontSize: mediumSize)),
                onPressed: () {
                  Navigator.pop(context);
                }),
            TextButton(
                child: Text(kRename,
                    style: TextStyle(
                        color: textEmpty ? null : kPrimaryColors,
                        fontSize: mediumSize)),
                onPressed: textEmpty ? null : () {}),
          ],
        )
      ]),
    );
  }
}
