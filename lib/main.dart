import 'package:flutter/material.dart';
import 'package:travancodetest/pages/homePage/HomePage.dart';
import 'package:travancodetest/pages/startApp/StartApp.dart';
import 'package:travancodetest/routes/routes.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      primarySwatch: Colors.blue
    ),
    initialRoute: StartApp.startAppRoute,
    routes: routes,
  ));
}
