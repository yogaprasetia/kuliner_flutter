import 'dart:convert';

import 'package:http/http.dart';
import 'package:http_interceptor/http/http.dart';
import 'package:kuliner_flutter/data/constant.dart';
import 'package:kuliner_flutter/data/model/favourite_model.dart';
import 'package:kuliner_flutter/data/model/place_model.dart';
import 'package:kuliner_flutter/data/remote/logging_interceptor.dart';

class ApiService {

  final Client _client = InterceptedClient.build(interceptors: [
    LoggingInterceptor(),
  ]);

  Map<String, String> setHeader(String bearer) {
    return {
        'Content-Type': 'application/json',
        'Accept': 'applixation/json',
        'Authorization': 'Bearer $bearer'
      };
  }

  Future<PlaceModel> getPlace() async {
    final url = Uri.https(Constant.baseUrl,Constant.apiPlace);
    final response = await _client.get(url);
    final json = jsonDecode(response.body);
    return PlaceModel.fromJson(json);
  }

  Future<FavouriteModel> getFavourite(String token) async {
    final url = Uri.https(Constant.baseUrl,Constant.apiFavourite);
    final response = await _client.get(
      url,
      headers: setHeader(token));
    final json = jsonDecode(response.body);
    return FavouriteModel.fromJson(json);
  }
}