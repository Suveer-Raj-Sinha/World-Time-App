import 'package:flutter/material.dart';
import 'package:new_world_time/pages/choose_location.dart';
import 'package:new_world_time/pages/home.dart';
import 'package:new_world_time/pages/loading.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/choose_location': (context) => ChooseLocation(),
    },
  ));
}