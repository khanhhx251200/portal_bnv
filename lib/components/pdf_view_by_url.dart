import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewByUrl extends StatefulWidget {
  const PdfViewByUrl({Key key, this.file}) : super(key: key);
  final file;

  @override
  State<PdfViewByUrl> createState() => _PdfViewByFileState();
}

class _PdfViewByFileState extends State<PdfViewByUrl> {
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
        child: SfPdfViewer.network(
          widget.file,
          controller: pdfController,
        ));
  }
}
