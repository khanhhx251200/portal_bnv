import 'dart:io';

import 'package:app_mobile/core/constants/color_constants.dart';
import 'package:app_mobile/core/constants/component_constant.dart';
import 'package:app_mobile/core/constants/size_constant.dart';
import 'package:app_mobile/core/constants/string_constants.dart';
import 'package:app_mobile/pages/phieu_yeu_cau_manage/form_phieu_yeu_cau/components/view_file_by_file.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mime/mime.dart';

class EditFilesSelectedCreateNew extends StatefulWidget {
  const EditFilesSelectedCreateNew({Key key, this.files}) : super(key: key);

  final List<File> files;

  @override
  _EditFilesSelectedCreateNewState createState() => _EditFilesSelectedCreateNewState();
}

class _EditFilesSelectedCreateNewState extends State<EditFilesSelectedCreateNew> {
  List<File> files = [];

  @override
  void initState() {
    super.initState();
    files = widget.files;
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
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: widget.files.length,
              itemBuilder: (context, index) {
                final element = widget.files[index];
                String mimeStr = lookupMimeType(element.path);
                var fileType = mimeStr.split('/')[0];
                String typeDocument = element.path.split('.').last;
                return ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ViewFileByFile(file: element)));
                  },
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
                        widget.files.remove(element);
                      });
                    },
                  ),
                );
              },
            ),
          ),
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
}
