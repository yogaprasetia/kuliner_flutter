import 'package:kuliner_flutter/data/model/place_model.dart';
import 'package:kuliner_flutter/data/remote/api_service.dart';

class UserRepository {
  final apiService = ApiService();

  Future<PlaceModel> getPlace() => apiService.getPlace();
}