import 'package:flutter/material.dart';
import 'package:kuliner_flutter/module/base/base_home_view.dart';


void main() => runApp(kulinerApp());

class kulinerApp extends StatelessWidget {
  const kulinerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kuliner App',
      theme: ThemeData(
        primarySwatch: Colors.pink
      ),
      home: const BaseHomeView(),
    );
  }
}