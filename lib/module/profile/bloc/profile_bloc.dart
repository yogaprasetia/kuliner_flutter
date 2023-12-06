import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kuliner_flutter/data/model/profile_model.dart';
import 'package:kuliner_flutter/data/repository/user_repository.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {

  UserRepository? userRepository;

  ProfileBloc(this.userRepository) : super(ProfileLoading()) {
    on<CheckLoginEvent>((event, emit) async {

      bool isLogin = false;
      await userRepository?.isLogin.then((value) {
        isLogin = value;
      });

      if (isLogin) {
        await userRepository?.getAuthToken.then((value) {
          emit(ProfileIsLogin( value ));
        });
      } else {
        emit(ProfileIsNotLogin());
      }
    });

    on<GetProfileEvent>((event, emit) async {
      emit(ProfileLoading());
      final response = await userRepository?.getProfile(event.token);
      final result = response != null ? ProfileLoaded(response) : ProfileNotLoaded('no_data');
      emit(result);
    });

    on<UserLogoutEvent>((event, emit) async {
      emit(ProfileLoading());
      await userRepository?.userLogout().then((value) {
        emit(ProfileIsNotLogin());
      });
    });
  }
}
