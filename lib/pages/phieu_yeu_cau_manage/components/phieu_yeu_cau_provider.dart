import 'dart:convert';

import 'package:app_mobile/components/snackbar_utils.dart';
import 'package:app_mobile/core/constants/color_constants.dart';
import 'package:app_mobile/core/constants/constant.dart';
import 'package:app_mobile/core/constants/string_constants.dart';
import 'package:app_mobile/core/models/request/phieu_yeu_cau_request.dart';
import 'package:app_mobile/core/models/request/tiep_nhan_yeu_cau_request.dart';
import 'package:app_mobile/core/models/response/phieu_yeu_cau_response.dart';
import 'package:app_mobile/core/providers/file_provider.dart';
import 'package:app_mobile/core/rest/api_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:dio/dio.dart';

class PhieuYeuCauProvider extends ChangeNotifier {
  final _apiProvider = ApiProvider.apiProvider;

  //Khởi tạo
  List<PhieuYeuCau> _phieuYeuCauList = [];
  bool _isError = false;
  int _size = 10;
  int _totalSize = 0;
  int _pageCount = 1;
  PhieuYeuCau _phieuYeuCau;
  String _query ='';

  //getter
  List<PhieuYeuCau> get phieuYeuCauList => _phieuYeuCauList;

  bool get isError => _isError;

  int get totalSize => _totalSize;

  int get pageCount => _pageCount;

  PhieuYeuCau get phieuYeuCau => _phieuYeuCau;

  EventLoadingStatus _eventLoadingStatus = EventLoadingStatus.NotLoaded;

  EventLoadingStatus get status => _eventLoadingStatus;

  Future<void> getAllPhieuYeuCau(int groupId, int companyId )async{
    _phieuYeuCauList.clear();
    try{
      final response = await _apiProvider.get(Constant.GET_ALL_PHIEU_YEU_CAU +
          "/$groupId/$companyId?start=0&end=$_size&searchKey=$_query");
      var decoded = utf8.decode(response.bodyBytes);
      var responseJson = json.decode(decoded);
      if (response.statusCode == 200) {
        if (responseJson['data']['data'] != null) {
          _totalSize = responseJson['data']['total'];
          _phieuYeuCauList = (responseJson['data']['data'] as List)
              .map((p) => PhieuYeuCau.fromJson(p))
              .toList();
          print('list: ${_phieuYeuCauList.length}');
        } else {
          print('error200');
        }
      } else {
        print('error');
        _isError = true;
      }
      notifyListeners();
    } catch(e){
      print('e');
    }
  }

