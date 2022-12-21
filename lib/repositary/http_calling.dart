import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/data_model.dart';

class HttpServices {
  Future<Welcome> getCall(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var dynamicList = jsonDecode(response.body);
      Welcome data = Welcome.fromJson(dynamicList as Map<String, dynamic>);
      print(data);
      return data;
    } else {
      throw "error";
    }
  }
}
