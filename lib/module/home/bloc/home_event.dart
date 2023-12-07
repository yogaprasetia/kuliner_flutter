part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class GetPlaceEvent extends HomeEvent {

  
}

class NoInternetEvent extends HomeEvent {
  String message;
  NoInternetEvent(this.message);

  @override
  List<Object> get props => [message];
}

class AddFavouriteEvent extends HomeEvent {
  int placeId;
  AddFavouriteEvent(this.placeId);

  @override
  List<Object> get props => [placeId];
}