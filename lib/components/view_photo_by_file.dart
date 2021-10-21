import 'dart:io';

import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ViewPhotoByFile extends StatelessWidget {
  const ViewPhotoByFile({
    Key key,@required this.file,
  }) : super(key: key);
  final File file;

  @override
  Widget build(BuildContext context) {
    return PhotoView(
      initialScale: PhotoViewComputedScale.contained * 0.9,
      imageProvider: FileImage(
        file,
      ),
    );
  }
}
