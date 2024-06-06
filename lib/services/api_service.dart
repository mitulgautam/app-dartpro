import 'dart:convert';
import 'package:dartcard/models/base_response_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:overlay_support/overlay_support.dart';

class ApiService {
  static Future<BaseResponseModel> fetchData(String apiEndPoint) async {
    String data = '';
    String message = '';
    try {
      var response = await http.get(Uri.parse(apiEndPoint));
      debugPrint('URL-->${Uri.parse(apiEndPoint)}');
      if (response.statusCode == 200) {
        debugPrint('RESPONSE-->${response.body}');
        data = response.body;
        message = 'SUCCESS';
      }
    } catch (e) {
      message = e.toString();
      data = '';
    }
    return BaseResponseModel(message: message, text: data);
  }

  static Future<BaseResponseModel> postData(
      String apiEndPoint, Object dataBody) async {
    String data = '';
    String message = '';
    try {
      var response = await http.post(Uri.parse(apiEndPoint),
          body: jsonEncode(dataBody),headers: {'Content-Type':'application/json'});
      debugPrint('URL-->${Uri.parse(apiEndPoint)}');
      debugPrint('BODY-->${jsonEncode(dataBody)}');
      if (response.statusCode == 201) {
        debugPrint('RESPONSE-->${response.body}');
        data = response.body;
        message = 'SUCCESS';
      }
      else{
        debugPrint('RESPONSE-->${response.body}');
        data = response.body;
        message = (json.decode(response.body))['message'];
      }
    } catch (e) {
      message = e.toString();
      data = '';
    }
    return BaseResponseModel(message: message, text: data);
  }
}
