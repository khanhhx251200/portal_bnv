import 'dart:io';

import 'package:app_mobile/core/constants/color_constants.dart';
import 'package:app_mobile/core/constants/component_constant.dart';
import 'package:app_mobile/core/constants/constant.dart';
import 'package:app_mobile/core/constants/size_constant.dart';
import 'package:app_mobile/core/constants/string_constants.dart';
import 'package:app_mobile/core/models/response/phieu_yeu_cau_response.dart';
import 'package:app_mobile/pages/phieu_yeu_cau_manage/form_phieu_yeu_cau/components/view_file_by_file.dart';
import 'package:app_mobile/pages/phieu_yeu_cau_manage/form_phieu_yeu_cau/components/view_file_by_url.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mime/mime.dart';

class EditFileSelected extends StatefulWidget {
  const EditFileSelected({Key key, this.fileOld, this.fileNew})
      : super(key: key);
  final List<FileDinhKem> fileOld;
  final List<File> fileNew;

  @override
  _EditFileSelectedState createState() => _EditFileSelectedState();
}

class _EditFileSelectedState extends State<EditFileSelected> {
  List<File> files = [];

  @override
  void initState() {
    super.initState();
    files = widget.fileNew;
  }

  backScreen() {
    Navigator.pop(context, files);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(defaultPadding),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Các tệp đã chọn',
              style: GoogleFonts.roboto(fontSize: mediumSize)),
          widget.fileOld.isNotEmpty ? Flexible(
              child: ListView.builder(
            shrinkWrap: true,
            itemCount: widget.fileOld.length,
            itemBuilder: (context, index) {
              final element = widget.fileOld[index];
              String typeDocument = element.dinhDangFile;
              return itemFileOld(typeDocument, element);
            },
          )) : SizedBox.shrink(),
          Divider(),
          widget.fileNew.isNotEmpty? Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: widget.fileNew.length,
              itemBuilder: (context, index) {
                final element = widget.fileNew[index];
                String mimeStr = lookupMimeType(element.path);
                var fileType = mimeStr.split('/')[0];
                String typeDocument = element.path.split('.').last;
                return itemFileNew(fileType, element, typeDocument);
              },
            ),
          ) : SizedBox.shrink(),
          widget.fileNew.isNotEmpty? Divider(): SizedBox.shrink(),
          Row(
            children: [
              Expanded(
                  child: MaterialButton(
                    color: kLabelColors.withOpacity(0.1),
                    onPressed: () {
                      backScreen();
                    },
                    child: Text(kBack),
                  )),
              SizedBox(width: defaultPadding),
              Expanded(
                  child: MaterialButton(
                    color: kPrimaryColors,
                    onPressed: () {
                      backScreen();
                    },
                    child: Text(
                      kSave,
                      style: TextStyle(color: kWhiteColors),
                    ),
                  )),
            ],
          )
        ],
      ),
    );
  }

  ListTile itemFileNew(String fileType, File element, String typeDocument) {
    return ListTile(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ViewFileByFile(file: element))),
      leading: fileType == 'image'
          ? Image.file(
              element,
              height: 40,
              width: 40,
              fit: BoxFit.fill,
            )
          : documentIcon(typeDocument, 30),
      title: Text(
        getNameFile(element.path),
        style: GoogleFonts.roboto(fontSize: smallSize),
      ),
      subtitle: Text(
        getFileSize(element.path, 2),
        style: GoogleFonts.roboto(fontSize: smallSize),
      ),
      trailing: IconButton(
        icon: Icon(
          Icons.delete,
          color: kErrorColor,
        ),
        onPressed: () {
          setState(() {
            widget.fileNew.remove(element);
          });
        },
      ),
    );
  }

  ListTile itemFileOld(String typeDocument, FileDinhKem element) {
    return ListTile(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ViewFileByUrl(fileDinhKem: element)));
      },
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
      trailing: IconButton(
        icon: Icon(
          Icons.delete,
          color: kErrorColor,
        ),
        onPressed: () {
          setState(() {
            widget.fileOld.remove(element);
          });
        },
      ),
    );
  }
}
