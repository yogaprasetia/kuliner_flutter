import 'dart:convert';

import 'package:http/http.dart';
import 'package:http_interceptor/http/http.dart';
import 'package:kuliner_flutter/data/constant.dart';
import 'package:kuliner_flutter/data/model/place_model.dart';
import 'package:kuliner_flutter/data/remote/logging_interceptor.dart';

class ApiService {

  Client _client = InterceptedClient.build(interceptors: [
    LoggingInterceptor(),
  ]);

  Future<PlaceModel> getPlace() async {
    final url = Uri.https(Constant.baseUrl,Constant.apiPlace);
    final response = await _client.get(url);
    final json = jsonDecode(response.body);
    return PlaceModel.fromJson(json);
  }
}