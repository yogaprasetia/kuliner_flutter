import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kuliner_flutter/data/repository/user_repository.dart';
import 'package:kuliner_flutter/module/favourite/bloc/favourite_bloc.dart';
import 'package:kuliner_flutter/data/model/favourite_model.dart' as favouriteModel;
import 'package:kuliner_flutter/module/utils/widget/progress_loading_view.dart';

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

    Widget _buildFavouriteList(List<favouriteModel.Data> listFavourite) {
    return Column(
      children: [
        Expanded(
            child: ListView.builder(
          itemCount: listFavourite.length,
          itemBuilder: (context, index) {
            return Container(
              child: InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        width: 150.0,
                        height: 100.0,
                        child: Card(
                          clipBehavior: Clip.antiAlias,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)
                          ),
                          child: FadeInImage.assetNetwork(
                            placeholder: "assets/img_thumbnail.png", 
                            image: listFavourite[index].image,
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
                                        listFavourite[index].name,
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
                                        listFavourite[index].subDistrict.name,
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.grey),
                                      ),
                                    )),
                              ],
                            ),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                // Icons.favorite,
                                Icons.favorite_border,
                                color: Colors.pink,
                              )),
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
      create: (context) => favouriteBloc!,
      child: BlocConsumer<FavouriteBloc, FavouriteState>(
        listener: (context, state) {
          print('FavouriteState: state ${state.toString()}');
        },
        builder: (context, state) {
          if (state is FavouriteLoading) {
            return const ProgressLoadingView();
          } else if (state is FavouriteLoaded) {
            return Container(child: _buildFavouriteList(state.favouriteModel.data));
          } else {
            return Container();
          }
        },
      ),
    );
  }
}