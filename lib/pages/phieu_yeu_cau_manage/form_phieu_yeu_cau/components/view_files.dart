import 'package:app_mobile/core/constants/color_constants.dart';
import 'package:app_mobile/core/constants/component_constant.dart';
import 'package:app_mobile/core/constants/constant.dart';
import 'package:app_mobile/core/constants/size_constant.dart';
import 'package:app_mobile/core/constants/string_constants.dart';
import 'package:app_mobile/core/models/response/phieu_yeu_cau_response.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ViewFilesPhieuYeuCau extends StatelessWidget {
  const ViewFilesPhieuYeuCau({Key key, this.files}) : super(key: key);
  final List<FileDinhKem> files;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(defaultPadding),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Các tài liệu đã chọn',
              style: GoogleFonts.roboto(fontSize: mediumSize)),
          Expanded(
              child: ListView.builder(
            shrinkWrap: true,
            itemCount: files.length,
            itemBuilder: (context, index) {
              final element = files[index];
              String typeDocument = element.dinhDangFile;
              return itemFileOld(typeDocument, element);
            },
          ))
        ],
      ),
    );
  }

  ListTile itemFileOld(String typeDocument, FileDinhKem element) {
    return ListTile(
      leading: typeDocument == Constant.TYPE_JPEG ||
              typeDocument == Constant.TYPE_JPG ||
              typeDocument == Constant.TYPE_PNG
          ? Image.network(
              element.urlFile,
              height: 40,
              width: 40,
              fit: BoxFit.fill,
            )
          : documentIcon(typeDocument, 30),
      title: Text(
        element.tenFile,
        style: GoogleFonts.roboto(fontSize: smallSize),
      ),
      subtitle: Text(
        getFileSizeByInt(1024, 2),
        style: GoogleFonts.roboto(fontSize: smallSize),
      ),
    );
  }
}
