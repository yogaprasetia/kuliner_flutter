import 'package:flutter/material.dart';
import 'package:kuliner_flutter/data/home_menu_model.dart';
import 'package:kuliner_flutter/module/favourite/favourite_view.dart';
import 'package:kuliner_flutter/module/home/home_view.dart';
import 'package:kuliner_flutter/module/profile/profile_view.dart';

class BaseHomeView extends StatefulWidget {
  const BaseHomeView({super.key});

  @override
  State<BaseHomeView> createState() => _BaseHomeViewState();
}

class _BaseHomeViewState extends State<BaseHomeView> {

  int _menuSelected = 0;
  HomeMenu _homeMenu = HomeMenu.placeSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: _buildContainerView(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        items: const <BottomNavigationBarItem> [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favourite'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile'
          )
        ],
        currentIndex: _menuSelected,
        selectedItemColor: Colors.pink,
        onTap: _onMenuTapped,
      ),
    );
  }

  Widget _buildContainerView() {
    if (_homeMenu == HomeMenu.placeSelected) {
      return HomeView();
    } else if (_homeMenu == HomeMenu.favouriteSelected) {
      return FavouriteView();
    } else if (_homeMenu == HomeMenu.profileSelected) {
      return ProfileView();
    } else {
      return Container();
    }
  }

  void _onMenuTapped(int index) {
    setState(() {
      _menuSelected = index;
      switch (_menuSelected) {
        case 0:
          _homeMenu = HomeMenu.placeSelected;
          break;
        case 1:
          _homeMenu = HomeMenu.favouriteSelected;
          break;
        case 2:
          _homeMenu = HomeMenu.profileSelected;
          break;
      }
    });
  }
}