part of 'profile_bloc.dart';

sealed class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class CheckLoginEvent extends ProfileEvent {

  @override
  List<Object> get props => [];
}

class GetProfileEvent extends ProfileEvent {

  String token;
  GetProfileEvent(this.token);

  @override
  List<Object> get props => [];
}

class UserLogoutEvent extends ProfileEvent {

  @override
  List<Object> get props => [];
}