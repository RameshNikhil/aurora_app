import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  var locStore; 

  HomeScreen({this.locStore});

  @override
  Widget build(BuildContext context) {

    var userName = locStore.getItem('userName');

    print(userName);


    return Container(
      child: Text(userName),
    );
  }
}