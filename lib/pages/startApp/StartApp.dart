import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travancodetest/pages/favourite/Favourite.dart';
import 'package:travancodetest/pages/homePage/HomePage.dart';
import 'StartAppModel.dart';

class StartApp extends StatelessWidget {
  static String startAppRoute = '/';
  @override
  Widget build(BuildContext context) {
    // indexFromSignInPage=ModalRoute.of(context).settings.arguments;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) {
          return StartAppModel();
        })
      ],
      child: Consumer<StartAppModel>(
          builder: (context, StartAppModel model, child) {
            return Scaffold(
              // body: model.optionsInNavigationBar.elementAt(model.selectedIndex),
              body:model.isFetched==true?model.selectedIndex==0?HomePage(fetchData:model.fetchData):Container()
              :Center(child: CircularProgressIndicator()),
              bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.white,
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.home_outlined,
                        color: Color(0xff3490de),
                      ),
                      label: 'Home'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.cloud_upload_outlined, color: Color(0xff3490de)),
                      label: 'Refresh'),
                  // BottomNavigationBarItem(
                  //     icon: Icon(Icons.person_outline, color: Color(0xff3490de)),
                  //     label: 'AboutUs'),

                ],
                onTap: model.onTapped,
              ),
            );
          }),
    );
  }
}