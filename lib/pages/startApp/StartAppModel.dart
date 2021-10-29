import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:travancodetest/dataModels/Coin.dart';
import 'package:travancodetest/pages/favourite/Favourite.dart';
import 'package:travancodetest/pages/homePage/HomePage.dart';

import 'package:http/http.dart' as http;

class StartAppModel extends ChangeNotifier{
  //for bottomNavigation Bar
  int selectedIndex=0;


  Coin fetchData;
 StartAppModel(){
   passData();
 }
  passData()async{
   fetchData= await getCoin();
  }

   bool isFetched=false;
  Coin coin;
  //Function to fetch Coins from API
  Future<Coin> getCoin() async {
    var client=http.Client();
    var url='https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?start=1&limit=600&convert=USD';
    http.Response response=await client.get(Uri.parse(url),headers: {
      'Accept': 'application/json',
      'X-CMC_PRO_API_KEY': '483f1185-dab3-4cab-8d1a-dc9f0059b3f6'
    });


    isFetched=true;
    if(response.statusCode==200)
    {
      coin=Coin.fromJson(jsonDecode(response.body));
      notifyListeners();
      return coin;
    }
    else
    {
      return coin;
    }

  }


  void onTapped(int index)async{
    selectedIndex=index;
    notifyListeners();
  }



}