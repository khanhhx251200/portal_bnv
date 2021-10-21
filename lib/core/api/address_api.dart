import 'dart:convert';

import 'package:app_mobile/core/models/response/address_response.dart';
import 'package:http/http.dart' as http;

class AddressApi {
  static Future<List<AddressResponse>> getCitys(String query) async {
    String url = '';
    // if(query.isEmpty){
    url = 'https://provinces.open-api.vn/api/p/';
    // } else {
    //   url = 'https://provinces.open-api.vn/api/p/search/?q=$query';
    // }
    Uri uri = Uri.parse(url);
    try {
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        var decoded = utf8.decode(response.bodyBytes);
        final List responseJson = json.decode(decoded);
        List<AddressResponse> list = (responseJson as List)
            .map((p) => AddressResponse.fromJson(p))
            .toList();

        return list.where((AddressResponse address) {
          final nameLower = address.name.toLowerCase();
          final queryLower = query.toLowerCase();
          print(
              'name: $nameLower && query: $queryLower: ${nameLower.contains(queryLower)}');
          return nameLower.contains(queryLower);
        }).toList();
        return list;
      } else {
        throw Exception();
      }
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<List<AddressResponse>> getDistrict(int id, String query) async {
    String url = 'https://provinces.open-api.vn/api/p/$id?depth=2';
    Uri uri = Uri.parse(url);
    try {
      print('url : $url');
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        var decoded = utf8.decode(response.bodyBytes);
        var responseJson = json.decode(decoded);
        List<AddressResponse> districts = (responseJson['districts'] as List)
            .map((p) => AddressResponse.fromJson(p))
            .toList();
        return districts.where((AddressResponse address) {
          final nameLower = address.name.toLowerCase();
          final queryLower = query.toLowerCase();
          print(
              'name: $nameLower && query: $queryLower: ${nameLower.contains(queryLower)}');
          return nameLower.contains(queryLower);
        }).toList();
      }
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<List<AddressResponse>> getWard(int id, String query) async {
    String url = 'https://provinces.open-api.vn/api/d/$id?depth=2';
    Uri uri = Uri.parse(url);
    print(url);
    try {
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        var decoded = utf8.decode(response.bodyBytes);
        var responseJson = json.decode(decoded);
        List<AddressResponse> wards = (responseJson['wards'] as List)
            .map((p) => AddressResponse.fromJson(p))
            .toList();
        return wards.where((AddressResponse address) {
          final nameLower = address.name.toLowerCase();
          final queryLower = query.toLowerCase();
          print(
              'name: $nameLower && query: $queryLower: ${nameLower.contains(queryLower)}');
          return nameLower.contains(queryLower);
        }).toList();
      }
    } catch (e) {
      throw e.toString();
    }
  }
}
