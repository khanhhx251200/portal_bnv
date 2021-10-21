import 'package:app_mobile/core/constants/color_constants.dart';
import 'package:app_mobile/core/constants/size_constant.dart';
import 'package:app_mobile/pages/document_and_file_manage/components/view_file/components/view_file_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Widget buildAppBar(BuildContext context, String type, String name) {
  return AppBar(
    backgroundColor: kWhiteColors,
    leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.close,
          color: kGreyColors,
        )),
    title: Row(
      children: [
        SizedBox(width: defaultPadding),
        Expanded(
          child: Hero(
            tag: name,
            child: Text(
              name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: smallSize, color: kBlackColors),
            ),
          ),
        ),
      ],
    ),
    actions: [
      IconButton(onPressed: () {}, icon: Icon(Icons.chat_outlined, color: kGreyColors,)),
      IconButton(onPressed: () {
        context.read<ViewFileProvider>().showActionBottom(context);
        context.read<ViewFileProvider>().setTypeFile(type);
      }, icon: Icon(Icons.more_horiz))
    ],
  );
}
