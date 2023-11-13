import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kuliner_flutter/data/constant.dart';
import 'package:kuliner_flutter/data/repository/user_repository.dart';
import 'package:kuliner_flutter/module/base/base_home_view.dart';
import 'package:kuliner_flutter/module/login/login_view.dart';


void main() => runApp(kulinerApp());

class kulinerApp extends StatelessWidget {
  const kulinerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => UserRepository(),
      child:  MaterialApp(
      title: 'Kuliner App',
      theme: ThemeData(
        primarySwatch: Colors.pink
      ),
      home: const BaseHomeView(),
      routes: {
        Constant.routeLogin: (_) => const LoginView()
      },),
      );
  }
}