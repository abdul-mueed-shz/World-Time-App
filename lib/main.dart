import 'package:flutter/material.dart';
import 'package:worldweather/pages/home.dart';
import 'package:worldweather/pages/loading.dart';
import 'package:worldweather/pages/choose_location.dart';


void main() {
  runApp(MaterialApp(

    initialRoute: '/',

    routes: {
      '/': (context) => Loading(),
      '/home': (context) => MyHome(),
      '/location': (context) => LocationChoose(),
    },
  ));
}
