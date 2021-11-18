import 'dart:convert';

import 'package:http/http.dart' as http;

class BaseApi {
  String _domain = "fakestoreapi.com";
  Map<String, String> _baseHeaders = {
    "Accept": "application/json",
    "Content-Type": "application/json",
  };

  Future<dynamic> getMethod(url, {body, headers, param}) async {
    Uri uri = Uri.https(_domain, url, param);
    try {
      _logRequest(url, "GET", param, body, headers ?? _baseHeaders);
      http.Response response =
      await http.get(uri, headers: headers ?? _baseHeaders);
      int statusCode = response.statusCode;
      _logResponse(url, statusCode, Utf8Decoder().convert(response.bodyBytes));
      return _handleResponse(statusCode, response);
    } catch (error) {
      throw Exception("Đã có lỗi xảy ra");
    }
  }

  dynamic _handleResponse(int statusCode, http.Response response) {
    dynamic data = jsonDecode(utf8.decode(response.bodyBytes));
    if (200 >= statusCode && statusCode <= 299) {
      return data;
    }
    if (statusCode == 401 || statusCode == 403) {
      throw Exception("Token expired");
    }
    if (400 <= statusCode && statusCode <= 499)
      throw Exception(data["error"]);
    else if (500 <= response.statusCode && response.statusCode <= 599)
      throw Exception("Server Error");
    else
      return data;
  }

  void _logRequest(String url, String method, dynamic param, dynamic body,
      Map<String, String> headers) {
    print("==================================================================");
    print("[${method.toUpperCase()}]");
    print("REQUEST TO API: $_domain$url With: \n");
    print("HEADER: " + headers.toString() + "\n");
    print("PARAMS: " + param.toString() + "\n");
    print("BODY: " + body.toString() + "\n");
    print("******************************************************************");
  }

  void _logResponse(String url, int statusCode, String body) {
    print("==================================================================");
    print("RESPONSE API: $_domain$url With: \n");
    print("STATUS CODE: $statusCode \n");
    print("BODY: $body \n");
    print("******************************************************************");
  }
}
