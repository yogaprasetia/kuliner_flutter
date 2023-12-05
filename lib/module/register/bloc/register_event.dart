part of 'register_bloc.dart';

sealed class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class UserRegisterEvent extends RegisterEvent {

  String name;
  String email;
  String password;
  String passwordConfirmation;

  UserRegisterEvent(this.name, this.email, this.password, this.passwordConfirmation);
}
