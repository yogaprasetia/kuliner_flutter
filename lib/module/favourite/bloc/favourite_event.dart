part of 'favourite_bloc.dart';

sealed class FavouriteEvent extends Equatable {
  const FavouriteEvent();

  @override
  List<Object> get props => [];
}

class GetFavouriteEvent extends FavouriteEvent {

  String token;
  GetFavouriteEvent(this.token);
  
    @override
  List<Object> get props => [token];
}