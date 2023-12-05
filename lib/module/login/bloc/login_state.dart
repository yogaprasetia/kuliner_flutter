part of 'login_bloc.dart';

sealed class LoginState extends Equatable {
  const LoginState();
  
  @override
  List<Object> get props => [];
}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginLoaded extends LoginState {

  LoginModel loginModel;
  LoginLoaded(this.loginModel);
}

final class LoginNotLoaded extends LoginState {

  String message;
  LoginNotLoaded(this.message);
}