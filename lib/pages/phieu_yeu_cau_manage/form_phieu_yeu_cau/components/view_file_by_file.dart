import 'dart:io';

import 'package:app_mobile/components/loading_widget.dart';
import 'package:app_mobile/components/view_photo_by_file.dart';
import 'package:app_mobile/core/constants/constant.dart';
import 'package:app_mobile/core/constants/size_constant.dart';
import 'package:app_mobile/core/constants/string_constants.dart';
import 'package:app_mobile/pages/document_and_file_manage/components/view_file/components/pdf_view.dart';
import 'package:app_mobile/pages/document_and_file_manage/components/view_file/components/video_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_file/open_file.dart';

class ViewFileByFile extends StatefulWidget {
  const ViewFileByFile({Key key, this.file}) : super(key: key);

  final File file;

  @override
  _ViewFileByFileState createState() => _ViewFileByFileState();
}

class _ViewFileByFileState extends State<ViewFileByFile> {
  var _openResult = 'Unknown';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          getNameFile(widget.file.path),
          style: GoogleFonts.roboto(fontSize: mediumSize),
        ),
      ),
      body: SafeArea(
          child: Center(
        child: buildFile(widget.file),
      )),
    );
  }

  Widget buildFile(File file) {
    final type = file.path.split('.').last;
    if (type == Constant.TYPE_JPEG ||
        type == Constant.TYPE_PNG ||
        type == Constant.TYPE_JPG) {
      return ViewPhotoByFile(file: file);
    } else if (type == Constant.TYPE_PDF) {
      return PdfViewByFile(file: file);
    } else if (type == Constant.TYPE_VIDEO) {
      return VideoViewByFile(videoFile: file);
    } else if (type == Constant.TYPE_XLSX || type == Constant.TYPE_DOCX) {
      return MaterialButton(
        onPressed: () => openFile(file),
        child: Text('Mở'),
      );
    }
    return Text(
      'Hiện tại tài liệu không có bản xem trước',
      style: GoogleFonts.roboto(fontWeight: FontWeight.bold),
    );
  }

  Future openFile(@required File file) async{
    print('file: ${file.path}');
    OpenFile.open(file.path);

  }
}
