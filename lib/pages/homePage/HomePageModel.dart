
import 'package:flutter/cupertino.dart';
import 'package:travancodetest/dataModels/Coin.dart';


class HomePageModel extends ChangeNotifier{

 Coin coin;
 Coin favourites;
 bool isFav=false;
 int favIndex;
 bool refreshScreen=false;
 HomePageModel({this.coin});

 var listofFav=[];

  //Function to update favorite list
 updateFavourite(index,isFav)
  {

      if(isFav==true) {
       if (listofFav.contains(coin.data[index])) {
        listofFav.remove(index);
        notifyListeners();
       }
       else {
        listofFav.add(coin.data[index]);
        notifyListeners();
       }
      }
      else
       {
        if(listofFav.contains(coin.data[index]))
         {
          listofFav.remove(coin.data[index]);
          notifyListeners();
         }
        else
         {
          notifyListeners();
         }
       }
  }


  //Function to Which Update State of single widget
  updateState()
  {
   notifyListeners();
  }

  //function which to on single Tap on Crypto Rows
 bool onTapped=false;
  int selectedIndex;
 onSelectContainer(){
  onTapped=true;
  notifyListeners();
 }


}