part of 'favourite_bloc.dart';

sealed class FavouriteState extends Equatable {
  const FavouriteState();
  
  @override
  List<Object> get props => [];
}

final class FavouriteInitial extends FavouriteState {}

final class FavouriteLoading extends FavouriteState {}

final class FavouriteLoaded extends FavouriteState {
  FavouriteModel favouriteModel;
  FavouriteLoaded(this.favouriteModel);
}

final class FavouriteNotLoaded extends FavouriteState {
  String message;
  FavouriteNotLoaded(this.message);
}

final class FavouriteIsLogin extends FavouriteState {
  String token;
  FavouriteIsLogin(this.token);

  @override
  List<Object> get props => [];
}

final class FavouriteIsNotLogin extends FavouriteState {

  @override
  List<Object> get props => [];
}

