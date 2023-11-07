import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:kuliner_flutter/data/model/place_model.dart';
import 'package:kuliner_flutter/data/remote/connectivity_service.dart';
import 'package:kuliner_flutter/data/repository/user_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  UserRepository? userRepository;

  var connectivity = ConnectivityService();
  HomeBloc(
    this.userRepository
  ) : super(HomeLoading()) {
    connectivity.connectivityStream.stream.listen((event) {
      print('connectivityStream: event');
      if (event == ConnectivityResult.none) {
        add(NoInternetEvent('No Internet Connection'));
      } else {
        add(GetPlaceEvent());
      }
    },);
    on<GetPlaceEvent>((event, emit) async {
      emit(HomeLoading());
      final response = await userRepository?.getPlace();
      final result = response != null ? HomeLoaded(response) : HomeNotLoaded('no_data');
      emit(result);
    });
    on<NoInternetEvent>((event, emit) async {
      emit(HomeNoInternet(event.message));
      final response = await userRepository?.getPlace();
      final result = response != null ? HomeLoaded(response) : HomeNotLoaded('no_data');
      emit(result);
    });
  }
}
