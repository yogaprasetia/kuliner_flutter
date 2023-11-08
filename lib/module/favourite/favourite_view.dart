import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kuliner_flutter/data/repository/user_repository.dart';
import 'package:kuliner_flutter/module/favourite/bloc/favourite_bloc.dart';

class FavouriteView extends StatefulWidget {
  const FavouriteView({super.key});

  @override
  State<FavouriteView> createState() => _FavouriteViewState();
}

class _FavouriteViewState extends State<FavouriteView> {

  FavouriteBloc? favouriteBloc;

  @override
  void initState() {
    favouriteBloc = FavouriteBloc(RepositoryProvider.of<UserRepository>(context));
    favouriteBloc?.add(GetFavouriteEvent('5|YM96SHenXX05oHAExmSNVhk0UfWJ9XvBdSxu8Cos5b81b629'));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Text("Favourite"),
      ),
    );
  }
}