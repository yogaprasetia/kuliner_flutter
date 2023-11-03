part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();
  
  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeLoaded extends HomeState {
  PlaceModel placeModel;
  HomeLoaded(this.placeModel);
}

final class HomeNotLoaded extends HomeState {
  String message;
  HomeNotLoaded(this.message);
}
