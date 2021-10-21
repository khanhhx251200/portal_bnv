import 'dart:io';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewByFile extends StatefulWidget {
  const PdfViewByFile({Key key, this.file}) : super(key: key);
  final File file;

  @override
  State<PdfViewByFile> createState() => _PdfViewByFileState();
}

class _PdfViewByFileState extends State<PdfViewByFile> {
  PdfViewerController pdfController;

  @override
  void initState() {
    super.initState();
    pdfController = PdfViewerController();
    print('file: ${widget.file}');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: SfPdfViewer.file(
      widget.file,
      controller: pdfController,
    ));
  }
}
