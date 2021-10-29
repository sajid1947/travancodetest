


import 'package:flutter/cupertino.dart';
import 'package:travancodetest/pages/favourite/Favourite.dart';
import 'package:travancodetest/pages/homePage/HomePage.dart';
import 'package:travancodetest/pages/startApp/StartApp.dart';

Map <String,WidgetBuilder> routes={
  StartApp.startAppRoute:(context)=>StartApp(),
  HomePage.homePageRoute:(context)=>HomePage(),
  Favourite.FavouriteRoute:(context)=>Favourite()

};