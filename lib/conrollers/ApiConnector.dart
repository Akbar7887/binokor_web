import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../models/uij.dart';

class ApiConnector extends GetConnect {

  Map<String, String> header = {
    'Content-Type': 'application/json',

    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Credentials': 'true',
    'Access-Control-Allow-Methods': 'GET, POST, OPTIONS',
    'Access-Control-Allow-Headers': 'Origin, Content-Type, Accept'
  };

  Future<List<dynamic>> getall(String url) async {
    Uri uri = Uri.parse("${UiJ.url}${url}");
    final response = await http.get(uri);

    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonDecode(utf8.decode(response.bodyBytes));
    } else {
      throw Exception("Error");
    }
  }

  Future<dynamic> save(String url, dynamic object) async{
    Uri uri = Uri.parse("${UiJ.url}${url}");

    final response = await http.post(uri, body: json.encode(object), headers: header);

    if (response.statusCode == 200
        || response.statusCode == 201) {
      return jsonDecode(utf8.decode(response.bodyBytes));

    } else {
      throw Exception("Error");
    }
  }

}
