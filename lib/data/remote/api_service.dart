import 'dart:convert';

import 'package:http/http.dart';
import 'package:http_interceptor/http/http.dart';
import 'package:kuliner_flutter/data/constant.dart';
import 'package:kuliner_flutter/data/model/error_model.dart';
import 'package:kuliner_flutter/data/model/favourite_add_model.dart';
import 'package:kuliner_flutter/data/model/favourite_delete_model.dart';
import 'package:kuliner_flutter/data/model/favourite_model.dart';
import 'package:kuliner_flutter/data/model/login_model.dart';
import 'package:kuliner_flutter/data/model/place_model.dart';
import 'package:kuliner_flutter/data/model/profile_model.dart';
import 'package:kuliner_flutter/data/model/register_model.dart';
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

  Future<FavouriteAddModel> addFavourite(
    String token, 
    int placeId
  ) async {
    final path = 'api/user/place/$placeId/favourite';
    final url = Uri.https(Constant.baseUrl, path);
    final response = await _client.post(
      url,
      headers: setHeader(token));
    final json = jsonDecode(response.body);
    return FavouriteAddModel.fromJson(json);
  }

  Future<FavouriteDeleteModel> deleteFavourite(
    String token, 
    int placeId
  ) async {
    final path = 'api/user/place/$placeId/favourite';
    final url = Uri.https(Constant.baseUrl, path);
    final response = await _client.delete(
      url,
      headers: setHeader(token));
    final json = jsonDecode(response.body);
    return FavouriteDeleteModel.fromJson(json);
  }

  Future<dynamic> userLogin(String email, String password) async {
    final url = Uri.https(Constant.baseUrl,Constant.apiLogin);
    final response = await _client.post(
      url,
      body: {
        "email": email,
        "password": password
      });
    final json = jsonDecode(response.body);
    try {
      return LoginModel.fromJson(json);
    } catch (e) {
      print(e.toString());
      return ErrorModel.fromJson(json);
    }
  }

    Future<dynamic> userRegister(String name, String email, String password, String passwordConfirmation) async {
    final url = Uri.https(Constant.baseUrl,Constant.apiRegister);
    final response = await _client.post(
      url,
      body: {
        "name" : name,
        "email": email,
        "password": password,
        "password_confirmation" : passwordConfirmation
      });
    final json = jsonDecode(response.body);
    try {
      return RegisterModel.fromJson(json);
    } catch (e) {
      print(e.toString());
      return ErrorModel.fromJson(json);
    }
  }

  Future<ProfileModel> getProfile(String token) async {
    final url = Uri.https(Constant.baseUrl,Constant.apiProfile);
    final response = await _client.get(
      url,
      headers: setHeader(token));
    final json = jsonDecode(response.body);
    return ProfileModel.fromJson(json);
  }
}