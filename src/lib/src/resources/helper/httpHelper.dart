import 'dart:io';
import 'dart:convert';

import 'package:http/http.dart' as http;

/*
    Servisten bize 3 tür veri gelebilir.
      1. Liste.               List<dynamic>
      2. Bir Tane Model.      Map<String, dynamic>
      3. Primitive Bir Değer. Örneğin; bool.
*/

final http.Client httpClient = http.Client();

class HttpHelper {
  Future<dynamic> get(String istek) async {
    final http.Response response = await httpClient
        .get(istek, headers: {'Content-Type': 'application/json'});
    if (response.statusCode < HttpStatus.ok ||
        response.statusCode > HttpStatus.badRequest ||
        response.body == null) {
      throw Exception("Hata : ${response.statusCode}");
    }

    final responseData = json.decode(utf8.decode(response.bodyBytes));
    return responseData;
  }

  Future<dynamic> post(String istek, Map json) async {
    final http.Response response = await http.post(istek, body: json);
    if (response.statusCode < HttpStatus.ok ||
        response.statusCode > HttpStatus.badRequest ||
        response.body == null) {
      throw Exception("Hata : " + response.statusCode.toString());
    }

    return response;
  }

  Future<dynamic> put(String istek, Map json) async {
    final http.Response response = await http.put(istek, body: json);
    if (response.statusCode < HttpStatus.ok ||
        response.statusCode > HttpStatus.badRequest ||
        response.body == null) {
      throw Exception("Hata : " + response.statusCode.toString());
    }

    return response;
  }

  Future<dynamic> delete(String istek) async {
    final http.Response response = await http.delete(istek);
    if (response.statusCode < HttpStatus.ok ||
        response.statusCode > HttpStatus.badRequest ||
        response.body == null) {
      throw Exception("Hata : " + response.statusCode.toString());
    }

    return response;
  }
}
