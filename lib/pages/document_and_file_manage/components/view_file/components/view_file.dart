import 'dart:convert';
import 'dart:io';
import 'package:app_mobile/components/loading_widget.dart';
import 'package:app_mobile/components/view_photo_by_file.dart';
import 'package:app_mobile/core/constants/component_constant.dart';
import 'package:app_mobile/core/constants/constant.dart';
import 'package:app_mobile/core/constants/size_constant.dart';
import 'package:app_mobile/pages/document_and_file_manage/components/view_file/components/pdf_view.dart';
import 'package:app_mobile/pages/document_and_file_manage/components/view_file/components/video_view.dart';
import 'package:app_mobile/pages/document_and_file_manage/components/view_file/components/view_file_provider.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

import 'package:app_mobile/core/api/document_and_file_api.dart';
import 'package:app_mobile/core/constants/color_constants.dart';
import 'package:app_mobile/core/constants/string_constants.dart';
import 'package:app_mobile/core/models/response/properties_response.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';

class ViewFile extends StatefulWidget {
  const ViewFile({Key key, @required this.nodeId, @required this.displayName})
      : super(key: key);

  final String nodeId;
  final String displayName;

  @override
  _ViewFileState createState() => _ViewFileState();
}

class _ViewFileState extends State<ViewFile> {
  PDFViewController pdfController;

  final _api = FolderAndFileApi();
  PropertiesResponse _propertiesResponse;
  Item _properties;
  File file;

  int pages = 0;
  int indexPage = 0;

  bool isError = false;
  bool hasNoViewBefore = false;

  var _openResult = 'Unknown';

  @override
  void initState() {
    super.initState();
    print('displayName: ${widget.displayName}');
    initGetData();
  }

  @override
  void dispose() {
    _deleteCacheDir();
    _deleteAppDir();
    super.dispose();
  }

  Future<void> _deleteCacheDir() async {
    final cacheDir = await getTemporaryDirectory();

    if (cacheDir.existsSync()) {
      cacheDir.deleteSync(recursive: true);
    }
  }

  Future<void> _deleteAppDir() async {
    final appDir = await getApplicationSupportDirectory();
    if (appDir.existsSync()) {
      appDir.deleteSync(recursive: true);
    }
  }

  initGetData() async {
    final String type = widget.displayName.split(".").last;
    await getPropertiesDocument(widget.nodeId);
    if (type == Constant.TYPE_DOC ||
        type == Constant.TYPE_DOCX ||
        type == Constant.TYPE_XLS ||
        type == Constant.TYPE_XLSX) {
      getFileViewbyPreview(widget.nodeId);
    } else {
      getFileViewbyDownload(widget.nodeId);
    }
  }

  getPropertiesDocument(String nodeId) async {
    final response = await _api.getProperties(nodeId);
    var decoded = utf8.decode(response.bodyBytes);
    var responseJson = json.decode(decoded);

    if (response.statusCode == 200) {
      _propertiesResponse = PropertiesResponse.fromJson(responseJson);
      _properties = _propertiesResponse.data.item;
    } else {
      setState(() {
        if (responseJson['message'].contains('404 Not Found')) {
          isError = true;
          file = File('empty');
        } else {
          Toast.show(kErrorServer, context,
              backgroundColor: kErrorColor,
              textColor: kWhiteColors,
              duration: Toast.LENGTH_LONG,
              gravity: Toast.CENTER);
        }
      });
    }
  }

  getFileViewbyPreview(String nodeId) async {
    final response = await _api.getFileViewbyPreview(nodeId);
    if (response.statusCode == 200) {
      Directory tempDir = await getTemporaryDirectory();
      String tempPath = tempDir.path;
      file = new File('$tempPath/${widget.displayName}');
      await file.writeAsBytes(response.bodyBytes);
      setState(() {});
    } else if (response.statusCode == 500) {
      Toast.show(kErrorServer, context,
          backgroundColor: kErrorColor,
          textColor: kWhiteColors,
          duration: Toast.LENGTH_LONG,
          gravity: Toast.CENTER);
    } else {
      setState(() {
        hasNoViewBefore = true;
      });
    }
  }

  getFileViewbyDownload(String nodeId) async {
    final response = await _api.getFileViewbyDownload(nodeId);
    if (response.statusCode == 200) {
      Directory tempDir = await getTemporaryDirectory();
      String tempPath = tempDir.path;
      file = new File('$tempPath/${widget.displayName}');
      await file.writeAsBytes(response.bodyBytes);
      print('file: ${file.path}');
      if (mounted) {
        setState(() {});
      }
    } else if (response.statusCode == 500) {
      Toast.show(kErrorServer, context,
          backgroundColor: kErrorColor,
          textColor: kWhiteColors,
          duration: Toast.LENGTH_LONG,
          gravity: Toast.CENTER);
    }
  }

  @override
  Widget build(BuildContext context) {
    final position = '${indexPage + 1} / $pages';

    return Consumer(
      builder: (BuildContext context, ViewFileProvider provider, Widget child) {
        if (mounted) {
          if (_properties != null) {
            provider.setProperties(_properties);
          }
        }
        return Container(
          child: Column(
            children: [
              isError
                  ? notFound()
                  : hasNoViewBefore
                      ? Expanded(
                          child: Center(
                            child: Text(
                              'Hiện tại tài liệu không có bản xem trước',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                      : Expanded(
                          child: file == null
                              ? LoadingWidget()
                              : fileView(widget.displayName, file, position)),
              // buildActionBottom(text),
            ],
          ),
        );
      },
    );
  }

  Widget notFound() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: mediumSize),
        child: Column(
          children: [
            Image.asset('assets/images/error.png'),
            Text(
              'Bạn không có quyền xem tài liệu. Tài liệu này không tồn tại hoặc đã bị xóa !',
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        ));
  }

  Widget fileView(String displayName, File file, String position) {
    final type = displayName.split(".").last;
    if (type == Constant.TYPE_PDF ||
        type == Constant.TYPE_DOC ||
        type == Constant.TYPE_DOCX ||
        type == Constant.TYPE_XLS ||
        type == Constant.TYPE_XLSX) {
      return PdfViewByFile(file: file);
    } else if (type == Constant.TYPE_JPEG ||
        type == Constant.TYPE_JPG ||
        type == Constant.TYPE_PNG) {
      return imageView(file);
    } else if (type == Constant.TYPE_VIDEO) {
      return VideoViewByFile(videoFile: file);
    } else if (type == Constant.TYPE_DOC ||
        type == Constant.TYPE_DOCX ||
        type == Constant.TYPE_XLSX ||
        type == Constant.TYPE_XLS) {
      return MaterialButton(
        onPressed: () async {
          final _result = await OpenFile.open(file.path);
          setState(() {
            _openResult = "type=${_result.type}  message=${_result.message}";
          });
        },
        child: Text('Mở'),
      );
    } else {
      return cantLoadFile(type);
    }
  }

  Widget imageView(File file) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: kBlackColors,
      child: Center(
        child: ViewPhotoByFile(
          file: file,
        ),
      ),
    );
  }

  Widget cantLoadFile(String type) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            documentIcon(type, 40),
            SizedBox(
              height: highSize,
            ),
            Text(kTypeFileCantSupport),
          ],
        ),
      ),
    );
  }
}
