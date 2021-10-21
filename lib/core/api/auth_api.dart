
import 'dart:convert';

import 'package:app_mobile/core/constants/constant.dart';
import 'package:app_mobile/core/models/request/sign_up_request.dart';
import 'package:http/http.dart' as http;

class AuthApi{

  Future<dynamic> register(SignUpRequest request) async {
    String url = Constant.API_AUTH;
    Uri uri = Uri.parse(url);
    var body = json.encode(request).toString();
    try{
      final response = await http.post(uri, body: body);
      return response;
    } catch(e){
      throw Exception();
    }
  }

}