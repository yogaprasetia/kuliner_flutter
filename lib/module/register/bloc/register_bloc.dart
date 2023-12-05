import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kuliner_flutter/data/model/error_model.dart';
import 'package:kuliner_flutter/data/model/register_model.dart';
import 'package:kuliner_flutter/data/model/register_model.dart';
import 'package:kuliner_flutter/data/model/register_model.dart';
import 'package:kuliner_flutter/data/model/register_model.dart';
import 'package:kuliner_flutter/data/model/register_model.dart';
import 'package:kuliner_flutter/data/repository/user_repository.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  UserRepository? userRepository;
  
  RegisterBloc( this.userRepository ) : super(RegisterInitial()) {
    on<UserRegisterEvent>((event, emit) async {
      emit(RegisterLoading());

      final response = await userRepository?.userRegister(
        event.name, event.email, event.password, event.passwordConfirmation);

      if (response is RegisterModel) {
        await userRepository?.setIsLogin(response.token);
        emit(RegisterLoaded(response));
        return;
      }

      if (response is ErrorModel) {
        emit(RegisterNotLoaded(response.message));
        return;
      }

      emit(RegisterNotLoaded('no_data'));
    });
  }
}
