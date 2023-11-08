import 'package:kuliner_flutter/data/model/favourite_model.dart';
import 'package:kuliner_flutter/data/model/place_model.dart';
import 'package:kuliner_flutter/data/remote/api_service.dart';

class UserRepository {
  final apiService = ApiService();

  Future<PlaceModel> getPlace() => apiService.getPlace(); 
  Future<FavouriteModel> getFavourite(String token) => apiService.getFavourite(token); 
}