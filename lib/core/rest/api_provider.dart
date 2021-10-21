import 'dart:convert';

import 'package:app_mobile/core/constants/constant.dart';
import 'package:app_mobile/core/constants/string_constants.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

class ApiProvider {
  ApiProvider._privateConstructor();

  /// constructor
  static final ApiProvider apiProvider = ApiProvider._privateConstructor();

  _getUrlEndpoint(String url) {
    return Constant.API + url;
  }

  //GET
  dynamic get(String url) async {
    var requestHeaders = <String, String>{
      "Content-Type": "application/json",
      "Accept": "application/json, ",
      "Authorization": "Bearer " + TOKEN
    };
    url = _getUrlEndpoint(url).toString();
    var uri = Uri.parse(url);
    print(uri);
    final response = await http.get(uri, headers: requestHeaders);
    return response;
  }

  //POST
  dynamic post({String url, dynamic body}) async {
    var data = json.encode(body).toString();
    var requestHeaders = <String, String>{
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer " + TOKEN
    };
    print("post: " + data.toString());
    url = _getUrlEndpoint(url).toString();
    var uri = Uri.parse(url);
    print(uri);
    final response =
        await http.post(Uri.parse(url), headers: requestHeaders, body: data);
    return response;
  }

  dynamic postFormData({String url, dynamic body}) async {

    var data = FormData.fromMap(body);
    var requestHeaders = <String, String>{
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer " + TOKEN
    };
    print("post: " + data.toString());
    url = _getUrlEndpoint(url).toString();
    var uri = Uri.parse(url);
    print(uri);
    final response = await Dio().post("$uri", data: data);
    return response;
  }

  //PUT
  dynamic put(String url) async {
    final requestHeaders = <String, String>{
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer " + TOKEN
    };
    url = _getUrlEndpoint(url).toString();
    var uri = Uri.parse(url);
    print(uri);
    final response = await http.put(Uri.parse(url), headers: requestHeaders);
    return response;
  }
}
