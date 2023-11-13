import 'package:kuliner_flutter/data/constant.dart';
import 'package:kuliner_flutter/data/model/favourite_model.dart';
import 'package:kuliner_flutter/data/model/place_model.dart';
import 'package:kuliner_flutter/data/remote/api_service.dart';
import 'package:kuliner_flutter/data/preferences/pref_service.dart';

class UserRepository {
  final apiService = ApiService();
  final prefService = PrefService();

  Future<PlaceModel> getPlace() => apiService.getPlace(); 
  Future<FavouriteModel> getFavourite(String token) => apiService.getFavourite(token);

  Future<bool> get isLogin => prefService.getBool(Constant.prefIsLogin);
  Future setIsLogin(String token) async {
    await prefService.setBool(Constant.prefIsLogin, true);
    await setAuthToken(token);
  }
   Future<bool> get getAuthToken => prefService.getBool(Constant.prefAuthToken);
   Future setAuthToken(String token) async {
    await prefService.setString(Constant.prefAuthToken, token);
   }
}