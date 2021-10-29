import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';
import 'package:travancodetest/dataModels/Coin.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:travancodetest/pages/favourite/Favourite.dart';
import 'package:travancodetest/pages/homePage/HomePageModel.dart';


class HomePage extends StatelessWidget {
  static String homePageRoute ='/homepage';
  Coin fetchData;
  HomePage({this.fetchData});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_){
            return HomePageModel(coin:fetchData);
          },
        )
      ],
      child: Consumer<HomePageModel>(
        builder: (context,HomePageModel model,child){
          return Scaffold(
            appBar: AppBar(
              actions:<Widget>[
                IconButton(onPressed: (){

                  Navigator.pushNamed(context, Favourite.FavouriteRoute,
                      arguments:model.listofFav);
                }, icon: Icon(Icons.star,color:Colors.amber,)),
              ],
              title: const Text('Crypto Watch',
              style: TextStyle(color: Colors.white),),
            ),
            body: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight:Radius.circular(20.0)
                )
              ),
              child: ListView.builder(
                  itemCount:model.coin.data.length ,
                  itemBuilder: (context,index){
                var data=model.coin.data[index];
                return TextButton(
                  onPressed:(){
                    model.selectedIndex=index;
                    model.onSelectContainer();
                    model.updateState();
                  } ,
                    child: Card(
                      child: Column(
                        children:[

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              data.symbol,
                              style: TextStyle(
                                color:Colors.black,
                                fontSize: 20
                              ),
                            ),
                            Text(data.name),
                            FavoriteButton(
                              isFavorite: false,
                              valueChanged:(isFavorite){
                                model.updateFavourite(index,isFavorite);
                                model.updateState();
                              },),
                          ],
                        ),
                          Row(
                            mainAxisAlignment:MainAxisAlignment.spaceAround,
                            children: [
                              if(model.selectedIndex==index && model.onTapped==true)
                                                          Text('Price :'+data.quote.usd.price.toStringAsFixed(2),style:
                                                            TextStyle(fontWeight: FontWeight.bold)),
                              if(model.selectedIndex==index && model.onTapped==true)
                                Text('Market Cap: '+data.quote.usd.marketCap.toStringAsFixed(2)),


                            ],
                          ),
                          SizedBox(height:2,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              if(model.selectedIndex==index && model.onTapped==true)
                                Text('24H price '+data.quote.usd.percentChange24H.toStringAsFixed(3))
                            ],
                          )
                    ]),)
                );
              }),

              ),

          );
        },
      ),
    );
  }
}
