import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kuliner_flutter/data/repository/user_repository.dart';
import 'package:kuliner_flutter/module/home/bloc/home_bloc.dart';
import 'package:kuliner_flutter/data/model/place_model.dart' as placeModel;

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  HomeBloc? homeBloc;

  @override
  void initState() {
    homeBloc = HomeBloc(RepositoryProvider.of<UserRepository>(context));
    homeBloc?.add(GetPlaceEvent());
    super.initState();
  }

  Widget _buildPlaceList(List<placeModel.Data> listPlace) {
    
  }

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => homeBloc!,
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          print('HomeState: state ${state.toString()}');
        },
        builder: (context, state) {
          if (state is HomeLoading) {
            return Container();
          } else if (state is HomeLoaded) {
            return Container(
            child: _buildPlaceList(state.placeModel.data)
          );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}