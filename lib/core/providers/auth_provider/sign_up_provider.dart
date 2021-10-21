import 'dart:convert';

import 'package:app_mobile/core/api/auth_api.dart';
import 'package:app_mobile/core/models/request/sign_up_request.dart';
import 'package:flutter/material.dart';

class SignUpProvider extends ChangeNotifier{
  AuthApi _authApi = AuthApi();
  SignUpRequest _signUpRequest;
  bool statusSignUp = false;

  SignUpRequest get signUpRequest => _signUpRequest;
  set setSignUpRequest(SignUpRequest request) => _signUpRequest = request;

  Future<dynamic> signUp(SignUpRequest request) async{
      final response = await _authApi.register(request);
      var decoded = utf8.decode(response.bodyBytes);
      var responseJson = json.decode(decoded);
      return responseJson;
  }
}