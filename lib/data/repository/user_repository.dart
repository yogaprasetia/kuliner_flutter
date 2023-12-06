import 'package:kuliner_flutter/data/constant.dart';
import 'package:kuliner_flutter/data/model/favourite_model.dart';
import 'package:kuliner_flutter/data/model/place_model.dart';
import 'package:kuliner_flutter/data/model/profile_model.dart';
import 'package:kuliner_flutter/data/remote/api_service.dart';
import 'package:kuliner_flutter/data/preferences/pref_service.dart';
import 'package:kuliner_flutter/module/profile/bloc/profile_bloc.dart';

class UserRepository {
  final apiService = ApiService();
  final prefService = PrefService();

  Future<PlaceModel> getPlace() => apiService.getPlace(); 
  Future<FavouriteModel> getFavourite(String token) => apiService.getFavourite(token);

  Future<dynamic> userLogin(
    String email,
    String password,
  ) => apiService.userLogin(email, password);

  Future<bool> get isLogin => prefService.getBool(Constant.prefIsLogin);
  Future setIsLogin(String token) async {
    await prefService.setBool(Constant.prefIsLogin, true);
    await setAuthToken(token);
  }
  Future<String> get getAuthToken => prefService.getString(Constant.prefAuthToken);
   Future setAuthToken(String token) async {
    await prefService.setString(Constant.prefAuthToken, token);
   }

  Future userLogout() => prefService.setBool(Constant.prefIsLogin, false);

  Future<dynamic> userRegister(
    String name,
    String email,
    String password,
    String passwordConfirmation,
  ) => apiService.userRegister(name, email, password, passwordConfirmation);

  Future<ProfileModel> getProfile(String token) => apiService.getProfile(token);
}