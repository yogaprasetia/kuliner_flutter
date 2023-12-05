part of 'register_bloc.dart';

sealed class RegisterState extends Equatable {
  const RegisterState();
  
  @override
  List<Object> get props => [];
}

final class RegisterInitial extends RegisterState {}

final class RegisterLoading extends RegisterState {}

final class RegisterLoaded extends RegisterState {

  RegisterModel registerModel;
  RegisterLoaded(this.registerModel);
}

final class RegisterNotLoaded extends RegisterState {

  String message;
  RegisterNotLoaded(this.message);
}