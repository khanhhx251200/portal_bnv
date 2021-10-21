import 'package:app_mobile/components/loading_widget.dart';
import 'package:app_mobile/components/pdf_view_by_url.dart';
import 'package:app_mobile/components/video_view_by_url.dart';
import 'package:app_mobile/core/constants/color_constants.dart';
import 'package:app_mobile/core/constants/constant.dart';
import 'package:app_mobile/core/constants/size_constant.dart';
import 'package:app_mobile/core/constants/string_constants.dart';
import 'package:app_mobile/core/models/response/phieu_yeu_cau_response.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ViewFileByUrl extends StatefulWidget {
  const ViewFileByUrl({Key key, this.fileDinhKem}) : super(key: key);
  final FileDinhKem fileDinhKem;

  @override
  _ViewFileByUrlState createState() => _ViewFileByUrlState();
}

class _ViewFileByUrlState extends State<ViewFileByUrl> {
  bool _isNoPreview = false;

  @override
  void initState() {
    super.initState();
    if (widget.fileDinhKem.dinhDangFile == Constant.TYPE_JPEG ||
        widget.fileDinhKem.dinhDangFile == Constant.TYPE_PNG ||
        widget.fileDinhKem.dinhDangFile == Constant.TYPE_PDF ||
        widget.fileDinhKem.dinhDangFile == Constant.TYPE_VIDEO ||
        widget.fileDinhKem.dinhDangFile == Constant.TYPE_JPG) {
      setState(() => _isNoPreview = false);
    } else {
      setState(() => _isNoPreview = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.fileDinhKem.tenFile,
          style: GoogleFonts.roboto(fontSize: mediumSize),
        ),
      ),
      body: SafeArea(
        child: Center(
            child: _isNoPreview
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Hiện tại tài liệu không có bản xem trước',
                        style: GoogleFonts.roboto(fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                          onPressed: () => _launchURL(),
                          child: Text(
                            kDownload,
                            style: GoogleFonts.roboto(
                                fontWeight: FontWeight.bold,
                                color: kSuccessColor),
                          ))
                    ],
                  )
                : buildFile(widget.fileDinhKem)),
      ),
    );
  }

  Widget buildFile(FileDinhKem fileDinhKem) {
    if (fileDinhKem.dinhDangFile == Constant.TYPE_JPEG ||
        fileDinhKem.dinhDangFile == Constant.TYPE_PNG ||
        fileDinhKem.dinhDangFile == Constant.TYPE_JPG) {
      return buildImage();
    } else if (fileDinhKem.dinhDangFile == Constant.TYPE_PDF) {
      return PdfViewByUrl(
        file: widget.fileDinhKem.urlFile,
      );
    } else if(fileDinhKem.dinhDangFile == Constant.TYPE_VIDEO){
      return VideoViewByUrl(videoUrl: widget.fileDinhKem.urlFile,);
    }
    return LoadingWidget();
  }

  Image buildImage() {
    return Image.network(widget.fileDinhKem.urlFile);
  }

  void _launchURL() async => await canLaunch(widget.fileDinhKem.urlFile)
      ? await launch(widget.fileDinhKem.urlFile)
      : throw 'Could not launch ${widget.fileDinhKem.urlFile}';
}
