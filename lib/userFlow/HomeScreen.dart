import 'package:aurora_app/userFlow/CentralPage.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {
  var locStore;

  HomeScreen({this.locStore});

  @override
  Widget build(BuildContext context) {

    PageController _homePageController = PageController(
      initialPage: 1,
      keepPage: false,
    );

    return PageView(
      controller: _homePageController,
      scrollDirection: Axis.horizontal,
      pageSnapping: true,
      physics: BouncingScrollPhysics(),
      children: <Widget>[

        CentralPage(locStore: locStore,)

        //Single Pages
       
      ],
    );
  }
}