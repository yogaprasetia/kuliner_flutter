import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kuliner_flutter/data/model/error_model.dart';
import 'package:kuliner_flutter/data/model/login_model.dart';
import 'package:kuliner_flutter/data/repository/user_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {

  UserRepository? userRepository;
  
  LoginBloc( this.userRepository ) : super(LoginInitial()) {
    on<UserLoginEvent>((event, emit) async {
      emit(LoginLoading());

      final response = await userRepository?.userLogin(
        event.email, event.password);

      if (response is LoginModel) {
        await userRepository?.setIsLogin(response.token);
        emit(LoginLoaded(response));
        return;
      }

      if (response is ErrorModel) {
        emit(LoginNotLoaded(response.message));
        return;
      }

      emit(LoginNotLoaded('no_data'));
    });
  }
}