  Future<void> getAllInitPhieuYeuCau(int groupId, int companyId, String query) async {
    markAsLoading();
    _phieuYeuCauList.clear();
    _pageCount = 1;
    _size = 10;
    _totalSize = 0;
    _isError = false;
    _query = query;
    try {
      final response = await _apiProvider.get(Constant.GET_ALL_PHIEU_YEU_CAU +
          "/$groupId/$companyId?start=0&end=$_size&searchKey=$query");
      if (response.statusCode == 200) {
        var decoded = utf8.decode(response.bodyBytes);
        var responseJson = json.decode(decoded);
        if(responseJson['resultCode'] == 200){
          if (responseJson['data']['data'] != null) {
            _totalSize = responseJson['data']['total'];
            _phieuYeuCauList = (responseJson['data']['data'] as List)
                .map((p) => PhieuYeuCau.fromJson(p))
                .toList();
            print('list: ${_phieuYeuCauList.length}');
            print('total: $_totalSize');
            _eventLoadingStatus = EventLoadingStatus.Loaded;
          }
        } else {
          _isError = true;
          _eventLoadingStatus = EventLoadingStatus.Loaded;
          showSnackBar(kError, "${responseJson['message']}", kErrorColor,
              kWhiteColors, kTOP);
        }
      } else {
        _isError = true;
        _eventLoadingStatus = EventLoadingStatus.Loaded;
        showSnackBar(kError, kErrorServer, kErrorColor,
            kWhiteColors, kTOP);
      }
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future<void> loadMorePhieuYeuCau(int groupId,int companyId, String query) async {
    _pageCount++;
    int start = _size * (_pageCount - 1);
    int end = _size * _pageCount;

    try {
      final response = await _apiProvider.get(Constant.GET_ALL_PHIEU_YEU_CAU +
          "/$groupId/$companyId?start=$start&end=$end&searchKey=$query");
      var decoded = utf8.decode(response.bodyBytes);
      var responseJson = json.decode(decoded);
      if (response.statusCode == 200) {
        if(responseJson['resultCode'] == 200){
          if (responseJson['data']['data'] != null) {
            _totalSize = responseJson['data']['total'];
            print('total: $_totalSize');
            var list = (responseJson['data']['data'] as List)
                .map((p) => PhieuYeuCau.fromJson(p))
                .toList();
            _phieuYeuCauList.addAll(list);
            print('listMore: ${list.length}');
            print('listTotal: ${_phieuYeuCauList.length}');
          }
        } else {
          print('error');
          _isError = true;
          _eventLoadingStatus = EventLoadingStatus.Loaded;
          showSnackBar(kError, " ${responseJson['message']}", kErrorColor,
              kWhiteColors, kTOP);
        }
      } else {
        print('error');
        _isError = true;
        showSnackBar(kError, " ${responseJson['message']}", kErrorColor,
            kWhiteColors, kTOP);
      }
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  void markAsLoading() {
    _eventLoadingStatus = EventLoadingStatus.Loading;
  }

  Future<dynamic> addAndUpdatePhieuYeuCau(PhieuYeuCauRequest request,
      int userId, int groupId, int companyId, int phieuId) async {
    try {
      final response = await _apiProvider.postFormData(
          url: Constant.CREATE_AND_UPDATE_PHIEU_YEU_CAU +
              "/$userId/$groupId/$companyId/${phieuId}",
          body: request.toJson());
      if (response.statusCode == 200) {
        print('response: ${response}');
        return response.data;
      } else {}
    } catch (e) {
      print(e);
    }
  }

  Future<void> deletePhieuYeuCau(
      int userId, int groupId, int companyId, PhieuYeuCau phieuYeuCau) async {
    try {
      EasyLoading.show(status: 'Đang xử lí...');
      final response = await _apiProvider.get(Constant.DELETE_PHIEU_YEU_CAU +
          "/$userId/$groupId/$companyId/${phieuYeuCau.phieuId}");
      if (response.statusCode == 200) {
        var decoded = utf8.decode(response.bodyBytes);
        var responseJson = json.decode(decoded);
        if (responseJson['resultCode'] == 200) {
          _phieuYeuCauList.remove(phieuYeuCau);
          showSnackBar("Thành công", "Thao tác thực hiện thành công",
              kSuccessColor, kWhiteColors, kTOP);
          notifyListeners();
        } else {
          showSnackBar(kError, " ${responseJson['message']}", kErrorColor,
              kWhiteColors, kTOP);
        }
        EasyLoading.dismiss();
        return responseJson;
      } else {
        EasyLoading.dismiss();
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> getDetailPhieuYeuCau(
      int groupId, int companyId, int phieuId) async {
    _phieuYeuCau = null;
    try {
      final response = await _apiProvider
          .get(Constant.DETAIL_PHIEU_YEU_CAU + "/$groupId/$companyId/$phieuId");
      if (response.statusCode == 200) {
        var decoded = utf8.decode(response.bodyBytes);
        var responseJson = json.decode(decoded);
        if (responseJson['resultCode'] == 200) {
          _phieuYeuCau = PhieuYeuCau.fromJson(responseJson['data']);
          EasyLoading.dismiss();
        } else {
          EasyLoading.dismiss();
          showSnackBar(kError, " ${responseJson['message']}", kErrorColor,
              kWhiteColors, kTOP);
        }
        notifyListeners();

        return responseJson;
      } else {
        showSnackBar(kError, kErrorServer, kErrorColor, kWhiteColors, kTOP);
      }
    } catch (e) {
      EasyLoading.dismiss();
      showSnackBar(kError, kErrorServer, kErrorColor, kWhiteColors, kTOP);
      throw e;
    }
  }

  Future<void> tiepNhanYeuCau(TiepNhanYeuCauRequest request) async {
    EasyLoading.show(status: 'Đang tải...');
    var body = json.encode(request);
    String url = 'http://172.16.10.70:8081/api/TiepNhan/tiepnhapyeucau';
    Uri uri = Uri.parse(url);
    print(uri);
    print("body: "+body);
    try {
      final response = await Dio().post(url,data: body).catchError((err, stackTrace){
        EasyLoading.dismiss();
      });
      if(response.data['resultCode'] == 200){
        getAllPhieuYeuCau(20125, 20100);
        showSnackBar('Thành công', 'Thao tác thực hiện thành công', kSuccessColor, kWhiteColors, kTOP);
      } else {
        showSnackBar(kError, response.data['message'], kErrorColor, kWhiteColors, kTOP);
      }
      EasyLoading.dismiss();
      print(response);
    } catch (e) {
      print(e);
    }
  }
  
  Future<void> viewFileByUrl(String url) async {
    try{
      final response = await Dio().get(url);
      print('response: $response');
    } catch(e) {
      
    }
  }

  Future<bool> deleteFile(int userId, int groupId, int companyId, int storageid, int fileEntryId) async {
    try{
      final response = await _apiProvider.get(Constant.DELETE_FILE+"/$userId/$groupId/$companyId/$storageid/$fileEntryId");
      print('response: $response');
      if(response.statusCode == 200){
        return true;
      } else {
        return true;
      }
    } catch(e) {

    }
  }


}
