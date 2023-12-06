part of 'profile_bloc.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();
  
  @override
  List<Object> get props => [];
}

final class ProfileInitial extends ProfileState {}

final class ProfileIsLogin extends ProfileState {

  String token;
  ProfileIsLogin(this.token);

}

final class ProfileIsNotLogin extends ProfileState {}

final class ProfileLoading extends ProfileState {}

final class ProfileLoaded extends ProfileState {

  ProfileModel profileModel;
  ProfileLoaded(this.profileModel);

}

final class ProfileNotLoaded extends ProfileState {

  String message;
  ProfileNotLoaded(this.message);

}