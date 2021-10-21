import 'package:app_mobile/core/constants/component_constant.dart';
import 'package:app_mobile/core/constants/size_constant.dart';
import 'package:app_mobile/core/constants/string_constants.dart';
import 'package:app_mobile/core/models/response/properties_response.dart';
import 'package:app_mobile/pages/document_and_file_manage/components/view_file/components/item_action_bottom.dart';
import 'package:app_mobile/pages/document_and_file_manage/components/view_file/components/view_file_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ViewFileBottomSheetAction extends StatelessWidget {
  const ViewFileBottomSheetAction({
    Key key,
    @required String typeFile,
    @required this.properties,
  })  : _typeFile = typeFile,
        super(key: key);

  final String _typeFile;
  final Item properties;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          contentPadding:
          EdgeInsets.symmetric(vertical: 0, horizontal: defaultPadding),
          onTap: null,
          leading: documentIcon(_typeFile, bigSize + 4),
          title: Text(
            properties.node.properties.cmName,
            style: TextStyle(fontSize: smallSize, fontWeight: FontWeight.bold),
          ),
        ),
        Divider(),
        ItemActionBottom(icon: Icons.person_add_alt_1_outlined, title: kShare, onPressed: () {}),
        ItemActionBottom(icon: Icons.edit_outlined, title: kRename, onPressed: () {
              Navigator.pop(context);
          context.read<ViewFileProvider>().showDialogRename(context);
        }),
      ],
    );
  }
}
