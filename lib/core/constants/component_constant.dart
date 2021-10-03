import 'package:app_mobile/core/constants/color_constants.dart';

import 'constant.dart';
import 'package:flutter/material.dart';


  documentIcon(String documentType, double size) {
    if (documentType == Constant.TYPE_DOCX || documentType == Constant.TYPE_DOC) {
      //docs
      return Image.asset("assets/icons/google_docs.png",
          height: size, width: size, fit: BoxFit.fill);
    } else if (documentType == Constant.TYPE_PDF.toLowerCase()) {
      // pdf
      return Image.asset("assets/icons/pdf.png",
          height: size, width: size, fit: BoxFit.fill);
    } else if (documentType == Constant.TYPE_JPG ||
        documentType == Constant.TYPE_PNG.toLowerCase()) {
      //image
      return Image.asset("assets/icons/photo.png",
          height: size, width: size, fit: BoxFit.fill);
    } else if (documentType == Constant.TYPE_SHEETS) {
      // sheets
      return Image.asset("assets/images/google-sheets.png");
    } else if (documentType == Constant.TYPE_VIDEO) {
      //video
      return Image.asset("assets/icons/video.png",
          height: size, width: size, fit: BoxFit.fill);
    } else if (documentType == Constant.TYPE_XLSX ||
        documentType == Constant.TYPE_XLS) {
      return Image.asset("assets/icons/excel.png",
          height: size, width: size, fit: BoxFit.fill);
    } else if (documentType == Constant.TYPE_FOLDER) {
      return Icon(Icons.folder,
          color: kGreyColors,
          size: size);
    } else {
      return Icon(
        Icons.insert_drive_file,
        color: Colors.blue,
        size: size,
      );
    }
  }
