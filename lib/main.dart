import 'package:flutter/material.dart';
import 'package:clocks/pages/home.dart';
import 'package:clocks/pages/loading.dart';
import 'package:clocks/pages/choose_location.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/location': (context) => ChooseLocation(),

    },

  ));
}

