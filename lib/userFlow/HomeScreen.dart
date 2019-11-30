import 'package:aurora_app/userFlow/CentralPage.dart';
import 'package:aurora_app/userFlow/messagePage.dart';
import 'package:flutter/material.dart';
import 'StatsBoard.dart';


class HomeScreen extends StatelessWidget {
  var locStore;

  HomeScreen({this.locStore});

  @override
  Widget build(BuildContext context) {

    PageController _homePageController = PageController(
      initialPage: 2,
      keepPage: false,
    );

    return PageView(
      controller: _homePageController,
      scrollDirection: Axis.horizontal,
      pageSnapping: true,
      physics: BouncingScrollPhysics(),
      children: <Widget>[

        //MessagePage(),
        StatsBoard(),
        CentralPage(locStore: locStore,)
        //MainMessagePage(),

        //Single Pages
       
      ],
    );
  }
}