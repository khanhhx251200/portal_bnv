import 'package:app_mobile/core/constants/color_constants.dart';
import 'package:app_mobile/core/constants/size_constant.dart';
import 'package:app_mobile/core/providers/file_provider.dart';
import 'package:app_mobile/fake_data/documents.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DocumentProvider extends ChangeNotifier {
  DocumentProvider() {}

  //Khởi tạo
  List<DocumentItem> _list = [];
  final _documentListKey = GlobalKey<AnimatedListState>();

  //get dữ liệu
  List<DocumentItem> get listView => _list;

  GlobalKey<AnimatedListState> get documentListKey => _documentListKey;

  EventLoadingStatus _eventLoadingStatus = EventLoadingStatus.NotLoaded;

  EventLoadingStatus get status => _eventLoadingStatus;

  Future<void> getDocumentInit(List<DocumentItem> demoDocuments) async {
    markAsLoading();
    _list = demoDocuments;
    _eventLoadingStatus = EventLoadingStatus.Loaded;
    notifyListeners();
  }

  Future<void> addDocumentList() async {
    _list.add(demoDocuments[0]);
    print('list: $_list');
    notifyListeners();
  }

  void markAsLoading() {
    _eventLoadingStatus = EventLoadingStatus.Loading;
    notifyListeners();
  }

  void showOptionBottomModal(BuildContext context) {
    print('show');
    final _size = MediaQuery.of(context).size;
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            width: _size.width,
            color: kWhiteColors,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  contentPadding: EdgeInsets.symmetric(),
                  leading: Icon(Icons.attach_file),
                  title: Text('hehe',
                      style:
                          TextStyle(fontSize: mediumSize)),
                ),
                Divider(color: kGreyColors)
              ],
            ),
          );
        });
  }
}
