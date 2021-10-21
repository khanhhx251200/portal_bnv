import 'package:app_mobile/fake_data/my_files.dart';
import 'package:flutter/material.dart';

enum EventLoadingStatus { NotLoaded, Loading, Loaded }

class FileProvider extends ChangeNotifier {
  FileProvider() {}

  //Khởi tạo
  List<CloudStorageInfo> _list = [];
  int _lengthList = 0;

  //get dữ liệu
  List<CloudStorageInfo> get listView => _list;
  int get lengthList => _lengthList;

  EventLoadingStatus _eventLoadingStatus = EventLoadingStatus.NotLoaded;

  EventLoadingStatus get status => _eventLoadingStatus;

  Future<void> getFileInit() async {
    markAsLoading();
    _lengthList = 4;
    _list = demoMyFiles;
    _eventLoadingStatus = EventLoadingStatus.Loaded;
    notifyListeners();
  }

  Future<void> seeMore() async {
    if(lengthList == 4){
      _lengthList = _list.length;
    } else {
      _lengthList = 4;
    }
    _eventLoadingStatus = EventLoadingStatus.Loaded;
    notifyListeners();
  }


  void markAsLoading() {
    _eventLoadingStatus = EventLoadingStatus.Loading;
    notifyListeners();
  }
}
