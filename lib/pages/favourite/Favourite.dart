
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:travancodetest/pages/favourite/FavouriteModel.dart';
import 'package:provider/provider.dart';

class Favourite extends StatelessWidget {
  static String FavouriteRoute ='/favourite';
  var favData;
  @override
  Widget build(BuildContext context) {
    favData=ModalRoute.of(context).settings.arguments;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_){
            return FavouriteModel(favoriteList: favData);
          },
        )
      ],
      child: Consumer<FavouriteModel>(
        builder: (context,FavouriteModel model,child){
          return Scaffold(
            appBar: AppBar(
              title: Text('Favourites',
                style: TextStyle(color: Colors.white),),
            ),
            body:ListView.builder(
              itemCount:favData.length,
                itemBuilder:(context,index){
                if(favData.isNotEmpty) {
                  return Container(
                    padding: EdgeInsets.all(10.0),
                      child:Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(favData[index].symbol.toString(),style:const TextStyle(
                              fontSize:24
                            ),),
                            Text(favData[index].name.toString(),
                              style:const TextStyle(
                    fontSize: 20
                  ) ,),
                          ],
                        ),
                      ));
                } else
                  {
                    return Text('Empty');
                  }
                } )
          );
        },
      ),
    );
  }
}
