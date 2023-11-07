import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kuliner_flutter/data/repository/user_repository.dart';
import 'package:kuliner_flutter/module/home/bloc/home_bloc.dart';
import 'package:kuliner_flutter/data/model/place_model.dart' as placeModel;
import 'package:kuliner_flutter/module/utils/helper_utils.dart';
import 'package:kuliner_flutter/module/utils/widget/progress_loading_view.dart';

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
    return Column(
      children: [
        Expanded(
            child: ListView.builder(
          itemCount: listPlace.length,
          itemBuilder: (context, index) {
            return Container(
              child: InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 200.0,
                        child: Card(
                          clipBehavior: Clip.antiAlias,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)
                          ),
                          child: FadeInImage.assetNetwork(
                            placeholder: "assets/img_thumbnail.png", 
                            image: listPlace[index].image,
                            fit: BoxFit.cover,
                            imageErrorBuilder: (context, error, stackTrace) {
                              return Container(
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/img_thumbnail.png"),
                                    fit: BoxFit.cover
                                    )
                                ),
                              );
                            },
                            ),
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        listPlace[index].name,
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black87),
                                      ),
                                    )),
                                Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        listPlace[index].subDistrict.name,
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.grey),
                                      ),
                                    )),
                              ],
                            ),
                          ),
                          Container(
                            child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  // Icons.favorite,
                                  Icons.favorite_border,
                                  color: Colors.pink,
                                )),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        )),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => homeBloc!,
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          print('HomeState: state ${state.toString()}');
          if(state is HomeNoInternet) {
            toastMessage(context, state.message);
          }
        },
        builder: (context, state) {
          if (state is HomeLoading) {
            return ProgressLoadingView();
          } else if (state is HomeLoaded) {
            return Container(child: _buildPlaceList(state.placeModel.data));
          } else if (state is HomeNoInternet) {
            return Container();
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
