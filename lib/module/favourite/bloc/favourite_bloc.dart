import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kuliner_flutter/data/model/favourite_model.dart';
import 'package:kuliner_flutter/data/repository/user_repository.dart';

part 'favourite_event.dart';
part 'favourite_state.dart';

class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteState> {
  UserRepository? userRepository;

  FavouriteBloc(
    this.userRepository
  ) : super(FavouriteLoading()) {
    on<GetFavouriteEvent>((event, emit) async {
      emit(FavouriteLoading());
      final response = await userRepository?.getFavourite(event.token);
      final result = response != null ? FavouriteLoaded(response) : FavouriteNotLoaded('no_data');
      emit(result);
    });

    on<CheckLoginEvent>((event, emit) async {

      bool isLogin = false;
      await userRepository?.isLogin.then((value) {
        isLogin = value;
      });

      if (isLogin) {
        await userRepository?.getAuthToken.then((value) {
          emit(FavouriteIsLogin( value ));
        });
      } else {
        emit(FavouriteIsNotLogin());
      }
    });
  }
}
