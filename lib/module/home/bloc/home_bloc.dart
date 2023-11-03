import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kuliner_flutter/data/model/place_model.dart';
import 'package:kuliner_flutter/data/repository/user_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  UserRepository? userRepository;
  HomeBloc(
    this.userRepository
  ) : super(HomeLoading()) {
    on<GetPlaceEvent>((event, emit) async {
      emit(HomeLoading());
      final response = await userRepository?.getPlace();
      final result = response != null ? HomeLoaded(response) : HomeNotLoaded('no_data');
      emit(result);
    });
  }
}
